import 'dart:io';
import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart'; 
import '../../../main.dart'; // Akses telegramProvider
import 'edit_profile_screen.dart';
import '../settings/settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: telegramProvider,
      builder: (context, child) {
        final me = telegramProvider.me;
        
        // Data Default (Jika belum load)
        final String name = me?.name ?? "Loading...";
        final String phone = me?.phoneNumber ?? "-";
        final String bio = telegramProvider.myBio;
        final String? avatarPath = me?.avatarUrl;

        return Scaffold(
          backgroundColor: AppColors.midnightBlue,
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                expandedHeight: 220, 
                pinned: true,        
                stretch: true,       
                backgroundColor: AppColors.midnightBlue,
                foregroundColor: AppColors.creamWhite,
                elevation: 0,
                
                title: const Text(
                  'My Profile', 
                  style: TextStyle(fontWeight: FontWeight.bold)
                ),
                centerTitle: true,

                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: const [
                    StretchMode.zoomBackground,
                    StretchMode.blurBackground,
                  ],
                  background: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF3D4485), 
                          AppColors.midnightBlue
                        ], 
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 40), 
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.royalBlue, width: 3),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.royalBlue.withValues(alpha: 0.4), 
                                  blurRadius: 25,
                                  spreadRadius: 2
                                )
                              ]
                            ),
                            child: CircleAvatar(
                              radius: 55, 
                              backgroundColor: AppColors.royalBlue,
                              backgroundImage: (avatarPath != null && File(avatarPath).existsSync())
                                  ? FileImage(File(avatarPath))
                                  : null,
                              child: (avatarPath == null || !File(avatarPath).existsSync())
                                  ? Text(
                                      name.isNotEmpty ? name[0] : '?', 
                                      style: const TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold)
                                    )
                                  : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 100),
                  child: Column(
                    children: [
                      // Info Cards
                      _buildProfileItem(Icons.person, 'Name', name),
                      _buildProfileItem(Icons.phone, 'Phone', phone),
                      _buildProfileItem(Icons.info_outline, 'Bio', bio),

                      const SizedBox(height: 30),
                      
                      // Tombol Edit
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const EditProfileScreen())),
                          icon: const Icon(Icons.edit),
                          label: const Text('Edit Profile'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.royalBlue,
                            side: const BorderSide(color: AppColors.royalBlue),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                      ),

                      const Divider(height: 50, color: AppColors.inputFill),

                      // Menu Bawah
                      _buildActionItem(context, Icons.settings, 'Settings', onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen()));
                      }),
                      _buildActionItem(context, Icons.help, 'Help & Support', onTap: () {}),
                      _buildActionItem(context, Icons.logout, 'Log Out', isDestructive: true, onTap: () {
                        // LOGIC LOG OUT ASLI
                        showDialog(
                          context: context, 
                          builder: (ctx) => AlertDialog(
                            title: const Text("Log Out?"),
                            content: const Text("Are you sure you want to log out?"),
                            actions: [
                              TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Cancel")),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(ctx);
                                  telegramProvider.logOut(); // PANGGIL PROVIDER
                                }, 
                                child: const Text("Log Out", style: TextStyle(color: Colors.red))
                              ),
                            ],
                          )
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProfileItem(IconData icon, String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardSurface, 
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1), 
            blurRadius: 10, 
            offset: const Offset(0, 5)
          )
        ]
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.royalBlue.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.royalBlue, size: 22),
          ),
          const SizedBox(width: 20),
          Expanded( // Agar teks panjang tidak overflow
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontSize: 12, color: AppColors.softBlueGrey)),
                const SizedBox(height: 4),
                Text(value, style: const TextStyle(fontSize: 16, color: AppColors.creamWhite, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem(BuildContext context, IconData icon, String title, {bool isDestructive = false, required VoidCallback onTap}) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isDestructive ? Colors.red.withValues(alpha: 0.1) : AppColors.inputFill,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: isDestructive ? Colors.red : AppColors.softBlueGrey),
      ),
      title: Text(title, style: TextStyle(
        color: isDestructive ? Colors.red : AppColors.creamWhite,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      )),
      trailing: const Icon(Icons.chevron_right, color: AppColors.softBlueGrey),
    );
  }
}