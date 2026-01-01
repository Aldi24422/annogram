class AppConstants {
  // App Info
  static const String appName = 'AnnoGram';
  static const String appVersion = '1.0.0';
  
  // Animation Durations
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration typingIndicatorDuration = Duration(milliseconds: 1500);
  
  // API Constants (akan digunakan nanti dengan TDLib)
  static const int apiId = 0; // Ganti dengan API ID Anda
  static const String apiHash = ''; // Ganti dengan API Hash Anda
  
  // Storage Keys
  static const String messagesBox = 'messages';
  static const String chatsBox = 'chats';
  static const String userBox = 'user';
  
  // Default Values
  static const int maxMessageLength = 4096;
  static const int maxGroupMembers = 200;
}
