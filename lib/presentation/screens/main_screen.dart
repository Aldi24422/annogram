import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui; // Needed for BackdropFilter
import 'package:flutter/material.dart';
import '../../core/theme/colors.dart';
import '../../main.dart';
import '../../data/models/chat/chat_model.dart'; // Import Chat Model untuk Navigasi
import 'chat/chat_list_screen.dart';
import 'chat/new_chat_screen.dart';
import 'chat/chat_screen.dart'; // Import Chat Screen
import 'chat/search_chat_screen.dart';
import 'profile/profile_screen.dart';
import 'settings/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isPrivateTabUnlocked = false;
  int _previousTabIndex = 0;
  Timer? _inactivityTimer;
  static const int _autoLockSeconds = 15;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_onTabChanged);

    // Safety check: Ensure provider data is loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      telegramProvider.refreshSession();
    });
  }

  void _onTabChanged() {
    // Auto-lock Private tab when switching away from it
    if (_previousTabIndex == 2 && _tabController.index != 2) {
      _lockPrivateTab();
    }
    // Reset inactivity timer when switching to Private tab
    if (_tabController.index == 2 && _isPrivateTabUnlocked) {
      _resetInactivityTimer();
    }
    _previousTabIndex = _tabController.index;
  }

  void _unlockPrivateTab() {
    setState(() => _isPrivateTabUnlocked = true);
    _resetInactivityTimer();
  }

  void _lockPrivateTab() {
    _inactivityTimer?.cancel();
    setState(() => _isPrivateTabUnlocked = false);
  }

  void _resetInactivityTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(const Duration(seconds: _autoLockSeconds), () {
      // Auto-lock after 15 seconds of inactivity
      if (_isPrivateTabUnlocked && _tabController.index == 2) {
        _lockPrivateTab();
      }
    });
  }

  @override
  void dispose() {
    _inactivityTimer?.cancel();
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  // LOGIC BUKA SAVED MESSAGES (BARU)
  void _openSavedMessages() {
    Navigator.pop(context); // Tutup drawer dulu
    telegramProvider.openSavedMessages((chatId) {
      // Buat objek Chat sementara untuk navigasi
      final savedChat = Chat(
          id: chatId,
          name: "Saved Messages",
          avatarUrl: null, // Saved Messages biasanya pakai icon, bukan avatar
          timestamp: DateTime.now(),
          isOnline: true);

      Navigator.push(context,
          MaterialPageRoute(builder: (_) => ChatScreen(chat: savedChat)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([telegramProvider, themeProvider]),
      builder: (context, child) {
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
            elevation: 0,
            title: const Text('AnnoGram',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const SearchChatScreen()));
                },
              ),
            ],
            bottom: TabBar(
              controller: _tabController,
              indicatorColor: AppColors.royalBlue,
              labelColor: AppColors.royalBlue,
              unselectedLabelColor: AppColors.softBlueGrey,
              indicatorWeight: 3,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              tabs: const [
                Tab(text: "All"),
                Tab(text: "Groups"),
                Tab(text: "Private"),
              ],
            ),
          ),
          drawer: _buildGlassDrawer(context),
          body: TabBarView(
            controller: _tabController,
            children: [
              const ChatListScreen(filter: 'all'),
              const ChatListScreen(filter: 'groups'),
              ChatListScreen(
                filter: 'private',
                isLocked: !_isPrivateTabUnlocked,
                onUnlock: _unlockPrivateTab,
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.royalBlue,
            child: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const NewChatScreen()));
            },
          ),
        );
      },
    );
  }

  Widget _buildGlassDrawer(BuildContext context) {
    final me = telegramProvider.me;
    final String name = me?.name ??
        (telegramProvider.errorMessage != null
            ? "Error: ${telegramProvider.errorMessage}"
            : "Loading...");
    final String phone = me?.phoneNumber ?? "";
    final String? avatarPath = me?.avatarUrl;
    final isDark = themeProvider.isDarkMode;

    return Drawer(
      backgroundColor: Colors.transparent, // Transparent for glass effect
      child: Container(
        decoration: BoxDecoration(
          color:
              Theme.of(context).scaffoldBackgroundColor.withValues(alpha: 0.85),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 20,
              spreadRadius: 5,
            )
          ],
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Column(
              children: [
                // Custom Profile Header
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: isDark
                          ? [
                              AppColors.royalBlue.withValues(alpha: 0.2),
                              Colors.transparent
                            ]
                          : [
                              AppColors.royalBlue.withValues(alpha: 0.1),
                              Colors.transparent
                            ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Row(
                    children: [
                      Hero(
                        tag: 'sidebar_avatar',
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: AppColors.royalBlue, width: 2),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    AppColors.royalBlue.withValues(alpha: 0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              )
                            ],
                          ),
                          child: CircleAvatar(
                            backgroundColor: AppColors.royalBlue,
                            backgroundImage: (avatarPath != null &&
                                    File(avatarPath).existsSync())
                                ? FileImage(File(avatarPath))
                                : null,
                            child: (avatarPath == null ||
                                    !File(avatarPath).existsSync())
                                ? Text(name.isNotEmpty ? name[0] : "A",
                                    style: const TextStyle(
                                        fontSize: 28,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))
                                : null,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.color,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),
                            const SizedBox(height: 4),
                            Text(phone,
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.color,
                                  fontSize: 14,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    children: [
                      _buildGlassMenuItem(
                          context, Icons.person_rounded, "My Profile", () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const ProfileScreen()));
                      }),
                      _buildGlassMenuItem(
                          context, Icons.group_add_rounded, "New Group", () {}),
                      _buildGlassMenuItem(
                          context, Icons.contacts_rounded, "Contacts", () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const NewChatScreen()));
                      }),
                      _buildGlassMenuItem(context, Icons.bookmark_rounded,
                          "Saved Messages", _openSavedMessages),
                      _buildGlassMenuItem(
                          context, Icons.call_rounded, "Calls", () {}),
                      const SizedBox(height: 20),
                      Divider(
                          color: Theme.of(context)
                              .dividerColor
                              .withValues(alpha: 0.5)),
                      const SizedBox(height: 20),
                      _buildGlassMenuItem(
                          context, Icons.settings_rounded, "Settings", () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const SettingsScreen()));
                      }),
                    ],
                  ),
                ),

                // Fun Animated Theme Switcher
                Container(
                  margin:
                      const EdgeInsets.only(bottom: 30, left: 20, right: 20),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () => themeProvider.toggleTheme(!isDark),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: isDark
                            ? const Color(0xFF2C3E50)
                            : const Color(0xFFF1C40F).withValues(alpha: 0.2),
                      ),
                      child: Stack(
                        children: [
                          // Sun/Moon Icons Background
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 14),
                                child: Icon(Icons.nightlight_round,
                                    color: isDark
                                        ? Colors.yellow
                                        : Colors.grey.withValues(alpha: 0.5),
                                    size: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 14),
                                child: Icon(Icons.wb_sunny_rounded,
                                    color: isDark
                                        ? Colors.grey.withValues(alpha: 0.5)
                                        : Colors.orange,
                                    size: 20),
                              ),
                            ],
                          ),
                          // Sliding Knob
                          AnimatedAlign(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.elasticOut,
                            alignment: isDark
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            child: Container(
                              width: 42,
                              height: 42, // knob size
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26, blurRadius: 4)
                                ],
                              ),
                              child: Center(
                                child: isDark
                                    ? const Icon(Icons.nightlight_round,
                                        color: Color(0xFF2C3E50), size: 20)
                                    : const Icon(Icons.wb_sunny_rounded,
                                        color: Colors.orange, size: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGlassMenuItem(
      BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.royalBlue.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: AppColors.royalBlue, size: 22),
      ),
      title: Text(title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      hoverColor: AppColors.royalBlue.withValues(alpha: 0.05),
    );
  }
}
