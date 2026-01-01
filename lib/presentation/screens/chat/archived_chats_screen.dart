import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../../core/theme/colors.dart';
import 'chat_screen.dart';

class ArchivedChatsScreen extends StatelessWidget {
  const ArchivedChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final archivedChats = telegramProvider.chats.where((c) => c.isArchived).toList();

    return Scaffold(
      backgroundColor: AppColors.midnightBlue,
      appBar: AppBar(
        title: const Text("Archived Chats", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.midnightBlue,
        foregroundColor: AppColors.creamWhite,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: archivedChats.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.archive_outlined, size: 64, color: AppColors.softBlueGrey.withValues(alpha: 0.5)),
                  const SizedBox(height: 16),
                  Text(
                    "No archived chats",
                    style: TextStyle(color: AppColors.softBlueGrey.withValues(alpha: 0.5)),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: archivedChats.length,
              itemBuilder: (context, index) {
                final chat = archivedChats[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  leading: CircleAvatar(
                    backgroundColor: AppColors.royalBlue,
                    child: Text(chat.name[0], style: const TextStyle(color: Colors.white)),
                  ),
                  title: Text(chat.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  subtitle: Text(chat.lastMessage ?? '', style: const TextStyle(color: Colors.grey)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => ChatScreen(chat: chat)),
                    );
                  },
                );
              },
            ),
    );
  }
}