import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_provider.dart'; 
import 'core/providers/telegram_provider.dart';
import 'core/providers/settings_provider.dart'; 
import 'core/providers/call_provider.dart'; 
import 'core/services/security_service.dart';
import 'presentation/routing/app_router.dart'; // RUTE TERPUSAT

// Variabel Global
final ThemeProvider themeProvider = ThemeProvider();
final TelegramProvider telegramProvider = TelegramProvider(); 
final SettingsProvider settingsProvider = SettingsProvider(); 
final CallProvider callProvider = CallProvider(); 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Mengatur status bar transparan
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  // Inisialisasi Service Pendukung
  await SecurityService().initialize();
  await themeProvider.loadTheme();
  await settingsProvider.loadSettings();
  
  // Konfigurasi Telegram Provider
  telegramProvider.setAutoDownload(settingsProvider.autoDownloadMedia);
  telegramProvider.initialize();

  runApp(const AnnogramApp());
}

class AnnogramApp extends StatelessWidget {
  const AnnogramApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Mendengarkan perubahan dari semua Provider Global
    return AnimatedBuilder(
      animation: Listenable.merge([themeProvider, telegramProvider, settingsProvider, callProvider]),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'AnnoGram',
          
          // PENTING: Navigator Key untuk membuka layar dari background service (Call/Notif)
          navigatorKey: TelegramProvider.navigatorKey, 
          
          // Tema Aplikasi
          theme: AppTheme.lightTheme, 
          darkTheme: AppTheme.darkTheme,
          themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          
          // Routing (Navigasi)
          // Kita tidak pakai 'home:' lagi, tapi pakai initialRoute & onGenerateRoute
          initialRoute: '/login', // Sesuaikan jika user sudah login (nanti bisa dicek via auth state)
          onGenerateRoute: AppRouter().onGenerateRoute,
        );
      },
    );
  }
}