import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../../data/models/chat/chat_model.dart';
import '../../../core/theme/colors.dart';
import '../../../core/services/security_service.dart';
import '../auth/pin_screen.dart';
import 'chat_screen.dart';
import 'archived_chats_screen.dart';

class ChatListScreen extends StatelessWidget {
  final String filter;
  final bool isLocked;
  final VoidCallback? onUnlock;

  const ChatListScreen({
    super.key,
    required this.filter,
    this.isLocked = false,
    this.onUnlock,
  });

  @override
  Widget build(BuildContext context) {
    // Show locked overlay for Private tab when locked
    if (filter == 'private' && isLocked) {
      return _buildLockedOverlay(context);
    }

    final allChats = telegramProvider.chats;
    allChats.sort((a, b) {
      if (a.isPinned && !b.isPinned) return -1;
      if (!a.isPinned && b.isPinned) return 1;
      return b.timestamp.compareTo(a.timestamp);
    });

    final archivedChats = allChats.where((c) => c.isArchived).toList();
    final securityService = SecurityService();
    final displayChats = allChats.where((chat) {
      if (chat.isArchived) return false;
      final isSecretFromStorage = securityService.isSecretChat(chat.id);
      if (filter == 'groups') return chat.isGroup;
      if (filter == 'private') return isSecretFromStorage;
      return !isSecretFromStorage; // All tab excludes secret chats
    }).toList();

    if (displayChats.isEmpty && filter == 'all') {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.chat_bubble_outline_rounded,
                size: 80, color: AppColors.softBlueGrey.withValues(alpha: 0.5)),
            const SizedBox(height: 20),
            const Text("No chats yet",
                style: TextStyle(color: AppColors.softBlueGrey, fontSize: 18)),
            const SizedBox(height: 8),
            Text(
              "Tap the button below to start a new conversation",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.softBlueGrey.withValues(alpha: 0.7),
                  fontSize: 13),
            ),
            if (telegramProvider.contacts.isEmpty) ...[
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  telegramProvider.syncDeviceContacts();
                },
                icon: const Icon(Icons.sync),
                label: const Text("Sync Device Contacts"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.royalBlue,
                  foregroundColor: Colors.white,
                ),
              )
            ]
          ],
        ),
      );
    }

    // Empty state for Private tab (when no secret chats exist)
    if (displayChats.isEmpty && filter == 'private') {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.lock_outline,
                size: 80, color: AppColors.softBlueGrey.withValues(alpha: 0.5)),
            const SizedBox(height: 20),
            const Text("No secret chats yet",
                style: TextStyle(color: AppColors.softBlueGrey)),
            const SizedBox(height: 8),
            Text(
              "Start a new secret chat from the\nNew Message screen",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.softBlueGrey.withValues(alpha: 0.7),
                  fontSize: 13),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 100),
      itemCount: displayChats.length +
          (filter == 'all' && archivedChats.isNotEmpty ? 1 : 0),
      separatorBuilder: (context, index) => const SizedBox(height: 1),
      itemBuilder: (context, index) {
        if (filter == 'all' && archivedChats.isNotEmpty) {
          if (index == 0) {
            return _buildArchivedRow(context, archivedChats.length);
          }
          final chat = displayChats[index - 1];
          return _buildModernChatItem(context, chat);
        }
        final chat = displayChats[index];
        return _buildModernChatItem(context, chat);
      },
    );
  }

  Widget _buildLockedOverlay(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).scaffoldBackgroundColor,
            AppColors.midnightBlue.withValues(alpha: 0.9),
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated lock icon with glow effect
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Colors.greenAccent.withValues(alpha: 0.3),
                    Colors.greenAccent.withValues(alpha: 0.1),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.greenAccent.withValues(alpha: 0.3),
                    blurRadius: 30,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: const Icon(
                Icons.lock_rounded,
                size: 60,
                color: Colors.greenAccent,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              "Private Chats",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Protected with PIN",
              style: TextStyle(
                color: AppColors.softBlueGrey.withValues(alpha: 0.8),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () => _showPinScreen(context),
              icon: const Icon(Icons.lock_open),
              label: const Text("Unlock"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                foregroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 8,
                shadowColor: Colors.greenAccent.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPinScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => PinScreen(
          onSuccess: () {
            Navigator.pop(context);
            SecurityService().unlockSession();
            onUnlock?.call();
          },
        ),
      ),
    );
  }

  Widget _buildArchivedRow(BuildContext context, int count) {
    return Column(
      children: [
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.softBlueGrey.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.archive_outlined,
                color: AppColors.softBlueGrey, size: 22),
          ),
          title: Text("Archived Chats",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Theme.of(context).textTheme.bodyMedium?.color)),
          trailing: count > 0
              ? Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      color: AppColors.softBlueGrey.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(count.toString(),
                      style: const TextStyle(
                          color: AppColors.creamWhite,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)))
              : null,
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ArchivedChatsScreen()));
          },
        ),
        Divider(
            height: 1, color: AppColors.softBlueGrey.withValues(alpha: 0.1)),
      ],
    );
  }

  Widget _buildModernChatItem(BuildContext context, Chat chat) {
    bool isSavedMessage = chat.name == "Saved Messages";

    return Container(
      // FIXED: withOpacity -> withValues(alpha: ...)
      color: chat.isPinned
          ? Theme.of(context).cardColor.withValues(alpha: 0.8)
          : Theme.of(context).cardColor,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          radius: 28,
          backgroundColor: isSavedMessage
              ? AppColors.royalBlue
              : AppColors.royalBlue.withValues(alpha: 0.2),
          backgroundImage: (chat.avatarUrl != null && !isSavedMessage)
              ? NetworkImage(chat.avatarUrl!)
              : null,
          child: isSavedMessage
              ? const Icon(Icons.bookmark_rounded,
                  color: Colors.white, size: 28)
              : (chat.avatarUrl == null
                  ? Text(chat.name.isNotEmpty ? chat.name[0] : '?',
                      style: const TextStyle(
                          color: AppColors.royalBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20))
                  : null),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                isSavedMessage ? "Saved Messages" : chat.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Theme.of(context).textTheme.bodyMedium?.color),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (chat.isMuted)
              const Icon(Icons.volume_off,
                  size: 14, color: AppColors.softBlueGrey),
          ],
        ),
        subtitle: Text(chat.lastMessage ?? 'No messages',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style:
                TextStyle(color: Theme.of(context).textTheme.bodySmall?.color)),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (chat.isPinned)
              const Icon(Icons.push_pin,
                  size: 14, color: AppColors.softBlueGrey),
            Text(_formatTime(chat.timestamp),
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodySmall?.color,
                    fontSize: 12)),
            if (chat.unreadCount > 0) ...[
              const SizedBox(height: 8),
              Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                      color: AppColors.royalBlue, shape: BoxShape.circle),
                  child: Text(chat.unreadCount.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold)))
            ]
          ],
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => ChatScreen(chat: chat)));
        },
        onLongPress: () {
          _showChatOptions(context, chat);
        },
      ),
    );
  }

  void _showChatOptions(BuildContext context, Chat chat) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).cardColor,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(
                  chat.isPinned ? Icons.push_pin_outlined : Icons.push_pin,
                  color: AppColors.royalBlue),
              title: Text(chat.isPinned ? "Unpin" : "Pin"),
              onTap: () {
                telegramProvider.togglePinChat(chat.id, chat.isPinned);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(chat.isMuted ? Icons.volume_up : Icons.volume_off,
                  color: AppColors.softBlueGrey),
              title: Text(chat.isMuted ? "Unmute" : "Mute"),
              onTap: () {
                telegramProvider.toggleMuteChat(chat.id, chat.isMuted);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: const Text("Delete Chat",
                  style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(context);
                _confirmDelete(context, chat);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, Chat chat) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Dismiss",
      barrierColor: Colors.black.withValues(alpha: 0.5),
      pageBuilder: (context, _, __) {
        return Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.cardSurface.withValues(alpha: 0.95),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                  color: AppColors.softBlueGrey.withValues(alpha: 0.2)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                )
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.red.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.delete_forever_rounded,
                        size: 32, color: Colors.red),
                  ),
                  const SizedBox(height: 16),
                  const Text("Delete Chat?",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.creamWhite)),
                  const SizedBox(height: 8),
                  Text("This action cannot be undone.\nAre you sure?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.creamWhite.withValues(alpha: 0.7))),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: BorderSide(
                                    color: AppColors.softBlueGrey
                                        .withValues(alpha: 0.3))),
                          ),
                          child: const Text("Cancel",
                              style: TextStyle(
                                  color: AppColors.creamWhite,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            telegramProvider.deleteChat(chat.id);
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text("Delete",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim, secondaryAnim, child) {
        return FadeTransition(
          opacity: anim,
          child: ScaleTransition(
            scale: CurvedAnimation(parent: anim, curve: Curves.easeOutBack),
            child: child,
          ),
        );
      },
    );
  }

  String _formatTime(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);
    if (difference.inDays > 0) return '${timestamp.day}/${timestamp.month}';
    return '${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}';
  }
}
