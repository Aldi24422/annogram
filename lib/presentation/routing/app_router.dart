import 'package:flutter/material.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/welcome_screen.dart';
import '../screens/chat/chat_list_screen.dart';
import '../screens/chat/chat_screen.dart';
import '../screens/call/call_screen.dart';
import '../screens/call/incoming_call_screen.dart';
import '../screens/main_screen.dart';
import '../../data/models/chat/chat_model.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case '/welcome':
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case '/chats':
        return MaterialPageRoute(
            builder: (_) => const ChatListScreen(filter: 'all'));
      case '/chat':
        final chat = settings.arguments as Chat;
        return MaterialPageRoute(builder: (_) => ChatScreen(chat: chat));

      // RUTE BARU PENTING
      case '/incoming_call':
        return MaterialPageRoute(builder: (_) => const IncomingCallScreen());
      case '/call':
        // Kita butuh chat object dummy untuk CallScreen, ambil dari CallProvider nanti
        // Untuk sementara kita biarkan CallScreen mengambil data sendiri atau lewat argumen
        final chat = settings.arguments as Chat?;
        if (chat != null) {
          return MaterialPageRoute(builder: (_) => CallScreen(chat: chat));
        }
        return null;

      default:
        return null;
    }
  }
}
