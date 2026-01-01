import 'dart:io';
import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../../data/models/chat/user_model.dart';
import '../../../core/theme/colors.dart';

class AddMemberScreen extends StatefulWidget {
  final String chatId;
  const AddMemberScreen({super.key, required this.chatId});

  @override
  State<AddMemberScreen> createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  List<User> _filteredUsers = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredUsers = telegramProvider.contacts;
  }

  void _filterUsers(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredUsers = telegramProvider.contacts;
      } else {
        _filteredUsers = telegramProvider.contacts
            .where((user) => user.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _addMember(User user) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.cardSurface,
        title: Text("Add ${user.name}?", style: const TextStyle(color: AppColors.creamWhite)),
        content: const Text("They will be added to this group.", style: TextStyle(color: AppColors.softBlueGrey)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Cancel")),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx); // Tutup dialog
              telegramProvider.addChatMember(widget.chatId, user.id);
              Navigator.pop(context); // Kembali ke Chat Info
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Adding ${user.name} to group..."))
              );
            },
            child: const Text("Add", style: TextStyle(color: AppColors.royalBlue, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.midnightBlue,
      appBar: AppBar(
        title: const Text("Add Members"),
        backgroundColor: AppColors.midnightBlue,
        foregroundColor: AppColors.creamWhite,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.inputFill,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: _filterUsers,
                style: const TextStyle(color: AppColors.creamWhite),
                decoration: const InputDecoration(
                  hintText: "Search contacts...",
                  hintStyle: TextStyle(color: AppColors.softBlueGrey),
                  prefixIcon: Icon(Icons.search, color: AppColors.softBlueGrey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredUsers.length,
              itemBuilder: (context, index) {
                final user = _filteredUsers[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: AppColors.royalBlue.withValues(alpha: 0.2),
                    backgroundImage: (user.avatarUrl != null && File(user.avatarUrl!).existsSync())
                        ? FileImage(File(user.avatarUrl!))
                        : null,
                    child: (user.avatarUrl == null) ? Text(user.name[0]) : null,
                  ),
                  title: Text(user.name, style: const TextStyle(color: AppColors.creamWhite, fontWeight: FontWeight.bold)),
                  onTap: () => _addMember(user),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}