// UserRepository - Manages user-related state and events
// Part of the focused repository pattern to reduce TelegramProvider complexity

import 'dart:async';

import 'package:flutter/foundation.dart';

import '../tdlib/generated/td_objects.dart';
import '../services/telegram_isolate_service.dart';

/// Repository for managing user-related data and state.
///
/// Responsibilities:
/// - Current user profile (me)
/// - User cache
/// - User status updates
/// - Contacts
class UserRepository extends ChangeNotifier {
  final TelegramIsolateService _isolateService;
  StreamSubscription<Map<String, dynamic>>? _eventSubscription;

  // State
  TdUser? _currentUser;
  final Map<int, TdUser> _usersCache = {};
  final List<TdUser> _contacts = [];
  bool _isLoading = false;
  String? _error;

  // Getters
  TdUser? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  String? get error => _error;
  List<TdUser> get contacts => List.unmodifiable(_contacts);

  UserRepository({TelegramIsolateService? isolateService})
      : _isolateService = isolateService ?? TelegramIsolateService.instance;

  /// Initialize the repository and start listening to events
  Future<void> initialize() async {
    _eventSubscription = _isolateService.rawEventStream.listen(_handleEvent);
  }

  /// Get a user from cache
  TdUser? getUser(int userId) => _usersCache[userId];

  /// Load current user profile
  /// Load current user profile (Robust)
  Future<void> loadCurrentUser({int maxRetries = 3}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    for (int retry = 0; retry < maxRetries; retry++) {
      try {
        final result = await _isolateService.sendAsyncRaw({'@type': 'getMe'});
        if (result != null && result['@type'] == 'user') {
          _currentUser = TdUser.fromMap(result);
          _usersCache[_currentUser!.id] = _currentUser!; // Cache
          debugPrint('✅ [Repo] Profil loaded: ${_currentUser!.firstName}');
          _error = null;
          break; // Sukses
        }
      } catch (e) {
        _error = e.toString();
        debugPrint('❌ [Repo] Load profil gagal (retry $retry): $_error');
        if (retry < maxRetries - 1) {
          await Future.delayed(Duration(seconds: 2 * (retry + 1)));
        }
      }
    }
    _isLoading = false;
    notifyListeners();

    // Critical: If failing after retries, ensure we know
    if (_currentUser == null) {
      debugPrint("❌ [Repo] CRITICAL: Failed to load current user.");
      // throw Exception('Gagal load profil setelah $maxRetries retries'); // Optional: throw to caller
    }
  }

  /// Load contacts list (Robust)
  Future<void> loadContacts({int maxRetries = 3}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    // Note: We skip FlutterContacts permission check here to focus on TDLib contacts.
    // Use manual import (syncDeviceContacts in Provider) if needed.

    for (int retry = 0; retry < maxRetries; retry++) {
      try {
        debugPrint("🚀 [Repo] Loading contacts (Attempt ${retry + 1})...");
        final contactsResult =
            await _isolateService.sendAsyncRaw({'@type': 'getContacts'});

        if (contactsResult != null && contactsResult['@type'] == 'users') {
          // Note: TdLib 'getContacts' returns 'users' object with 'user_ids'
          // Check schema: getContacts returns 'Users' (which has 'user_ids').
          // In some versions it's 'contacts' but TdLib 1.8+ usually it's 'users' or 'contactIds'?
          // My file view showed 'users'. I will stick to what I saw working or 'users'.
          // User prompt said "getContacts = Contacts;".
          // I'll handle both or stick to 'users' if I saw it before.
          // Step 986 showed `result['@type'] == 'users'` and `user_ids`. So 'users' is correct for this version of TDLib.

          final userIds =
              (contactsResult['user_ids'] as List<dynamic>?)?.cast<int>() ?? [];
          final List<TdUser> tempContacts = [];

          for (int id in userIds) {
            final userResult = await _isolateService
                .sendAsyncRaw({'@type': 'getUser', 'user_id': id});
            if (userResult != null && userResult['@type'] == 'user') {
              final user = TdUser.fromMap(userResult);
              tempContacts.add(user);
              _usersCache[id] = user;
            }
          }

          _contacts.clear();
          _contacts.addAll(tempContacts);
          debugPrint('✅ [Repo] Loaded ${_contacts.length} Telegram contacts');
          _error = null;
          break;
        }
      } catch (e) {
        _error = e.toString();
        debugPrint('❌ [Repo] Load kontak gagal (retry $retry): $_error');
        if (retry < maxRetries - 1) {
          await Future.delayed(Duration(seconds: 2 * (retry + 1)));
        }
      }
    }

    _isLoading = false;
    notifyListeners();
  }

  void _handleEvent(Map<String, dynamic> event) {
    final type = event['@type'] as String?;
    if (type == null) return;

    switch (type) {
      case 'updateUser':
        _handleUserUpdate(event);
        break;
      case 'updateUserStatus':
        _handleUserStatusUpdate(event);
        break;
    }
  }

  void _handleUserUpdate(Map<String, dynamic> event) {
    final userData = event['user'] as Map<String, dynamic>?;
    if (userData == null) return;

    final user = TdUser.fromMap(userData);
    _usersCache[user.id] = user;

    // Update current user if this is us
    if (_currentUser != null && user.id == _currentUser!.id) {
      _currentUser = user;
    }

    // Update in contacts list
    final contactIndex = _contacts.indexWhere((c) => c.id == user.id);
    if (contactIndex >= 0) {
      _contacts[contactIndex] = user;
    }

    notifyListeners();
  }

  void _handleUserStatusUpdate(Map<String, dynamic> event) {
    final userId = event['user_id'] as int?;
    final statusData = event['status'] as Map<String, dynamic>?;
    if (userId == null || statusData == null) return;

    // Update user status in cache
    final existingUser = _usersCache[userId];
    if (existingUser != null) {
      // Note: This would require TdUser to have a copyWith or status field
      // For now, we just notify and let consumers re-fetch if needed
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _eventSubscription?.cancel();
    super.dispose();
  }
}
