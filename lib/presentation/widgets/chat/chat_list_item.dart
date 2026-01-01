import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../../data/models/chat/chat_model.dart';
import '../common/chat_avatar.dart';

class ChatListItem extends StatelessWidget {
  final Chat chat;
  final VoidCallback onTap;

  const ChatListItem({
    super.key,
    required this.chat,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _buildAvatar(context),
      title: _buildTitle(),
      subtitle: _buildSubtitle(),
      trailing: _buildTrailing(),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }

  Widget _buildAvatar(BuildContext context) {
    return ChatAvatar(
      name: chat.name,
      imageUrl: chat.avatarUrl,
      size: 28,
      isOnline: chat.isOnline,
      showOnlineStatus: true,
    );
  }

  Widget _buildTitle() {
    return Text(
      chat.name,
      style: TextStyle(
        fontWeight: chat.unreadCount > 0 ? FontWeight.bold : FontWeight.normal,
        fontSize: 16,
        color: AppColors.creamWhite,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSubtitle() {
    return Text(
      chat.lastMessage ?? 'No messages yet',
      style: TextStyle(
        fontWeight: chat.unreadCount > 0 ? FontWeight.w600 : FontWeight.normal,
        fontSize: 14,
        color: AppColors.softBlueGrey,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildTrailing() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          _formatTime(chat.timestamp),
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.softBlueGrey,
          ),
        ),
        if (chat.unreadCount > 0) ...[
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: AppColors.royalBlue,
              shape: BoxShape.circle,
            ),
            child: Text(
              chat.unreadCount > 99 ? '99+' : chat.unreadCount.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ],
    );
  }

  String _formatTime(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays > 7) {
      return '${timestamp.day}/${timestamp.month}';
    } else if (difference.inDays > 0) {
      return '${difference.inDays}d';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m';
    } else {
      return 'now';
    }
  }
}
