import 'package:shared_preferences/shared_preferences.dart';

class SecurityService {
  static final SecurityService _instance = SecurityService._internal();
  factory SecurityService() => _instance;
  SecurityService._internal();

  static const String _pinKey = 'user_pin';
  static const String _secretChatsKey = 'secret_chat_ids';

  String? _storedPin = "1234";
  bool _isSessionUnlocked = false;
  Set<String> _secretChatIds = {};

  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    _storedPin = prefs.getString(_pinKey) ?? "1234";

    // Load persisted secret chat IDs
    final storedIds = prefs.getStringList(_secretChatsKey) ?? [];
    _secretChatIds = storedIds.toSet();
  }

  bool get isUnlocked => _isSessionUnlocked;

  // Check if a chat is marked as secret
  bool isSecretChat(String chatId) => _secretChatIds.contains(chatId);

  // Get all secret chat IDs
  Set<String> get secretChatIds => _secretChatIds;

  // Mark a chat as secret and persist
  Future<void> addSecretChat(String chatId) async {
    _secretChatIds.add(chatId);
    await _persistSecretChats();
  }

  // Remove secret chat (if needed)
  Future<void> removeSecretChat(String chatId) async {
    _secretChatIds.remove(chatId);
    await _persistSecretChats();
  }

  Future<void> _persistSecretChats() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_secretChatsKey, _secretChatIds.toList());
  }

  // Verifikasi PIN (Murni Cek, TIDAK membuka sesi)
  bool verifyPin(String input) {
    if (input == _storedPin) {
      return true;
    }
    return false;
  }

  // Fungsi Eksplisit untuk Membuka Sesi (Dipanggil jika login sukses di Private Tab)
  void unlockSession() {
    _isSessionUnlocked = true;
  }

  // Set PIN Baru & KUNCI SESI (Agar user wajib login ulang dengan PIN baru)
  Future<void> setPin(String newPin) async {
    _storedPin = newPin;
    _isSessionUnlocked = false; // <--- PERBAIKAN: Kunci sesi setelah ganti PIN

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_pinKey, newPin);
  }

  void lockSession() {
    _isSessionUnlocked = false;
  }
}
