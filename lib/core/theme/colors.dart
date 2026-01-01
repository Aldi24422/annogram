import 'package:flutter/material.dart';

class AppColors {
  // --- PALET TEMA MODERN (Midnight Blue & Cream) ---
  static const Color midnightBlue = Color(0xFF2D336B); // Background Utama
  static const Color royalBlue = Color(0xFF7886C7);    // Aksen / Tombol / Link
  static const Color softBlueGrey = Color(0xFFA9B5DF); // Icon / Teks Sekunder
  static const Color creamWhite = Color(0xFFFFF2F2);   // Teks Utama / Warna Kartu

  // --- SEMANTIC COLORS (Digunakan oleh AppTheme) ---
  // Kita definisikan ulang variabel yang dicari oleh app_theme.dart
  static const Color background = midnightBlue;
  static const Color surface = Color(0xFF3D4485); // Warna kartu/container
  static const Color primary = royalBlue;
  static const Color onPrimary = creamWhite;
  static const Color textPrimary = creamWhite;
  static const Color textSecondary = softBlueGrey;
  static const Color error = Color(0xFFFF6B6B);

  // --- Helper Colors ---
  static const Color inputFill = Color(0xFF20244D); // Warna kolom input
  static const Color cardSurface = surface; // Alias untuk container chat
}