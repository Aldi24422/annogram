import 'package:flutter/foundation.dart';
import '../tdlib/generated/td_objects.dart';
import '../services/telegram_isolate_service.dart';

/// Repository for managing user-related data (Profile, Contacts, Cache)
/// using strict caching and robust ID handling.
class UserRepository extends ChangeNotifier {
  final TelegramIsolateService _isolateService;

  // STRICT TYPED CACHE: Map<UserId, TdUser with full info>
  final Map<int, TdUser> _usersCache = {};

  // State
  TdUser? _currentUser;
  List<TdUser> _contacts = [];
  int? _myId;
  String? _error;
  bool _isLoading = false;

  // Getters
  TdUser? get currentUser => _currentUser;
  List<TdUser> get contacts => List.unmodifiable(_contacts);
  String? get error => _error;
  bool get isLoading => _isLoading;

  UserRepository({TelegramIsolateService? isolateService})
      : _isolateService = isolateService ?? TelegramIsolateService.instance;

  // ---------------------------------------------------------------------------
  // Event Delegation (Called from TelegramProvider)
  // ---------------------------------------------------------------------------

  void handleEvent(Map<String, dynamic> event) {
    final type = event['@type'];
    if (type == null) return;

    switch (type) {
      case 'updateUser':
        // 'updateUser' has a 'user' field containing the object
        _handleUserUpdate(event['user']);
        break;

      case 'user':
        // Direct 'user' object (e.g. response from getUser/getMe)
        _handleUserUpdate(event);
        break;

      case 'updateOption':
        if (event['name'] == 'my_id') {
          _handleMyIdUpdate(event);
        }
        break;

      case 'updateUserStatus':
        _handleUserStatusUpdate(event);
        break;
    }
  }

  /// Centralized User Update Logic: Always Cache!
  void _handleUserUpdate(Map<String, dynamic> userData) {
    try {
      final user = TdUser.fromMap(userData);

      // 1. ALWAYS Update Cache
      _usersCache[user.id] = user;

      // 2. Check if this is "Me" (Fixes Race Condition)
      if (_myId != null && user.id == _myId) {
        _currentUser = user;
        debugPrint(
            '👤 [Repo] ME updated from stream (ID: $_myId): ${user.firstName}');
        notifyListeners();
      }

      // 3. Update Contact List if matches
      final index = _contacts.indexWhere((u) => u.id == user.id);
      if (index != -1) {
        _contacts[index] = user;
        notifyListeners();
      }
    } catch (e) {
      debugPrint('❌ [Repo] Failed to parse TdUser: $e');
    }
  }

  /// Handles "my_id" update from updateOption
  void _handleMyIdUpdate(Map<String, dynamic> event) {
    // Robust parsing for OptionValue
    var value = event['value'];
    int? newId;

    if (value is int) {
      newId = value;
    } else if (value is Map && value['value'] is int) {
      newId = value['value'];
    }

    if (newId != null && newId != 0) {
      _myId = newId;
      debugPrint('🔑 [Repo] My ID set to: $_myId');

      // IMMEDIATE CACHE LOOKUP
      if (_usersCache.containsKey(_myId)) {
        _currentUser = _usersCache[_myId];
        debugPrint('✅ [Repo] Found ME in cache immediately!');
        notifyListeners();
      } else {
        // Not in cache? Fetch it explicitly
        debugPrint('⚠️ [Repo] Me not in cache, fetching getUser($_myId)...');
        _isolateService.send({'@type': 'getUser', 'user_id': _myId});
      }
    }
  }

  void _handleUserStatusUpdate(Map<String, dynamic> event) {
    final userId = event['user_id'] as int?;
    if (userId != null && _usersCache.containsKey(userId)) {
      // Ideally we update the status inside TdUser, but TdUser is immutable/generated.
      // We notify listeners so UI can re-render or re-fetch.
      notifyListeners();
    }
  }

  // ---------------------------------------------------------------------------
  // Action Methods
  // ---------------------------------------------------------------------------

  /// Load current user profile (Manual trigger)
  Future<void> loadCurrentUser() async {
    // If we don't know my_id, ask for it
    _isolateService.send({'@type': 'getOption', 'name': 'my_id'});

    // Also try getMe directly as backup
    try {
      final result = await _isolateService.sendAsyncRaw({'@type': 'getMe'});
      if (result != null && result['@type'] == 'user') {
        handleEvent(result);
      }
    } catch (e) {
      // Ignore if getMe fails (e.g. logging out), rely on stream
      debugPrint("ℹ️ [Repo] loadCurrentUser: getMe failed/skipped.");
    }
  }

  /// Load contacts from TDLib
  Future<void> loadContacts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      debugPrint("🚀 [Repo] Fetching Contact IDs via getContacts...");
      final result =
          await _isolateService.sendAsyncRaw({'@type': 'getContacts'});

      if (result != null &&
          (result['@type'] == 'users' || result['user_ids'] != null)) {
        final ids = (result['user_ids'] as List<dynamic>?)?.cast<int>() ?? [];
        debugPrint("📋 [Repo] Found ${ids.length} contact IDs.");

        List<TdUser> loadedContacts = [];

        for (final id in ids) {
          // 1. Check Cache
          if (_usersCache.containsKey(id)) {
            loadedContacts.add(_usersCache[id]!);
          } else {
            // 2. Fetch if missing
            final userRes = await _isolateService
                .sendAsyncRaw({'@type': 'getUser', 'user_id': id});
            if (userRes != null && userRes['@type'] == 'user') {
              // Manual Cache Insert via Handle logic
              // We call handleEvent so it goes through standard pipeline
              // But wait, synchronous accumulation is better here
              final u = TdUser.fromMap(userRes);
              _usersCache[id] = u;
              loadedContacts.add(u);
            }
          }
        }

        _contacts = loadedContacts;
        debugPrint(
            "✅ [Repo] Contacts List Updated: ${_contacts.length} users.");
      }
    } catch (e) {
      _error = e.toString();
      debugPrint("❌ [Repo] Load contacts failed: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
