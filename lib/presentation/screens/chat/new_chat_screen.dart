import 'dart:io';
import 'package:flutter/material.dart';
import '../../../main.dart'; // Akses global provider
import '../../../data/models/chat/chat_model.dart';
import '../../../data/models/chat/user_model.dart';
import '../../../core/theme/colors.dart';
import '../../../core/services/security_service.dart';
import '../auth/pin_screen.dart';
import 'chat_screen.dart';
import 'new_group_screen.dart';

class NewChatScreen extends StatefulWidget {
  const NewChatScreen({super.key});

  @override
  State<NewChatScreen> createState() => _NewChatScreenState();
}

class _NewChatScreenState extends State<NewChatScreen> {
  List<User> _filteredUsers = [];
  final TextEditingController _searchController = TextEditingController();
  bool _isSecretMode = false;
  bool _isLoadingChat = false;
  bool _isSyncing = false;

  @override
  void initState() {
    super.initState();
    _filteredUsers = telegramProvider.contacts;

    // Auto-sync contacts if list is empty
    if (telegramProvider.contacts.isEmpty) {
      _triggerAutoSync();
    }
  }

  void _triggerAutoSync() async {
    setState(() => _isSyncing = true);
    await telegramProvider.syncDeviceContacts();
    // Wait a bit for contacts to load
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() {
        _isSyncing = false;
        _filteredUsers = telegramProvider.contacts;
      });
    }
  }

  void _filterUsers(String query) {
    final contacts = telegramProvider.contacts;
    setState(() {
      if (query.isEmpty) {
        _filteredUsers = contacts;
      } else {
        _filteredUsers = contacts
            .where(
                (user) => user.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _activateSecretMode() {
    if (SecurityService().isUnlocked) {
      setState(() {
        _isSecretMode = true;
        _searchController.clear();
        _filteredUsers = telegramProvider.contacts;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => PinScreen(
            onSuccess: () {
              Navigator.pop(context);
              SecurityService().unlockSession();
              setState(() {
                _isSecretMode = true;
                _searchController.clear();
                _filteredUsers = telegramProvider.contacts;
              });
            },
          ),
        ),
      );
    }
  }

  void _onContactSelected(User user) async {
    setState(() => _isLoadingChat = true);

    telegramProvider.createPrivateChat(user.id, (chatId) async {
      if (!mounted) return;

      // Persist secret chat ID if in secret mode
      if (_isSecretMode) {
        await SecurityService().addSecretChat(chatId);
      }

      setState(() => _isLoadingChat = false);

      final chat = Chat(
        id: chatId,
        name: user.name,
        avatarUrl: user.avatarUrl,
        timestamp: DateTime.now(),
        isOnline: user.isOnline,
        isSecret: _isSecretMode,
        lastMessage:
            _isSecretMode ? '🔒 Secret Chat started' : 'Tap to start chatting',
      );

      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ChatScreen(chat: chat)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: telegramProvider,
      builder: (context, child) {
        if (_searchController.text.isEmpty) {
          _filteredUsers = telegramProvider.contacts;
        }

        return PopScope(
          canPop: !_isSecretMode,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) return;
            setState(() => _isSecretMode = false);
          },
          child: Scaffold(
            backgroundColor: theme.scaffoldBackgroundColor,
            appBar: AppBar(
              backgroundColor: theme.appBarTheme.backgroundColor,
              foregroundColor: theme.appBarTheme.foregroundColor,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: theme.iconTheme.color),
                onPressed: () {
                  if (_isSecretMode) {
                    setState(() => _isSecretMode = false);
                  } else {
                    Navigator.pop(context);
                  }
                },
              ),
              title: Text(
                _isSecretMode ? 'New Secret Chat' : 'New Message',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: _isSecretMode
                      ? Colors.greenAccent
                      : theme.textTheme.bodyMedium?.color,
                ),
              ),
            ),
            body: Stack(
              children: [
                Column(
                  children: [
                    // SEARCH BAR
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: theme.inputDecorationTheme.fillColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TextField(
                          controller: _searchController,
                          style: TextStyle(
                              color: theme.textTheme.bodyMedium?.color),
                          onChanged: _filterUsers,
                          decoration: InputDecoration(
                            hintText: 'Search contacts...',
                            hintStyle: theme.inputDecorationTheme.hintStyle,
                            prefixIcon: Icon(Icons.search,
                                color: theme.iconTheme.color),
                            border: InputBorder.none,
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 10),
                          ),
                        ),
                      ),
                    ),

                    if (!_isSecretMode && _searchController.text.isEmpty) ...[
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        leading: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: theme.cardColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.greenAccent, width: 1.5),
                          ),
                          child: const Icon(Icons.lock_outline,
                              color: Colors.greenAccent),
                        ),
                        title: const Text(
                          'New Secret Chat',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.greenAccent,
                              fontSize: 16),
                        ),
                        onTap: _activateSecretMode,
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        leading: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: theme.cardColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: AppColors.royalBlue, width: 1.5),
                          ),
                          child: const Icon(Icons.group_add,
                              color: AppColors.royalBlue),
                        ),
                        title: Text(
                          'New Group',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: theme.textTheme.bodyMedium?.color,
                              fontSize: 16),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const NewGroupScreen()));
                        },
                      ),
                    ],

                    if (_isSecretMode)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        color: Colors.greenAccent.withValues(alpha: 0.1),
                        child: const Text(
                          "Select a contact to start encryption",
                          style: TextStyle(
                              color: Colors.greenAccent, fontSize: 12),
                        ),
                      ),

                    // LIST KONTAK ASLI
                    Expanded(
                      child: _filteredUsers.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (_isSyncing) ...[
                                    const CircularProgressIndicator(
                                        color: AppColors.royalBlue),
                                    const SizedBox(height: 16),
                                    Text("Syncing contacts...",
                                        style: TextStyle(
                                            color: theme
                                                .textTheme.bodySmall?.color)),
                                  ] else ...[
                                    Icon(Icons.perm_contact_calendar_rounded,
                                        size: 60, color: theme.disabledColor),
                                    const SizedBox(height: 16),
                                    Text("No contacts found",
                                        style: TextStyle(
                                            color: theme
                                                .textTheme.bodySmall?.color)),
                                    const SizedBox(height: 16),
                                    ElevatedButton.icon(
                                      onPressed: _triggerAutoSync,
                                      icon: const Icon(Icons.sync),
                                      label: const Text("Sync Contacts"),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.royalBlue,
                                        foregroundColor: Colors.white,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            )
                          : ListView.builder(
                              itemCount: _filteredUsers.length,
                              itemBuilder: (context, index) {
                                final user = _filteredUsers[index];
                                return ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 4),
                                  leading: CircleAvatar(
                                    backgroundImage: (user.avatarUrl != null &&
                                            File(user.avatarUrl!).existsSync())
                                        ? FileImage(File(user.avatarUrl!))
                                        : null,
                                    backgroundColor: AppColors.royalBlue
                                        .withValues(alpha: 0.2),
                                    radius: 24,
                                    child: (user.avatarUrl == null ||
                                            !File(user.avatarUrl!).existsSync())
                                        ? Text(
                                            user.name.isNotEmpty
                                                ? user.name[0]
                                                : '?',
                                            style: const TextStyle(
                                                color: AppColors.royalBlue))
                                        : null,
                                  ),
                                  title: Text(
                                    user.name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color:
                                            theme.textTheme.bodyMedium?.color,
                                        fontSize: 16),
                                  ),
                                  subtitle: Text(
                                    user.status ?? 'Offline',
                                    style: TextStyle(
                                        color: user.status == 'Online'
                                            ? Colors.blueAccent
                                            : theme.textTheme.bodySmall?.color),
                                  ),
                                  onTap: () => _onContactSelected(user),
                                );
                              },
                            ),
                    ),
                  ],
                ),
                if (_isLoadingChat)
                  Container(
                    color: Colors.black54,
                    child: const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
