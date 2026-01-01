import 'package:flutter/material.dart';
import 'colors.dart'; // Pastikan file colors.dart Anda tetap ada

class AppTheme {
  // --- TEMA GELAP (DEFAULT) ---
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.midnightBlue, // Background Utama
    primaryColor: AppColors.royalBlue,
    
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.midnightBlue,
      foregroundColor: AppColors.creamWhite,
      elevation: 0,
    ),
    
    // Warna Kartu/ListTile
    cardColor: AppColors.cardSurface, 
    
    // Warna Input/TextField
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.inputFill,
      filled: true,
      hintStyle: TextStyle(color: AppColors.softBlueGrey.withValues(alpha: 0.5)),
    ),
    
    // Warna Teks
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColors.creamWhite),
      bodySmall: TextStyle(color: AppColors.softBlueGrey),
    ),
    
    // Warna Icon
    iconTheme: const IconThemeData(color: AppColors.softBlueGrey),
  );

  // --- TEMA TERANG (LIGHT MODE) ---
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF2F4F8), // Putih Abu-abu lembut
    primaryColor: AppColors.royalBlue,
    
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black87, // Teks jadi hitam
      elevation: 0,
    ),
    
    cardColor: Colors.white, // Kartu jadi putih
    
    inputDecorationTheme: InputDecorationTheme(
      fillColor: const Color(0xFFE0E5EC), // Abu-abu terang
      filled: true,
      hintStyle: TextStyle(color: Colors.grey.withValues(alpha: 0.7)),
    ),
    
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.black87), // Teks hitam
      bodySmall: TextStyle(color: Colors.grey),
    ),
    
    iconTheme: const IconThemeData(color: Colors.black54),
  );
}