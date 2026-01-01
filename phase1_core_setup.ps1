# phase1_core_setup.ps1
Write-Host "🎯 Starting Phase 1: Core Setup..." -ForegroundColor Green
Write-Host "==============================================" -ForegroundColor Cyan

# =============================================
# 1. MAIN.DART - Entry Point Application
# =============================================
Write-Host "📄 Creating main.dart..." -ForegroundColor Yellow

@"
import 'package:flutter/material.dart';

void main() {
  runApp(const AnnoGramApp());
}

class AnnoGramApp extends StatelessWidget {
  const AnnoGramApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnnoGram',
      theme: ThemeData(
        primaryColor: const Color(0xFF0088CC),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF0088CC),
          secondary: Color(0xFF00C6B6),
        ),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
"@ | Out-File -FilePath "lib\main.dart" -Encoding UTF8

Write-Host "✅ Created main.dart" -ForegroundColor Green

# =============================================
# 2. ROUTE_NAMES.DART - Route Constants
# =============================================
Write-Host "📄 Creating route_names.dart..." -ForegroundColor Yellow

@"
class RouteNames {
  // Auth Routes
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String otp = '/otp';
  
  // Main App Routes
  static const String main = '/main';
  static const String home = '/home';
  
  // Chat Routes
  static const String chatList = '/chats';
  static const String chat = '/chat';
  static const String groupInfo = '/group-info';
  static const String createGroup = '/create-group';
  
  // Call Routes
  static const String call = '/call';
  static const String videoCall = '/video-call';
  static const String groupCall = '/group-call';
  static const String callHistory = '/call-history';
  
  // Profile Routes
  static const String profile = '/profile';
  static const String editProfile = '/edit-profile';
  static const String settings = '/settings';
}
"@ | Out-File -FilePath "lib\core\constants\route_names.dart" -Encoding UTF8

Write-Host "✅ Created route_names.dart" -ForegroundColor Green

# =============================================
# 3. APP_CONSTANTS.DART - App Constants
# =============================================
Write-Host "📄 Creating app_constants.dart..." -ForegroundColor Yellow

@"
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
"@ | Out-File -FilePath "lib\core\constants\app_constants.dart" -Encoding UTF8

Write-Host "✅ Created app_constants.dart" -ForegroundColor Green

# =============================================
# 4. APP_THEME.DART - Theme System
# =============================================
Write-Host "📄 Creating app_theme.dart..." -ForegroundColor Yellow

@"
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF0088CC),
        brightness: Brightness.light,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF0088CC),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF0088CC),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF0088CC),
        brightness: Brightness.dark,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1E1E1E),
        elevation: 0,
      ),
    );
  }
}
"@ | Out-File -FilePath "lib\core\theme\app_theme.dart" -Encoding UTF8

Write-Host "✅ Created app_theme.dart" -ForegroundColor Green

# =============================================
# 5. COLORS.DART - Color Constants
# =============================================
Write-Host "📄 Creating colors.dart..." -ForegroundColor Yellow

@"
import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF0088CC);
  static const Color primaryDark = Color(0xFF006699);
  static const Color primaryLight = Color(0xFF66BFFF);
  
  // Secondary Colors
  static const Color secondary = Color(0xFF00C6B6);
  static const Color secondaryDark = Color(0xFF009487);
  static const Color secondaryLight = Color(0xFF66F9E8);
  
  // Neutral Colors
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFF8F9FA);
  static const Color onSurface = Color(0xFF1A1A1A);
  
  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);
  
  // Chat Colors
  static const Color messageBubbleMe = Color(0xFF0088CC);
  static const Color messageBubbleOther = Color(0xFFE5E5EA);
  static const Color onlineStatus = Color(0xFF4CAF50);
  static const Color typingIndicator = Color(0xFF666666);
}
"@ | Out-File -FilePath "lib\core\theme\colors.dart" -Encoding UTF8

Write-Host "✅ Created colors.dart" -ForegroundColor Green

# =============================================
# 6. APP_ROUTER.DART - Routing System
# =============================================
Write-Host "📄 Creating app_router.dart..." -ForegroundColor Yellow

@"
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // TODO: Implement actual route generation
      // Untuk sekarang kita return placeholder
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text('Coming Soon'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Screen in Development',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Route: \${settings.name}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate back
                      Navigator.of(_).pop();
                    },
                    child: const Text('Go Back'),
                  ),
                ],
              ),
            ),
          ),
        );
    }
  }
}
"@ | Out-File -FilePath "lib\presentation\routing\app_router.dart" -Encoding UTF8

Write-Host "✅ Created app_router.dart" -ForegroundColor Green

# =============================================
# 7. UPDATE MAIN.DART DENGAN ROUTING
# =============================================
Write-Host "📄 Updating main.dart with routing..." -ForegroundColor Yellow

@"
import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'presentation/routing/app_router.dart';
import 'presentation/screens/auth/welcome_screen.dart';

void main() {
  runApp(const AnnoGramApp());
}

class AnnoGramApp extends StatelessWidget {
  const AnnoGramApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnnoGram',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      onGenerateRoute: AppRouter.generateRoute,
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
"@ | Out-File -FilePath "lib\main.dart" -Encoding UTF8

Write-Host "✅ Updated main.dart with routing" -ForegroundColor Green

# =============================================
# 8. WELCOME_SCREEN.DART - Basic Welcome Screen
# =============================================
Write-Host "📄 Creating welcome_screen.dart..." -ForegroundColor Yellow

@"
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // App Logo/Icon
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.chat_bubble_outline,
                  size: 60,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 32),
              // App Name
              Text(
                'AnnoGram',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              const SizedBox(height: 8),
              // Tagline
              Text(
                'Connect without limits',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey[600],
                    ),
              ),
              const Spacer(),
              // Get Started Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Implement navigation to chat list
                    _showComingSoonDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Terms Text
              Text(
                'By continuing, you agree to our Terms of Service',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey[500],
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  void _showComingSoonDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Feature Coming Soon'),
          content: const Text('Chat functionality will be available in the next phase.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
"@ | Out-File -FilePath "lib\presentation\screens\auth\welcome_screen.dart" -Encoding UTF8

Write-Host "✅ Created welcome_screen.dart" -ForegroundColor Green

# =============================================
# 9. UPDATE PUBSPEC.YAML DENGAN DEPENDENCIES
# =============================================
Write-Host "📄 Updating pubspec.yaml..." -ForegroundColor Yellow

@"
name: annogram
description: A third-party Telegram client built with Flutter

publish_to: 'none'

version: 1.0.0+1

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0

flutter:
  uses-material-design: true

  assets:
    - assets/images/
    - assets/animations/
"@ | Out-File -FilePath "pubspec.yaml" -Encoding UTF8

Write-Host "✅ Updated pubspec.yaml" -ForegroundColor Green

Write-Host "`n🎉 PHASE 1 COMPLETED SUCCESSFULLY!" -ForegroundColor Green
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host "📁 Files created/updated: 8" -ForegroundColor Yellow
Write-Host "`n🚀 Now run these commands:" -ForegroundColor Cyan
Write-Host "   flutter pub get" -ForegroundColor White
Write-Host "   flutter run" -ForegroundColor White
Write-Host "`n📱 What we have now:" -ForegroundColor Magenta
Write-Host "   • Basic Flutter app structure" -ForegroundColor Gray
Write-Host "   • Theme system (light/dark mode)" -ForegroundColor Gray  
Write-Host "   • Routing system (placeholder)" -ForegroundColor Gray
Write-Host "   • Welcome screen with basic UI" -ForegroundColor Gray
Write-Host "   • Color constants and app constants" -ForegroundColor Gray
Write-Host "`n🎯 Next Phase: Data Models & Mock Data" -ForegroundColor Cyan