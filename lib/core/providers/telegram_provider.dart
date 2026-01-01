import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_contacts/flutter_contacts.dart' as fc;
import '../services/telegram_isolate_service.dart';
import '../services/notification_service.dart';
import '../repositories/user_repository.dart';
import '../../data/models/chat/chat_model.dart';
import '../../data/models/chat/message_model.dart';
import '../../data/models/chat/user_model.dart';
import '../../data/models/chat/sticker_model.dart';
import '../../data/models/call/call_model.dart';
import '../../data/models/chat/chat_member_model.dart';
import '../../main.dart';

enum InitializationState {
  idle,
  initializing,
  waitingForAuth,
  loadingProfile,
  loadingContacts,
  ready,
  error
}

class TelegramProvider extends ChangeNotifier {
  final TelegramIsolateService _telegramService =
      TelegramIsolateService.instance;
  final NotificationService _notificationService = NotificationService();
  final UserRepository _userRepository = UserRepository();

  // State tracking
  InitializationState _initState = InitializationState.idle;
  InitializationState get initState => _initState;

  final List<Chat> _chats = [];
  final Map<String, List<Message>> _messages = {};
  final Map<String, User> _userMap = {};

  final List<StickerSetInfo> _stickerSets = [];
  final List<Message> _savedAnimations = [];
  final List<Message> _searchResults = [];

  final List<Call> _callHistory = [];
  bool _isLoadingCalls = false;

  final List<ChatMember> _chatMembers = [];
  bool _isLoadingMembers = false;

  final List<Message> _sharedMedia = [];
  bool _isLoadingMedia = false;

  final Map<String, String> _typingStatus = {};

  // --- GETTERS ---
  List<Chat> get chats => _chats;

  // Repo-backed contacts
  List<User> get contacts => _userRepository.contacts
      .map((u) => User.fromTdLibJson(u.toMap()))
      .toList();

  // Repo-backed profile
  User? get me {
    final u = _userRepository.currentUser;
    return u != null ? User.fromTdLibJson(u.toMap()) : null;
  }

  String get myBio => _myBio;

  List<StickerSetInfo> get stickerSets => _stickerSets;
  List<Message> get savedAnimations => _savedAnimations;
  List<Message> get searchResults => _searchResults;
  List<Call> get callHistory => _callHistory;
  List<ChatMember> get chatMembers => _chatMembers;
  List<Message> get sharedMedia => _sharedMedia;

  bool get isLoadingCalls => _isLoadingCalls;
  bool get isLoadingMembers => _isLoadingMembers;
  bool get isLoadingMedia => _isLoadingMedia;
  bool get isLoadingHistory => _isLoadingHistory;
  String? get currentChatId => _currentOpenChatId;
  String? get errorMessage => _userRepository.error;

  // User? _me; // Removed

  String _myBio = "Loading bio...";
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  String? _currentOpenChatId;
  bool _isLoadingHistory = false;
  int _myUserId = 0;
  bool _isAutoDownloadEnabled = true;
  Timer? _notifyDebouncer;
  StreamSubscription? _eventSubscription;

  String? getTypingStatus(String chatId) => _typingStatus[chatId];

  void setAutoDownload(bool enabled) {
    _isAutoDownloadEnabled = enabled;
  }

  void setCurrentChatId(String? chatId) {
    _currentOpenChatId = chatId;
  }

  List<Message> getMessages(String chatId) {
    return _messages[chatId] ?? [];
  }

  Message? getMessage(String chatId, String messageId) {
    final msgs = _messages[chatId];
    if (msgs == null) return null;
    try {
      return msgs.firstWhere((m) => m.id == messageId);
    } catch (e) {
      return null;
    }
  }

  TelegramProvider() {
    // 1. Initialize & Bind UserRepository
    // _userRepository.initialize(); // Removed

    _userRepository.addListener(() {
      notifyListeners();
    });

    // 2. Listen to TDLib Events
    _eventSubscription = _telegramService.rawEventStream.listen(
      (event) {
        if (event['@type'] == 'error') {
          debugPrint("❌ [TRACE] TDLib Error: $event");
        }
        _handleTdLibEvent(event);
      },
      onError: (error) {
        debugPrint("❌ Event stream error: $error");
      },
    );
  }

  // --- INITIALIZATION ---
  Future<void> initialize() async {
    if (_initState != InitializationState.idle) {
      return;
    }
    _setInitState(InitializationState.initializing);

    try {
      await _notificationService.initialize();
      if (!_telegramService.isReady) {
        await _telegramService.initialize();
      }

      // Explicitly request commonly needed options
      _telegramService.send({'@type': 'getOption', 'name': 'my_id'});
      _telegramService.send({'@type': 'getAuthorizationState'});
    } catch (e) {
      debugPrint("❌ Initialization error: $e");
      _setInitState(InitializationState.error);
    }
  }

  /// Manually check auth state and reload data if needed.
  /// Useful for "Kick-starting" the UI if events were missed.
  void refreshSession() {
    debugPrint("🔄 [Provider] Manual session refresh requested.");
    _telegramService.send({'@type': 'getAuthorizationState'});
    // Also trigger user load if we think we are ready but data is missing
    if (_initState == InitializationState.ready && me == null) {
      _onAuthReady();
    }
  }

  void _setInitState(InitializationState state) {
    _initState = state;
    debugPrint("📍 Init State: $state");
    notifyListeners();
  }

  Future<void> _onAuthReady() async {
    debugPrint(
        "🔐 Auth Ready - Starting strict sequential load (Repo Pattern)");

    try {
      // 1. Load Profile
      _setInitState(InitializationState.loadingProfile);
      debugPrint("🚀 [flow] State: loadingProfile");
      await _userRepository.loadCurrentUser();

      // Update local ID for other services if needed
      if (_userRepository.currentUser != null) {
        _myUserId = _userRepository.currentUser!.id;
        _telegramService
            .send({'@type': 'getUserFullInfo', 'user_id': _myUserId});
      } else {
        debugPrint("⚠️ [flow] Current user load failed or empty");
      }

      // 2. Load Contacts
      _setInitState(InitializationState.loadingContacts);
      debugPrint("🚀 [flow] State: loadingContacts");
      await _userRepository.loadContacts();

      // 3. Ready
      _setInitState(InitializationState.ready);
      debugPrint("✅ [flow] State: ready");
      notifyListeners();

      // 4. Background: Load Chats & Others
      _loadChatList();
      _loadStickerSets();
      _loadSavedAnimations();
    } catch (e) {
      debugPrint("❌ Error during auth sequence: $e");
      _setInitState(InitializationState.error);
    }
  }

  Future<void> syncDeviceContacts() async {
    // This is now called manually by user, not on startup
    if (await fc.FlutterContacts.requestPermission()) {
      List<fc.Contact> phoneContacts =
          await fc.FlutterContacts.getContacts(withProperties: true);

      List<Map<String, dynamic>> contactsToImport = [];
      for (var c in phoneContacts) {
        if (c.phones.isNotEmpty) {
          // Allow + sign, remove other non-digits
          String rawNumber =
              c.phones.first.number.replaceAll(RegExp(r'[^\d+]'), '');

          // Normalize to +62 (Indonesia) - matching LoginScreen logic
          if (rawNumber.startsWith('0')) {
            rawNumber = '+62${rawNumber.substring(1)}';
          } else if (rawNumber.startsWith('62')) {
            rawNumber = '+$rawNumber';
          }
          contactsToImport.add({
            '@type': 'contact',
            'phone_number': rawNumber,
            'first_name': c.name.first,
            'last_name': c.name.last,
            'user_id': 0
          });
        }
      }

      if (contactsToImport.isNotEmpty) {
        _telegramService
            .send({'@type': 'importContacts', 'contacts': contactsToImport});

        // Reload contacts after import
        await Future.delayed(const Duration(seconds: 1));
        _userRepository.loadContacts();
      }
    }
  }

  Future<void> openSavedMessages(Function(String chatId) onSuccess) async {
    if (_myUserId == 0) {
      debugPrint("⚠️ Cannot open saved messages: myUserId not set");
      return;
    }

    _telegramService.send(
        {'@type': 'createPrivateChat', 'user_id': _myUserId, 'force': false});

    StreamSubscription? sub;
    sub = _telegramService.rawEventStream.listen((event) {
      if (event['@type'] == 'chat' && event['type']['user_id'] == _myUserId) {
        onSuccess(event['id'].toString());
        sub?.cancel();
      }
    });
  }

  // --- ASSETS, HISTORY & MEDIA ---
  void _loadStickerSets() {
    _telegramService.send({
      '@type': 'getInstalledStickerSets',
      'sticker_type': {'@type': 'stickerTypeRegular'}
    });
  }

  void _loadSavedAnimations() {
    _telegramService.send({'@type': 'getSavedAnimations'});
  }

  void _loadStickerSetContent(String setId) {
    _telegramService
        .send({'@type': 'getStickerSet', 'set_id': int.tryParse(setId) ?? 0});
  }

  void loadCallLogs() {
    _isLoadingCalls = true;
    notifyListeners();
    _telegramService.send({
      '@type': 'searchMessages',
      'query': '',
      'offset_date': 0,
      'offset_chat_id': 0,
      'offset_message_id': 0,
      'limit': 50,
      'filter': {'@type': 'searchMessagesFilterCall'},
      'min_date': 0,
      'max_date': 0
    });
  }

  void loadChatHistory(String chatId,
      {String fromMessageId = '0', int offset = 0}) {
    if (_isLoadingHistory) return;
    _isLoadingHistory = true;
    _telegramService.send({
      '@type': 'getChatHistory',
      'chat_id': int.tryParse(chatId) ?? 0,
      'from_message_id': int.tryParse(fromMessageId) ?? 0,
      'offset': offset,
      'limit': 20,
      'only_local': false
    });
  }

  void loadSharedMedia(String chatId) {
    _isLoadingMedia = true;
    _sharedMedia.clear();
    notifyListeners();
    _telegramService.send({
      '@type': 'searchChatMessages',
      'chat_id': int.tryParse(chatId) ?? 0,
      'query': '',
      'limit': 50,
      'filter': {'@type': 'searchMessagesFilterPhotoAndVideo'},
      'from_message_id': 0,
      'offset': 0,
      'sender_id': null,
      'message_thread_id': 0
    });
  }

  void _loadChatList() {
    _telegramService
        .send({'@type': 'getChats', 'chat_list': null, 'limit': 50});
  }

  // --- CHAT INTERACTION ---
  void sendTyping(String chatId) {
    _telegramService.send({
      '@type': 'sendChatAction',
      'chat_id': int.tryParse(chatId) ?? 0,
      'action': {'@type': 'chatActionTyping'}
    });
  }

  void markMessagesAsRead(String chatId, List<String> messageIds) {
    if (messageIds.isEmpty) return;
    _telegramService.send({
      '@type': 'viewMessages',
      'chat_id': int.tryParse(chatId) ?? 0,
      'message_ids': messageIds.map((id) => int.tryParse(id) ?? 0).toList(),
      'force_read': true
    });
  }

  void pinChatMessage(String chatId, String messageId, bool unpin) {
    _telegramService.send({
      '@type': unpin ? 'unpinChatMessage' : 'pinChatMessage',
      'chat_id': int.tryParse(chatId) ?? 0,
      'message_id': int.tryParse(messageId) ?? 0,
      'disable_notification': false,
      'only_for_self': false
    });
  }

  // --- GROUP MANAGEMENT & CALLS ---
  void loadChatMembers(String chatId) {
    _isLoadingMembers = true;
    _chatMembers.clear();
    notifyListeners();
    _telegramService.send({
      '@type': 'searchChatMembers',
      'chat_id': int.tryParse(chatId) ?? 0,
      'query': '',
      'limit': 200,
      'filter': {'@type': 'chatMembersFilterMembers'}
    });
  }

  void addChatMember(String chatId, String userId) {
    _telegramService.send({
      '@type': 'addChatMember',
      'chat_id': int.tryParse(chatId) ?? 0,
      'user_id': int.tryParse(userId) ?? 0,
      'forward_limit': 0
    });
    Future.delayed(const Duration(seconds: 1), () => loadChatMembers(chatId));
  }

  void kickChatMember(String chatId, String userId) {
    _telegramService.send({
      '@type': 'setChatMemberStatus',
      'chat_id': int.tryParse(chatId) ?? 0,
      'member_id': {
        '@type': 'messageSenderUser',
        'user_id': int.tryParse(userId) ?? 0
      },
      'status': {'@type': 'chatMemberStatusBanned', 'banned_until_date': 0}
    });
    _chatMembers.removeWhere((m) => m.userId == userId);
    notifyListeners();
  }

  void promoteToAdmin(String chatId, String userId) {
    _telegramService.send({
      '@type': 'setChatMemberStatus',
      'chat_id': int.tryParse(chatId) ?? 0,
      'member_id': {
        '@type': 'messageSenderUser',
        'user_id': int.tryParse(userId) ?? 0
      },
      'status': {
        '@type': 'chatMemberStatusAdministrator',
        'can_be_edited': true,
        'can_manage_chat': true,
        'can_change_info': true,
        'can_post_messages': true,
        'can_edit_messages': true,
        'can_delete_messages': true,
        'can_invite_users': true,
        'can_restrict_members': true,
        'can_pin_messages': true,
        'can_promote_members': false,
        'can_manage_video_chats': true,
        'is_anonymous': false
      }
    });
    Future.delayed(const Duration(seconds: 1), () => loadChatMembers(chatId));
  }

  // --- GROUP CALLS ---
  void createVoiceChat(String chatId) {
    _telegramService.send({
      '@type': 'createVoiceChat',
      'chat_id': int.tryParse(chatId) ?? 0,
      'title': 'Voice Chat',
      'is_group_call': true,
      'is_rtmp_stream': false
    });
  }

  void joinGroupCall(int groupCallId, {bool isMuted = false}) {
    _telegramService.send({
      '@type': 'joinGroupCall',
      'group_call_id': groupCallId,
      'participant_id': null,
      'audio_source_id': 0,
      'payload': '',
      'is_muted': isMuted,
      'is_my_video_enabled': false
    });
  }

  void leaveGroupCall(int groupCallId) {
    _telegramService
        .send({'@type': 'leaveGroupCall', 'group_call_id': groupCallId});
  }

  // --- MESSAGING ACTIONS ---
  void sendMessage(String chatId, String text, {String? replyToMessageId}) {
    if (text.trim().isEmpty) return;

    // Construct the message payload
    final Map<String, dynamic> request = {
      '@type': 'sendMessage',
      'chat_id': int.tryParse(chatId) ?? 0,
      'input_message_content': {
        '@type': 'inputMessageText',
        'text': {'@type': 'formattedText', 'text': text}
      }
    };

    // Modern TDLib Reply Logic
    if (replyToMessageId != null && replyToMessageId != '0') {
      request['reply_to'] = {
        '@type': 'inputMessageReplyToMessage',
        'message_id': int.tryParse(replyToMessageId) ?? 0
      };
    }

    _telegramService.send(request);
  }

  void searchMessages(String chatId, String query) {
    if (query.isEmpty) return;
    _telegramService.send({
      '@type': 'searchChatMessages',
      'chat_id': int.tryParse(chatId) ?? 0,
      'query': query,
      'limit': 50,
      'sender_id': null,
      'from_message_id': 0,
      'offset': 0,
      'filter': null,
      'message_thread_id': 0
    });
  }

  void clearSearch() {
    _searchResults.clear();
    notifyListeners();
  }

  void editMessageText(String chatId, String messageId, String newText) {
    if (newText.trim().isEmpty) return;
    _telegramService.send({
      '@type': 'editMessageText',
      'chat_id': int.tryParse(chatId) ?? 0,
      'message_id': int.tryParse(messageId) ?? 0,
      'input_message_content': {
        '@type': 'inputMessageText',
        'text': {'@type': 'formattedText', 'text': newText}
      }
    });
  }

  void forwardMessages(
      String toChatId, String fromChatId, List<String> messageIds) {
    _telegramService.send({
      '@type': 'forwardMessages',
      'chat_id': int.tryParse(toChatId) ?? 0,
      'from_chat_id': int.tryParse(fromChatId) ?? 0,
      'message_ids': messageIds.map((id) => int.tryParse(id) ?? 0).toList(),
      'options': {
        '@type': 'messageSendOptions',
        'disable_notification': false,
        'from_background': false,
        'protect_content': false,
        'update_order_of_installed_sticker_sets': false
      },
      'send_copy': false,
      'remove_caption': false
    });
  }

  // Media Sending
  void sendSticker(String chatId, int? stickerFileId,
      {String? replyToMessageId}) {
    if (stickerFileId == null) return;
    _telegramService.send({
      '@type': 'sendMessage',
      'chat_id': int.tryParse(chatId) ?? 0,
      'reply_to_message_id': int.tryParse(replyToMessageId ?? '0') ?? 0,
      'input_message_content': {
        '@type': 'inputMessageSticker',
        'sticker': {'@type': 'inputFileId', 'id': stickerFileId}
      }
    });
  }

  void sendAnimation(String chatId, int? animationFileId,
      {String? replyToMessageId}) {
    if (animationFileId == null) return;
    _telegramService.send({
      '@type': 'sendMessage',
      'chat_id': int.tryParse(chatId) ?? 0,
      'reply_to_message_id': int.tryParse(replyToMessageId ?? '0') ?? 0,
      'input_message_content': {
        '@type': 'inputMessageAnimation',
        'animation': {'@type': 'inputFileId', 'id': animationFileId}
      }
    });
  }

  void sendPhoto(String chatId, String imagePath, {String? replyToMessageId}) {
    // 1. OPTIMISTIC UI: Insert temp message immediately
    final tempId = DateTime.now().millisecondsSinceEpoch.toString(); // Temp ID
    final tempMessage = Message(
      id: tempId,
      chatId: chatId,
      senderId: _myUserId.toString(),
      text: '', // Caption usually handled separately, but empty here for now
      type: MessageType.image,
      timestamp: DateTime.now(),
      isOutgoing: true,
      isSending: true,
      localPath:
          imagePath, // CRITICAL: Set local path so it displays immediately
      replyToMessageId: replyToMessageId,
    );

    if (!_messages.containsKey(chatId)) _messages[chatId] = [];
    _messages[chatId]!.insert(0, tempMessage);
    _notifyOptimized();

    // 2. SEND REQUEST (Modern Reply Logic)
    final Map<String, dynamic> request = {
      '@type': 'sendMessage',
      'chat_id': int.tryParse(chatId) ?? 0,
      'input_message_content': {
        '@type': 'inputMessagePhoto',
        'photo': {'@type': 'inputFileLocal', 'path': imagePath}
      }
    };

    if (replyToMessageId != null && replyToMessageId != '0') {
      request['reply_to'] = {
        '@type': 'inputMessageReplyToMessage',
        'message_id': int.tryParse(replyToMessageId) ?? 0
      };
    }

    _telegramService.send(request);
  }

  void sendVideo(String chatId, String path, {String? replyToMessageId}) {
    _telegramService.send({
      '@type': 'sendMessage',
      'chat_id': int.tryParse(chatId) ?? 0,
      'reply_to_message_id': int.tryParse(replyToMessageId ?? '0') ?? 0,
      'input_message_content': {
        '@type': 'inputMessageVideo',
        'video': {'@type': 'inputFileLocal', 'path': path}
      }
    });
  }

  void sendDocument(String chatId, String path, {String? replyToMessageId}) {
    _telegramService.send({
      '@type': 'sendMessage',
      'chat_id': int.tryParse(chatId) ?? 0,
      'reply_to_message_id': int.tryParse(replyToMessageId ?? '0') ?? 0,
      'input_message_content': {
        '@type': 'inputMessageDocument',
        'document': {'@type': 'inputFileLocal', 'path': path}
      }
    });
  }

  void sendVoiceNote(String chatId, String path, int duration,
      {String? replyToMessageId}) {
    _telegramService.send({
      '@type': 'sendMessage',
      'chat_id': int.tryParse(chatId) ?? 0,
      'reply_to_message_id': int.tryParse(replyToMessageId ?? '0') ?? 0,
      'input_message_content': {
        '@type': 'inputMessageVoiceNote',
        'voice_note': {'@type': 'inputFileLocal', 'path': path},
        'duration': duration
      }
    });
  }

  // General Actions
  void deleteMessage(String chatId, String messageId) {
    _telegramService.send({
      '@type': 'deleteMessages',
      'chat_id': int.tryParse(chatId) ?? 0,
      'message_ids': [int.tryParse(messageId) ?? 0],
      'revoke': true
    });
  }

  void downloadFile(int fileId) {
    _telegramService.send({
      '@type': 'downloadFile',
      'file_id': fileId,
      'priority': 32,
      'offset': 0,
      'limit': 0,
      'synchronous': false
    });
  }

  // --- CHAT CREATION ---
  Future<void> createPrivateChat(
      String userId, Function(String chatId) onSuccess) async {
    _telegramService.send({
      '@type': 'createPrivateChat',
      'user_id': int.tryParse(userId) ?? 0,
      'force': false
    });

    StreamSubscription? sub;
    sub = _telegramService.rawEventStream.listen((event) {
      if (event['@type'] == 'chat' &&
          event['type']['user_id'].toString() == userId) {
        onSuccess(event['id'].toString());
        sub?.cancel();
      }
    });
  }

  Future<void> createNewBasicGroupChat(List<String> userIds, String title,
      Function(String chatId) onSuccess) async {
    List<int> users = userIds
        .map((id) => int.tryParse(id) ?? 0)
        .where((id) => id != 0)
        .toList();

    _telegramService.send({
      '@type': 'createNewBasicGroupChat',
      'user_ids': users,
      'title': title
    });

    StreamSubscription? sub;
    sub = _telegramService.rawEventStream.listen((event) {
      if (event['@type'] == 'chat' && event['title'] == title) {
        onSuccess(event['id'].toString());
        sub?.cancel();
      }
    });
  }

  // --- USER PROFILE ---
  void logOut() {
    _telegramService.send({'@type': 'logOut'});
  }

  void updateName(String firstName, String lastName) {
    _telegramService.send(
        {'@type': 'setName', 'first_name': firstName, 'last_name': lastName});
  }

  void updateBio(String bio) {
    _telegramService.send({'@type': 'setBio', 'bio': bio});
    _myBio = bio;
    _notifyOptimized();
  }

  void setProfilePhoto(String path) {
    _telegramService.send({
      '@type': 'setProfilePhoto',
      'photo': {'@type': 'inputFileLocal', 'path': path}
    });
  }

  // --- CALLING ---
  void createCall(String userId, bool isVideo) {
    final protocol = {
      '@type': 'callProtocol',
      'udp_p2p': true,
      'udp_reflector': true,
      'min_layer': 65,
      'max_layer': 65,
      'library_versions': ['1.0']
    };
    _telegramService.send({
      '@type': 'createCall',
      'user_id': int.tryParse(userId) ?? 0,
      'protocol': protocol,
      'is_video': isVideo
    });
  }

  void acceptCall(int callId) {
    final protocol = {
      '@type': 'callProtocol',
      'udp_p2p': true,
      'udp_reflector': true,
      'min_layer': 65,
      'max_layer': 65,
      'library_versions': ['1.0']
    };
    _telegramService
        .send({'@type': 'acceptCall', 'call_id': callId, 'protocol': protocol});
  }

  void discardCall(int callId) {
    _telegramService.send({
      '@type': 'discardCall',
      'call_id': callId,
      'is_disconnected': true,
      'duration': 0,
      'is_video': false,
      'connection_id': 0
    });
  }

  // --- CHAT MANAGEMENT ---
  void deleteChat(String chatId) {
    // OPTIMISTIC UI UPDATE: Remove from list immediately
    _chats.removeWhere((c) => c.id == chatId);
    _notifyOptimized();

    _telegramService.send({
      '@type': 'deleteChatHistory',
      'chat_id': int.tryParse(chatId) ?? 0,
      'remove_from_chat_list': true,
      'revoke': true
    });
  }

  void togglePinChat(String chatId, bool isPinned) {
    _telegramService.send({
      '@type': 'toggleChatIsPinned',
      'chat_id': int.tryParse(chatId) ?? 0,
      'is_pinned': !isPinned,
      'chat_list': {'@type': 'chatListMain'}
    });

    final index = _chats.indexWhere((c) => c.id == chatId);
    if (index != -1) {
      _chats[index] = _chats[index].copyWith(isPinned: !isPinned);
      _notifyOptimized();
    }
  }

  void toggleMuteChat(String chatId, bool isMuted) {
    final index = _chats.indexWhere((c) => c.id == chatId);
    if (index != -1) {
      _chats[index] = _chats[index].copyWith(isMuted: !isMuted);
      _notifyOptimized();
    }
  }

  void _notifyOptimized() {
    if (_notifyDebouncer?.isActive ?? false) return;
    _notifyDebouncer = Timer(const Duration(milliseconds: 100), () {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _eventSubscription?.cancel();
    _notifyDebouncer?.cancel();
    _telegramService.dispose();
    super.dispose();
  }

  void _handleTdLibEvent(Map<String, dynamic> event) {
    // 0. Handle Special Requests (Context-aware responses)
    if (event['@extra'] == 'my_id_req') {
      // ROBUST PARSING: Handle both direct int and OptionValueInteger
      if (event['value'] is int) {
        _myUserId = event['value'];
      } else if (event['value'] is Map && event['value']['value'] is int) {
        _myUserId = event['value']['value'];
      } else if (event['@type'] == 'optionValueInteger') {
        _myUserId = event['value'];
      }

      if (_myUserId != 0) {
        debugPrint("✅ My ID set to: $_myUserId (Robust Parse)");
      } else {
        debugPrint("⚠️ Failed to parse my_id from: $event");
      }
      return;
    }

    final eventType = event['@type'];

    switch (eventType) {
      case 'updateAuthorizationState':
        _handleAuthState(event['authorization_state']);
        break;

      case 'updateOption':
        // Delegate my_id logic to Repo
        if (event['name'] == 'my_id') {
          _userRepository.handleEvent(event);
          // Keep local _myUserId for internal checks
          if (event['value'] is int) {
            _myUserId = event['value'];
          } else if (event['value'] is Map && event['value']['value'] is int) {
            _myUserId = event['value']['value'];
          }
        }
        break;

      case 'user':
      case 'updateUser':
      case 'updateUserStatus':
        // Delegate to Repository
        _userRepository.handleEvent(event);
        break;

      case 'userFullInfo':
        if (event['bio'] != null) {
          _myBio = event['bio'];
          debugPrint("✅ Got bio: $_myBio");
          _notifyOptimized();
        }
        break;

      case 'importedContacts':
        debugPrint("✅ Contacts imported, reloading...");
        _userRepository.loadContacts();
        break;

      case 'updateNewChat':
        _addOrUpdateChat(event['chat']);
        break;

      case 'chat':
        _addOrUpdateChat(event);
        break;

      case 'updateChatLastMessage':
        _updateChatLastMessage(event['chat_id'], event['last_message']);
        break;

      case 'updateMessageSendSucceeded':
        _handleMessageSendSucceeded(event);
        break;

      case 'updateMessageSendFailed':
        _handleMessageSendFailed(event);
        break;

      case 'stickerSets':
        _handleStickerSets(event);
        break;

      case 'stickerSet':
        _handleStickerSet(event);
        break;

      case 'animations':
        _handleAnimations(event);
        break;

      case 'foundChatMessages':
        _handleFoundChatMessages(event);
        break;

      case 'foundMessages':
        _handleFoundMessages(event);
        break;

      case 'chatMembers':
        _handleChatMembers(event);
        break;

      case 'updateChatAction':
        _handleChatAction(event);
        break;

      case 'updateMessageInteractionInfo':
        _handleMessageInteractionInfo(event);
        break;

      case 'updateChatPinnedMessage':
        _handleChatPinnedMessage(event);
        break;

      case 'messages':
        _handleMessages(event);
        break;

      case 'updateGroupCall':
        _handleGroupCall(event);
        break;

      case 'updateGroupCallParticipant':
        _handleGroupCallParticipant(event);
        break;

      case 'updateNewMessage':
        _handleNewMessage(event);
        break;

      case 'updateMessageContent':
        _handleMessageContent(event);
        break;

      case 'updateCall':
        _handleCall(event);
        break;

      case 'updateDeleteMessages':
        _handleDeleteMessages(event);
        break;

      case 'updateFile':
        _handleFileUpdate(event);
        break;
    }
  }

  void _handleAuthState(Map<String, dynamic> authStateEvent) {
    final state = authStateEvent['@type'];
    debugPrint("🔐 Auth State: $state");

    if (state == 'authorizationStateClosed') {
      // _me = null; // Removed

      _chats.clear();
      _messages.clear();
      _userMap.clear();
      _setInitState(InitializationState.idle);
      TelegramProvider.navigatorKey.currentState
          ?.pushNamedAndRemoveUntil('/login', (route) => false);
    } else if (state == 'authorizationStateReady') {
      _onAuthReady();
    }
  }

  void _handleMessageSendSucceeded(Map<String, dynamic> event) {
    final chatId = event['message']['chat_id'].toString();
    final oldMsgId = event['old_message_id'].toString();
    final newMessage = Message.fromTdLibJson(event['message']);

    if (_messages.containsKey(chatId)) {
      final idx = _messages[chatId]!.indexWhere((m) => m.id == oldMsgId);
      if (idx != -1) {
        _messages[chatId]![idx] = newMessage;
        _notifyOptimized();
      }
    }
  }

  void _handleMessageSendFailed(Map<String, dynamic> event) {
    final chatId = event['message']['chat_id'].toString();
    final oldMsgId = event['old_message_id'].toString();

    if (_messages.containsKey(chatId)) {
      final idx = _messages[chatId]!.indexWhere((m) => m.id == oldMsgId);
      if (idx != -1) {
        // Mark as failed
        _notifyOptimized();
      }
    }
  }

  void _handleStickerSets(Map<String, dynamic> event) {
    List<dynamic> sets = event['sets'];
    _stickerSets.clear();
    for (var s in sets) {
      _loadStickerSetContent(s['id'].toString());
    }
  }

  void _handleStickerSet(Map<String, dynamic> event) {
    List<dynamic> stickersJson = event['stickers'];
    List<Sticker> stickerList = [];

    for (var s in stickersJson) {
      int sId = s['sticker']['id'];
      String path = s['sticker']['local']['path'];
      bool isAnim = s['format']['@type'] == 'stickerFormatTgs';

      if (path.isEmpty) downloadFile(sId);

      stickerList.add(Sticker(
          id: s['sticker']['id'],
          emoji: s['emoji'] ?? '',
          width: s['width'],
          height: s['height'],
          fileId: sId,
          localPath: path,
          isAnimated: isAnim));
    }

    final newSet = StickerSetInfo(
        id: event['id'].toString(),
        title: event['title'],
        name: event['name'],
        stickers: stickerList);

    if (!_stickerSets.any((s) => s.id == newSet.id)) {
      _stickerSets.add(newSet);
      _notifyOptimized();
    }
  }

  void _handleAnimations(Map<String, dynamic> event) {
    List<dynamic> anims = event['animations'];
    _savedAnimations.clear();

    for (var a in anims) {
      var fakeMsgJson = {
        'id': 0,
        'chat_id': 0,
        'date': 0,
        'content': {
          '@type': 'messageAnimation',
          'animation': a,
          'caption': {'text': ''}
        }
      };

      final msg = Message.fromTdLibJson(fakeMsgJson);
      _savedAnimations.add(msg);
      if (msg.fileId != null) downloadFile(msg.fileId!);
    }
    _notifyOptimized();
  }

  void _handleFoundChatMessages(Map<String, dynamic> event) {
    List<dynamic> msgs = event['messages'];
    bool isMedia = false;

    if (msgs.isNotEmpty) {
      final type = msgs[0]['content']['@type'];
      if (type == 'messagePhoto' || type == 'messageVideo') isMedia = true;
    }

    if (isMedia) {
      _sharedMedia.clear();
      for (var msgJson in msgs) {
        final msg = Message.fromTdLibJson(msgJson);
        _sharedMedia.add(msg);
        if (_isAutoDownloadEnabled && msg.fileId != null) {
          downloadFile(msg.fileId!);
        }
      }
      _isLoadingMedia = false;
    } else {
      _searchResults.clear();
      for (var msgJson in msgs) {
        if (msgJson['content']['@type'] == 'messageText') {
          _searchResults.add(Message.fromTdLibJson(msgJson));
        }
      }
    }
    _notifyOptimized();
  }

  void _handleFoundMessages(Map<String, dynamic> event) {
    List<dynamic> msgs = event['messages'];
    _callHistory.clear();

    for (var msgJson in msgs) {
      try {
        final call = Call.fromTdLibJson(msgJson, _myUserId);
        final user = _userMap[call.callerId];

        if (user != null) {
          _callHistory.add(call.copyWith(
              callerName: user.name, callerAvatar: user.avatarUrl));
        } else {
          _telegramService.send({
            '@type': 'getUser',
            'user_id': int.tryParse(call.callerId) ?? 0
          });
          _callHistory.add(call);
        }
      } catch (e) {
        debugPrint("Error parsing call: $e");
      }
    }

    _isLoadingCalls = false;
    _notifyOptimized();
  }

  void _handleChatMembers(Map<String, dynamic> event) {
    List<dynamic> members = event['members'];
    _chatMembers.clear();

    for (var m in members) {
      _chatMembers.add(ChatMember.fromTdLibJson(m, _userMap));

      String uid = '0';
      if (m['member_id']['@type'] == 'messageSenderUser') {
        uid = m['member_id']['user_id'].toString();
        if (!_userMap.containsKey(uid)) {
          _telegramService
              .send({'@type': 'getUser', 'user_id': int.tryParse(uid) ?? 0});
        }
      }
    }

    _isLoadingMembers = false;
    _notifyOptimized();
  }

  void _handleChatAction(Map<String, dynamic> event) {
    final String chatId = event['chat_id'].toString();
    final action = event['action'];
    String status = "";

    if (action['@type'] == 'chatActionTyping') {
      status = "Typing...";
    } else if (action['@type'] == 'chatActionRecordingVoiceNote') {
      status = "Recording voice...";
    } else if (action['@type'] == 'chatActionUploadingPhoto') {
      status = "Sending photo...";
    }

    _typingStatus[chatId] = status;
    _notifyOptimized();

    if (status.isNotEmpty) {
      Future.delayed(const Duration(seconds: 5), () {
        if (_typingStatus[chatId] == status) {
          _typingStatus.remove(chatId);
          _notifyOptimized();
        }
      });
    }
  }

  void _handleMessageInteractionInfo(Map<String, dynamic> event) {
    final String chatId = event['chat_id'].toString();
    final String messageId = event['message_id'].toString();
    final interaction = event['interaction_info'];

    if (_messages.containsKey(chatId) && interaction != null) {
      final index = _messages[chatId]!.indexWhere((m) => m.id == messageId);
      if (index != -1) {
        _messages[chatId]![index] =
            _messages[chatId]![index].copyWith(isRead: true);
        _notifyOptimized();
      }
    }
  }

  void _handleChatPinnedMessage(Map<String, dynamic> event) {
    final String chatId = event['chat_id'].toString();
    final int pinnedMsgId = event['pinned_message_id'] ?? 0;

    final index = _chats.indexWhere((c) => c.id == chatId);
    if (index != -1) {
      _chats[index] = _chats[index].copyWith(
          pinnedMessageId: pinnedMsgId == 0 ? null : pinnedMsgId.toString());
      _notifyOptimized();
    }
  }

  void _handleMessages(Map<String, dynamic> event) {
    List<dynamic> msgs = event['messages'];
    if (msgs.isEmpty) {
      _isLoadingHistory = false;
      return;
    }

    String chatId = msgs[0]['chat_id'].toString();
    if (!_messages.containsKey(chatId)) _messages[chatId] = [];

    for (var msgJson in msgs) {
      final msg = Message.fromTdLibJson(msgJson);
      final idx = _messages[chatId]!.indexWhere((m) => m.id == msg.id);

      if (idx != -1) {
        _messages[chatId]![idx] = msg;
      } else {
        _messages[chatId]!.add(msg);
        if (_isAutoDownloadEnabled &&
            msg.fileId != null &&
            msg.localPath == null) {
          downloadFile(msg.fileId!);
        }
      }
    }

    _messages[chatId]!.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    _isLoadingHistory = false;
    _notifyOptimized();
  }

  void _handleGroupCall(Map<String, dynamic> event) {
    final groupCall = event['group_call'];
    final int groupCallId = groupCall['id'];
    final int participantCount = groupCall['participant_count'];
    final bool isJoined = groupCall['is_joined'];

    callProvider.updateGroupCallState(groupCallId, participantCount, isJoined);
  }

  void _handleGroupCallParticipant(Map<String, dynamic> event) {
    final int groupCallId = event['group_call_id'];
    final participant = event['participant'];
    callProvider.updateGroupCallParticipant(groupCallId, participant);
  }

  void _handleNewMessage(Map<String, dynamic> event) {
    final msgJson = event['message'];
    final String chatId = msgJson['chat_id'].toString();
    var msg = Message.fromTdLibJson(msgJson);

    if (!_messages.containsKey(chatId)) _messages[chatId] = [];

    // SEAMLESS TRANSITION: Check for Optimistic Temp Message
    // If this is a new outgoing message, check if we have a temporary message (from sendPhoto)
    if (msg.isOutgoing) {
      final existingIndex = _messages[chatId]!.indexWhere((m) =>
          m.isOutgoing &&
          m.isSending &&
          // Check for numeric ID (real) vs String/Timestamp ID (temp)
          // Temp IDs are usually large timestamps, real IDs are specific ranges but simple check:
          // Just check if localPath is valid on the TEMP message.
          m.localPath != null &&
          m.localPath!.isNotEmpty);

      if (existingIndex != -1 && existingIndex < 5) {
        // Check top 5 to be safe
        final tempMsg = _messages[chatId]![existingIndex];
        debugPrint(
            "🔎 Found Temp Message at index $existingIndex: ${tempMsg.localPath}");

        // Always try to preserve the local path if the new message doesn't have one
        if (msg.localPath == null || msg.localPath!.isEmpty) {
          debugPrint("🔄 Merging local path from temp message to real message");
          msg = msg.copyWith(localPath: tempMsg.localPath);
        }

        // Remove the temporary message to avoid duplicates
        debugPrint("🧹 Removing temp message to prevent duplicate");
        _messages[chatId]!.removeAt(existingIndex);
      } else {
        debugPrint("ℹ️ No matching temp message found for outgoing message");
      }
    }

    final index = _messages[chatId]!.indexWhere((m) => m.id == msg.id);
    if (index != -1) {
      _messages[chatId]![index] = msg;
    } else {
      _messages[chatId]!.insert(0, msg);
      if (!msg.isOutgoing && _currentOpenChatId != chatId) {
        _showNotificationForMessage(chatId, msg);
      }
    }

    if (_isAutoDownloadEnabled && msg.fileId != null) {
      downloadFile(msg.fileId!);
    }

    _updateChatLastMessageUI(
        chatId, msg.text.isNotEmpty ? msg.text : '[Media]');
    _notifyOptimized();
  }

  void _handleMessageContent(Map<String, dynamic> event) {
    final String chatId = event['chat_id'].toString();
    final String messageId = event['message_id'].toString();

    if (!_messages.containsKey(chatId)) return;

    final index = _messages[chatId]!.indexWhere((m) => m.id == messageId);
    if (index == -1) return;

    var oldMsg = _messages[chatId]![index];
    var newContent = event['new_content'];

    if (newContent['@type'] == 'messageText') {
      var newText = newContent['text']['text'];
      _messages[chatId]![index] = Message(
          id: oldMsg.id,
          chatId: oldMsg.chatId,
          senderId: oldMsg.senderId,
          text: newText,
          type: oldMsg.type,
          timestamp: oldMsg.timestamp,
          isRead: oldMsg.isRead,
          isOutgoing: oldMsg.isOutgoing,
          isSending: oldMsg.isSending,
          isError: oldMsg.isError,
          isEdited: true,
          replyToMessageId: oldMsg.replyToMessageId,
          fileId: oldMsg.fileId,
          localPath: oldMsg.localPath,
          isDownloading: oldMsg.isDownloading,
          duration: oldMsg.duration,
          fileName: oldMsg.fileName,
          fileSize: oldMsg.fileSize,
          stickerEmoji: oldMsg.stickerEmoji,
          isAnimatedSticker: oldMsg.isAnimatedSticker,
          width: oldMsg.width,
          height: oldMsg.height);
      _notifyOptimized();
    }
  }

  void _handleCall(Map<String, dynamic> event) {
    final call = event['call'];
    final int id = call['id'];
    final String userId = call['user_id'].toString();
    final bool isOutgoing = call['is_outgoing'];
    final state = call['state'];

    callProvider.setCallId(id);

    if (!isOutgoing && state['@type'] == 'callStatePending') {
      callProvider.handleIncomingCall(id, userId);
      TelegramProvider.navigatorKey.currentState?.pushNamed('/incoming_call');
    } else {
      callProvider.updateCallState(state['@type']);
    }
  }

  void _handleDeleteMessages(Map<String, dynamic> event) {
    final String chatId = event['chat_id'].toString();
    final List<dynamic> msgIds = event['message_ids'];

    if (_messages.containsKey(chatId)) {
      _messages[chatId]!.removeWhere((m) => msgIds.contains(int.parse(m.id)));
      _notifyOptimized();
    }
  }

  void _handleFileUpdate(Map<String, dynamic> event) {
    var file = event['file'];
    int fileId = file['id'];
    String path = file['local']['path'];
    int downloaded = file['local']['downloaded_size'] ?? 0;
    int total = file['expected_size'] ?? 0;
    double progress = (total > 0) ? (downloaded / total) : 0.0;
    bool isDownloadingActive = file['local']['is_downloading_active'] ?? false;
    bool isUploadingActive = file['remote']['is_uploading_active'] ?? false;
    bool isActive = isDownloadingActive || isUploadingActive;

    String label =
        "${Message.formatBytes(downloaded)} / ${Message.formatBytes(total)}";
    if (total == 0) label = Message.formatBytes(downloaded);

    if (isActive || path.isNotEmpty) {
      _messages.forEach((chatId, msgs) {
        for (int i = 0; i < msgs.length; i++) {
          if (msgs[i].fileId == fileId) {
            _messages[chatId]![i] = _messages[chatId]![i].copyWith(
                localPath: path,
                isDownloading: isActive && path.isEmpty,
                progress: progress,
                progressLabel: label);
          }
        }
      });

      for (int i = 0; i < _savedAnimations.length; i++) {
        if (_savedAnimations[i].fileId == fileId) {
          _savedAnimations[i] = _savedAnimations[i].copyWith(localPath: path);
        }
      }

      for (int i = 0; i < _sharedMedia.length; i++) {
        if (_sharedMedia[i].fileId == fileId) {
          _sharedMedia[i] = _sharedMedia[i].copyWith(localPath: path);
        }
      }

      _notifyOptimized();
    }
  }

  void _showNotificationForMessage(String chatId, Message msg) {
    final chat = _chats.firstWhere((c) => c.id == chatId,
        orElse: () =>
            Chat(id: chatId, name: 'Unknown', timestamp: DateTime.now()));

    if (chat.isMuted) return;

    String content = msg.text;
    if (msg.type == MessageType.image) {
      content = '📷 Photo';
    } else if (msg.type == MessageType.sticker) {
      content = '😊 Sticker';
    } else if (msg.type == MessageType.video) {
      content = '🎥 Video';
    } else if (msg.type == MessageType.voice) {
      content = '🎤 Voice Note';
    } else if (msg.type == MessageType.file) {
      content = '📄 File';
    }

    _notificationService.showNotification(
        id: int.tryParse(chatId) ?? 0,
        title: chat.name,
        body: content,
        payload: chatId);
  }

  void _addOrUpdateChat(Map<String, dynamic> json) {
    final String id = json['id'].toString();
    String title = json['title'] ?? 'Unknown';

    if (id == _myUserId.toString()) title = "Saved Messages";

    int? pinnedId;
    if (json['pinned_message_id'] != null && json['pinned_message_id'] != 0) {
      pinnedId = json['pinned_message_id'];
    }

    String lastMsg = 'No messages';
    if (json['last_message'] != null) {
      var content = json['last_message']['content'];
      if (content['@type'] == 'messageText') {
        lastMsg = content['text']['text'];
      } else if (content['@type'] == 'messageSticker') {
        lastMsg = '😊 Sticker';
      } else if (content['@type'] == 'messageAnimation') {
        lastMsg = 'GIF';
      } else if (content['@type'] == 'messagePhoto') {
        lastMsg = '📷 Photo';
      } else if (content['@type'] == 'messageVoiceNote') {
        lastMsg = '🎤 Voice';
      } else if (content['@type'] == 'messageVideo') {
        lastMsg = '🎥 Video';
      } else if (content['@type'] == 'messageDocument') {
        lastMsg = '📄 File';
      } else {
        lastMsg = '[Media]';
      }
    }

    bool isPinned = json['is_pinned'] == true;

    final newChat = Chat(
        id: id,
        name: title,
        lastMessage: lastMsg,
        timestamp: DateTime.now(),
        unreadCount: json['unread_count'] ?? 0,
        isArchived: json['is_archived'] ?? false,
        isPinned: isPinned,
        pinnedMessageId: pinnedId?.toString());

    final index = _chats.indexWhere((c) => c.id == id);
    if (index != -1) {
      _chats[index] = newChat;
    } else {
      _chats.add(newChat);
    }
    _notifyOptimized();
  }

  void _updateChatLastMessage(int chatId, Map<String, dynamic>? messageJson) {
    if (messageJson == null) return;

    String contentText = '';
    var content = messageJson['content'];

    if (content['@type'] == 'messageText') {
      contentText = content['text']['text'];
    } else if (content['@type'] == 'messageSticker') {
      contentText = '😊 Sticker';
    } else if (content['@type'] == 'messageAnimation') {
      contentText = 'GIF';
    } else if (content['@type'] == 'messagePhoto') {
      contentText = '📷 Photo';
    } else if (content['@type'] == 'messageVoiceNote') {
      contentText = '🎤 Voice';
    } else if (content['@type'] == 'messageVideo') {
      contentText = '🎥 Video';
    } else if (content['@type'] == 'messageDocument') {
      contentText = '📄 File';
    } else {
      contentText = '[Media]';
    }

    _updateChatLastMessageUI(chatId.toString(), contentText);
  }

  void _updateChatLastMessageUI(String chatId, String newContent) {
    final index = _chats.indexWhere((c) => c.id == chatId);
    if (index != -1) {
      _chats[index] = _chats[index]
          .copyWith(lastMessage: newContent, timestamp: DateTime.now());
      final chat = _chats.removeAt(index);
      _chats.insert(0, chat);
    }
  }
}
