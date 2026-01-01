// ChatRepository - Manages chat-related state and events
// Part of the focused repository pattern to reduce TelegramProvider complexity

import 'dart:async';

import 'package:flutter/foundation.dart';

import '../tdlib/generated/td_objects.dart';
import '../services/telegram_isolate_service.dart';

/// Repository for managing chat-related data and state.
///
/// Responsibilities:
/// - Chat list management
/// - Chat updates
/// - Unread counts
/// - Draft messages
class ChatRepository extends ChangeNotifier {
  final TelegramIsolateService _isolateService;
  StreamSubscription<Map<String, dynamic>>? _eventSubscription;

  // State
  final Map<int, TdChat> _chatsCache = {};
  final List<TdChat> _chatList = [];
  bool _isLoading = false;
  String? _error;

  // Getters
  bool get isLoading => _isLoading;
  String? get error => _error;
  List<TdChat> get chats => List.unmodifiable(_chatList);

  ChatRepository({TelegramIsolateService? isolateService})
      : _isolateService = isolateService ?? TelegramIsolateService.instance;

  /// Initialize the repository and start listening to events
  Future<void> initialize() async {
    _eventSubscription = _isolateService.rawEventStream.listen(_handleEvent);
  }

  /// Get a chat from cache
  TdChat? getChat(int chatId) => _chatsCache[chatId];

  /// Load chat list
  Future<void> loadChats({int limit = 100}) async {
    _isLoading = true;
    notifyListeners();

    try {
      final result = await _isolateService.sendAsyncRaw({
        '@type': 'getChats',
        'chat_list': {'@type': 'chatListMain'},
        'limit': limit,
      });
      if (result != null && result['@type'] == 'chats') {
        final chatIds =
            (result['chat_ids'] as List<dynamic>?)?.cast<int>() ?? [];

        for (final chatId in chatIds) {
          final chatResult = await _isolateService.sendAsyncRaw({
            '@type': 'getChat',
            'chat_id': chatId,
          });
          if (chatResult != null && chatResult['@type'] == 'chat') {
            final chat = TdChat.fromMap(chatResult);
            _chatsCache[chat.id] = chat;
            if (!_chatList.any((c) => c.id == chat.id)) {
              _chatList.add(chat);
            }
          }
        }
        _sortChatList();
        _error = null;
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void _handleEvent(Map<String, dynamic> event) {
    final type = event['@type'] as String?;
    if (type == null) return;

    switch (type) {
      case 'updateNewChat':
        _handleNewChat(event);
        break;
      case 'updateChatTitle':
        _handleChatTitleUpdate(event);
        break;
      case 'updateChatLastMessage':
        _handleChatLastMessageUpdate(event);
        break;
      case 'updateChatPosition':
        _handleChatPositionUpdate(event);
        break;
      case 'updateChatReadInbox':
        _handleChatReadInboxUpdate(event);
        break;
      case 'updateChatUnreadMentionCount':
        _handleUnreadMentionUpdate(event);
        break;
    }
  }

  void _handleNewChat(Map<String, dynamic> event) {
    final chatData = event['chat'] as Map<String, dynamic>?;
    if (chatData == null) return;

    final chat = TdChat.fromMap(chatData);
    _chatsCache[chat.id] = chat;
    if (!_chatList.any((c) => c.id == chat.id)) {
      _chatList.add(chat);
      _sortChatList();
    }
    notifyListeners();
  }

  void _handleChatTitleUpdate(Map<String, dynamic> event) {
    final chatId = event['chat_id'] as int?;
    final title = event['title'] as String?;
    if (chatId == null || title == null) return;

    final chat = _chatsCache[chatId];
    if (chat != null) {
      // Workaround for immutable TdChat: convert to map, update, recreate
      try {
        final map = chat.toMap();
        map['title'] = title;
        final newChat = TdChat.fromMap(map);
        // if (newChat != null) { // Analyzer says non-nullable
        _chatsCache[chatId] = newChat;
        final index = _chatList.indexWhere((c) => c.id == chatId);
        if (index != -1) {
          _chatList[index] = newChat;
        }
        notifyListeners();
        // }
      } catch (e) {
        debugPrint("Error updating chat title: $e");
      }
    }
  }

  void _handleChatLastMessageUpdate(Map<String, dynamic> event) {
    final chatId = event['chat_id'] as int?;
    if (chatId == null) return;

    // Update chat ordering based on new message
    _sortChatList();
    notifyListeners();
  }

  void _handleChatPositionUpdate(Map<String, dynamic> event) {
    // Resort chat list based on position updates
    _sortChatList();
    notifyListeners();
  }

  void _handleChatReadInboxUpdate(Map<String, dynamic> event) {
    final chatId = event['chat_id'] as int?;
    if (chatId == null) return;

    notifyListeners();
  }

  void _handleUnreadMentionUpdate(Map<String, dynamic> event) {
    final chatId = event['chat_id'] as int?;
    if (chatId == null) return;

    notifyListeners();
  }

  void _sortChatList() {
    // Sort by last message date (most recent first)
    // In real implementation, would use chat positions
    _chatList.sort((a, b) {
      final aTime = a.lastMessage?.date ?? 0;
      final bTime = b.lastMessage?.date ?? 0;
      return bTime.compareTo(aTime);
    });
  }

  @override
  void dispose() {
    _eventSubscription?.cancel();
    super.dispose();
  }
}
