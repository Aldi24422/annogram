import 'package:flutter/material.dart';
import '../../../main.dart'; 
import '../../../data/models/chat/message_model.dart';
import '../../../core/theme/colors.dart';
import 'chat_screen.dart'; // Import Chat Screen

class SearchMessageScreen extends StatefulWidget {
  final String chatId;

  const SearchMessageScreen({super.key, required this.chatId});

  @override
  State<SearchMessageScreen> createState() => _SearchMessageScreenState();
}

class _SearchMessageScreenState extends State<SearchMessageScreen> {
  final TextEditingController _searchController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      telegramProvider.clearSearch();
    });
  }

  void _onSearchChanged(String query) {
    if (query.trim().isNotEmpty) {
      telegramProvider.searchMessages(widget.chatId, query);
    } else {
      telegramProvider.clearSearch();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.midnightBlue,
      appBar: AppBar(
        backgroundColor: AppColors.midnightBlue,
        foregroundColor: AppColors.creamWhite,
        elevation: 0,
        title: Container(
          height: 45,
          decoration: BoxDecoration(
            color: AppColors.inputFill,
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            controller: _searchController,
            autofocus: true,
            style: const TextStyle(color: AppColors.creamWhite),
            cursorColor: AppColors.royalBlue,
            decoration: InputDecoration(
              hintText: 'Search in this chat...',
              hintStyle: TextStyle(color: AppColors.softBlueGrey.withValues(alpha: 0.5)),
              border: InputBorder.none,
              prefixIcon: const Icon(Icons.search, color: AppColors.softBlueGrey),
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear, color: AppColors.softBlueGrey),
                onPressed: () {
                  _searchController.clear();
                  telegramProvider.clearSearch();
                },
              ),
            ),
            onChanged: _onSearchChanged,
          ),
        ),
      ),
      body: AnimatedBuilder(
        animation: telegramProvider,
        builder: (context, child) {
          final results = telegramProvider.searchResults;

          if (_searchController.text.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search, size: 64, color: AppColors.softBlueGrey.withValues(alpha: 0.2)),
                  const SizedBox(height: 16),
                  Text("Search for messages", style: TextStyle(color: AppColors.softBlueGrey.withValues(alpha: 0.5))),
                ],
              ),
            );
          }

          if (results.isEmpty) {
            return Center(
              child: Text("No results found", style: TextStyle(color: AppColors.softBlueGrey.withValues(alpha: 0.8))),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: results.length,
            separatorBuilder: (context, index) => const Divider(color: AppColors.inputFill),
            itemBuilder: (context, index) {
              final msg = results[index];
              return _buildSearchResultItem(msg);
            },
          );
        },
      ),
    );
  }

  Widget _buildSearchResultItem(Message msg) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: AppColors.royalBlue.withValues(alpha: 0.2),
        child: const Icon(Icons.message, color: AppColors.royalBlue, size: 20),
      ),
      title: Text(
        msg.isOutgoing ? "You" : "Partner",
        style: const TextStyle(color: AppColors.royalBlue, fontWeight: FontWeight.bold, fontSize: 14),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          Text(
            msg.text.isNotEmpty ? msg.text : '[Media]',
            maxLines: 2, overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: AppColors.creamWhite),
          ),
          const SizedBox(height: 4),
          Text(
            "${msg.timestamp.day}/${msg.timestamp.month}/${msg.timestamp.year}",
            style: TextStyle(color: AppColors.softBlueGrey.withValues(alpha: 0.6), fontSize: 11),
          ),
        ],
      ),
      onTap: () {
        // JUMP TO MESSAGE ACTION (OPTION B)
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => ChatScreen(
              chat: telegramProvider.chats.firstWhere((c) => c.id == widget.chatId),
              highlightMessageId: msg.id, // KIRIM ID PESAN
            )
          )
        );
      },
    );
  }
}