// MediaRepository - Manages media-related state and file downloads
// Part of the focused repository pattern to reduce TelegramProvider complexity

import 'dart:async';

import 'package:flutter/foundation.dart';

import '../tdlib/generated/td_objects.dart';
import '../services/telegram_isolate_service.dart';

/// Repository for managing media files and downloads.
///
/// Responsibilities:
/// - File download tracking
/// - Download progress updates
/// - Media caching info
/// - Shared media in chats
class MediaRepository extends ChangeNotifier {
  final TelegramIsolateService _isolateService;
  StreamSubscription<Map<String, dynamic>>? _eventSubscription;

  // State
  final Map<int, TdFile> _filesCache = {};
  final Map<int, double> _downloadProgress = {};
  final Set<int> _activeDownloads = {};
  String? _error;

  // Getters
  String? get error => _error;
  Set<int> get activeDownloads => Set.unmodifiable(_activeDownloads);

  MediaRepository({TelegramIsolateService? isolateService})
      : _isolateService = isolateService ?? TelegramIsolateService.instance;

  /// Initialize the repository and start listening to events
  Future<void> initialize() async {
    _eventSubscription = _isolateService.rawEventStream.listen(_handleEvent);
  }

  /// Get a file from cache
  TdFile? getFile(int fileId) => _filesCache[fileId];

  /// Get download progress for a file (0.0 to 1.0)
  double getDownloadProgress(int fileId) => _downloadProgress[fileId] ?? 0.0;

  /// Check if a file is being downloaded
  bool isDownloading(int fileId) => _activeDownloads.contains(fileId);

  /// Start downloading a file
  Future<void> downloadFile(int fileId, {int priority = 1}) async {
    if (_activeDownloads.contains(fileId)) return;

    _activeDownloads.add(fileId);
    _downloadProgress[fileId] = 0.0;
    notifyListeners();

    try {
      await _isolateService.sendAsyncRaw({
        '@type': 'downloadFile',
        'file_id': fileId,
        'priority': priority,
        'offset': 0,
        'limit': 0,
        'synchronous': false,
      });
    } catch (e) {
      _error = e.toString();
      _activeDownloads.remove(fileId);
      notifyListeners();
    }
  }

  /// Cancel an active download
  Future<void> cancelDownload(int fileId) async {
    if (!_activeDownloads.contains(fileId)) return;

    try {
      await _isolateService.sendAsyncRaw({
        '@type': 'cancelDownloadFile',
        'file_id': fileId,
        'only_if_pending': false,
      });
      _activeDownloads.remove(fileId);
      _downloadProgress.remove(fileId);
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  void _handleEvent(Map<String, dynamic> event) {
    final type = event['@type'] as String?;
    if (type == null) return;

    switch (type) {
      case 'updateFile':
        _handleFileUpdate(event);
        break;
    }
  }

  void _handleFileUpdate(Map<String, dynamic> event) {
    final fileData = event['file'] as Map<String, dynamic>?;
    if (fileData == null) return;

    final file = TdFile.fromMap(fileData);
    _filesCache[file.id] = file;

    // Update download progress
    if (_activeDownloads.contains(file.id)) {
      final local = file.local;
      if (local != null) {
        if (local.isDownloadingCompleted) {
          // Download complete
          _downloadProgress[file.id] = 1.0;
          _activeDownloads.remove(file.id);
        } else if (local.isDownloadingActive) {
          // Update progress
          final expectedSize =
              file.expectedSize > 0 ? file.expectedSize : file.size;
          if (expectedSize > 0) {
            // Safety: expectedSize checked > 0
            _downloadProgress[file.id] = local.downloadedSize / expectedSize;
          } else {
            _downloadProgress[file.id] = 0.0;
          }
        }
      }
    }

    notifyListeners();
  }

  /// Get shared media for a chat
  Future<List<TdMessage>> getSharedMedia(int chatId,
      {String filterType = 'searchMessagesFilterPhotoAndVideo',
      int limit = 20}) async {
    try {
      final result = await _isolateService.sendAsyncRaw({
        '@type': 'searchChatMessages',
        'chat_id': chatId,
        'query': '',
        'sender_id': null,
        'from_message_id': 0,
        'offset': 0,
        'limit': limit,
        'filter': {'@type': filterType},
        'message_thread_id': 0,
        'saved_messages_topic_id': 0,
      });

      if (result != null && result['@type'] == 'foundChatMessages') {
        final messagesData = result['messages'] as List<dynamic>? ?? [];
        return messagesData
            .map((m) => TdMessage.fromMap(m as Map<String, dynamic>))
            .toList();
      }
      return [];
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return [];
    }
  }

  @override
  void dispose() {
    _eventSubscription?.cancel();
    super.dispose();
  }
}
