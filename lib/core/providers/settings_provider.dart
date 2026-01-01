import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  // Default: Auto Download NYALA (True)
  bool _autoDownloadMedia = true;

  bool get autoDownloadMedia => _autoDownloadMedia;

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    // Ambil settingan, kalau belum ada default-nya True
    _autoDownloadMedia = prefs.getBool('auto_download_media') ?? true;
    notifyListeners();
  }

  Future<void> toggleAutoDownload(bool value) async {
    _autoDownloadMedia = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('auto_download_media', value);
    notifyListeners();
  }
}