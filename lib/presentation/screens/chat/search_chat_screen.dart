import 'package:flutter/material.dart';
import '../../../main.dart'; // Akses telegramProvider
import '../../../data/models/chat/chat_model.dart';
import '../../widgets/chat/chat_list_item.dart';
import '../../../core/theme/colors.dart';
import 'chat_screen.dart';

class SearchChatScreen extends StatefulWidget {
  const SearchChatScreen({super.key});

  @override
  State<SearchChatScreen> createState() => _SearchChatScreenState();
}

class _SearchChatScreenState extends State<SearchChatScreen> {
  // Mengambil data asli dari Provider
  late List<Chat> _allChats;
  List<Chat> _filteredChats = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Ambil chat yang sudah ada di memori
    _allChats = telegramProvider.chats;
    _filteredChats = _allChats;
  }

  void _filterChats(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredChats = _allChats;
      } else {
        _filteredChats = _allChats
            .where((chat) => chat.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
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
            style: const TextStyle(
              color: AppColors.creamWhite,
              fontSize: 16, 
            ),
            cursorColor: AppColors.royalBlue,
            decoration: InputDecoration(
              hintText: 'Search chats...',
              hintStyle: TextStyle(color: AppColors.softBlueGrey.withValues(alpha: 0.5)),
              border: InputBorder.none,
              prefixIcon: const Icon(Icons.search, color: AppColors.softBlueGrey),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear, color: AppColors.softBlueGrey, size: 20),
                      onPressed: () {
                        _searchController.clear();
                        _filterChats('');
                      },
                    )
                  : null,
            ),
            onChanged: _filterChats,
          ),
        ),
        titleSpacing: 0,
        actions: const [SizedBox(width: 16)],
      ),
      
      body: _filteredChats.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: AppColors.inputFill,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.search_off_rounded, 
                      size: 48, 
                      color: Color(0x80A9B5DF), 
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No chats found',
                    style: TextStyle(
                      color: AppColors.softBlueGrey.withValues(alpha: 0.8),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: _filteredChats.length,
              itemBuilder: (context, index) {
                final chat = _filteredChats[index];
                return ChatListItem(
                  chat: chat,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(chat: chat),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}