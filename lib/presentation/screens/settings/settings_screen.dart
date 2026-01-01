import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../auth/pin_screen.dart';
import '../../../main.dart'; // Akses Global Provider (themeProvider, settingsProvider, telegramProvider)

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;

  void _accessPasscodeSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PinScreen(
          onSuccess: () {
            Navigator.pop(context); 
            _showPasscodeMenu();    
          },
        ),
      ),
    );
  }

  void _showPasscodeMenu() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor, 
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40, height: 4,
                decoration: BoxDecoration(
                  color: AppColors.softBlueGrey.withValues(alpha: 0.3), 
                  borderRadius: BorderRadius.circular(2)
                ),
              ),
              const SizedBox(height: 20),
              
              Text(
                "Passcode Settings", 
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium?.color, 
                  fontSize: 20, 
                  fontWeight: FontWeight.bold
                )
              ),
              const SizedBox(height: 30),
              
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).inputDecorationTheme.fillColor, 
                    shape: BoxShape.circle
                  ),
                  child: const Icon(Icons.lock_reset, color: AppColors.royalBlue),
                ),
                title: Text(
                  "Change PIN", 
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium?.color, 
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  )
                ),
                subtitle: const Text(
                  "Update your security PIN code", 
                  style: TextStyle(color: AppColors.softBlueGrey)
                ),
                trailing: const Icon(Icons.chevron_right, color: AppColors.softBlueGrey),
                onTap: () {
                  Navigator.pop(context); 
                  _openChangePinScreen(); 
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void _openChangePinScreen() {
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (_) => PinScreen(
        isSettingNew: true, 
        onSuccess: () {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("PIN Successfully Updated!"),
              backgroundColor: AppColors.royalBlue,
            )
          );
        }
      ))
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = themeProvider.isDarkMode; 
    bool isAutoDownload = settingsProvider.autoDownloadMedia; // Status Auto Download

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor, 
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          _buildSectionHeader('General'),
          _buildSwitchTile(
            'Notifications',
            'Enable push notifications',
            Icons.notifications,
            _notificationsEnabled,
            (value) => setState(() => _notificationsEnabled = value),
          ),
          
          _buildSwitchTile(
            'Dark Mode',
            'Use dark theme',
            isDark ? Icons.dark_mode : Icons.light_mode,
            isDark, 
            (value) {
               themeProvider.toggleTheme(value);
            },
          ),

          // --- FITUR AUTO DOWNLOAD ---
          _buildSwitchTile(
            'Auto-Download Media',
            'Automatically download photos',
            Icons.download_rounded,
            isAutoDownload, 
            (value) {
               // Update Provider Setting
               settingsProvider.toggleAutoDownload(value);
               // Beritahu Telegram Provider agar TDLib menyesuaikan
               telegramProvider.setAutoDownload(value);
            },
          ),
          
          _buildSectionHeader('Privacy & Security'),
          _buildActionTile('Passcode Lock', Icons.lock, _accessPasscodeSettings),
          _buildActionTile('Blocked Users', Icons.block, () {}),
          _buildActionTile('Two-Step Verification', Icons.verified_user, () {}),

          _buildSectionHeader('App Info'),
          _buildActionTile('Help & Support', Icons.help, () {}),
          _buildActionTile('About AnnoGram', Icons.info, () {}),
          
          const SizedBox(height: 40),
          
          // --- LOG OUT BUTTON (REAL LOGIC) ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: OutlinedButton(
              onPressed: () {
                // Tampilkan Dialog Konfirmasi Log Out
                showDialog(
                  context: context, 
                  builder: (ctx) => AlertDialog(
                    backgroundColor: Theme.of(context).cardColor,
                    title: Text("Log Out?", style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color)),
                    content: const Text("Are you sure you want to log out? This will delete your local data.", style: TextStyle(color: AppColors.softBlueGrey)),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(ctx), 
                        child: const Text("Cancel")
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(ctx); // Tutup Dialog
                          telegramProvider.logOut(); // PERINTAH LOG OUT ASLI KE TDLIB
                        }, 
                        child: const Text("Log Out", style: TextStyle(color: Colors.red))
                      ),
                    ],
                  )
                );
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.error,
                side: const BorderSide(color: AppColors.error),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              child: const Text('Log Out'),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 16, 8),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          color: AppColors.royalBlue,
          fontWeight: FontWeight.bold,
          fontSize: 13,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildSwitchTile(String title, String subtitle, IconData icon, bool value, ValueChanged<bool> onChanged) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      activeTrackColor: AppColors.royalBlue,
      activeThumbColor: Colors.white,
      inactiveThumbColor: AppColors.softBlueGrey,
      trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      
      title: Text(title, style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color, fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle, style: TextStyle(color: Theme.of(context).textTheme.bodySmall?.color, fontSize: 12)),
      secondary: Icon(icon, color: Theme.of(context).iconTheme.color),
    );
  }

  Widget _buildActionTile(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      onTap: onTap,
      title: Text(title, style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color, fontWeight: FontWeight.w500)), 
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor, 
          shape: BoxShape.circle
        ),
        child: Icon(icon, color: Theme.of(context).iconTheme.color, size: 20), 
      ),
      trailing: Icon(Icons.chevron_right, color: Theme.of(context).iconTheme.color),
    );
  }
}