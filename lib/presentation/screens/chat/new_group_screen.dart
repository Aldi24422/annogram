import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../../data/models/chat/chat_model.dart';
import '../../../data/models/chat/user_model.dart';
import '../../../core/theme/colors.dart';
import 'chat_screen.dart';
import '../../widgets/common/chat_avatar.dart';

class NewGroupScreen extends StatefulWidget {
  const NewGroupScreen({super.key});

  @override
  State<NewGroupScreen> createState() => _NewGroupScreenState();
}

class _NewGroupScreenState extends State<NewGroupScreen> {
  List<User> _filteredUsers = [];
  final Set<String> _selectedUserIds = {};
  final TextEditingController _searchController = TextEditingController();
  bool _isCreating = false;

  @override
  void initState() {
    super.initState();
    _filteredUsers = telegramProvider.contacts;
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

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: telegramProvider,
      builder: (context, child) {
        if (_searchController.text.isEmpty) {
          _filteredUsers = telegramProvider.contacts;
        }

        return Scaffold(
          backgroundColor: AppColors.midnightBlue,
          appBar: AppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('New Group',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  '${_selectedUserIds.length} selected',
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: AppColors.softBlueGrey),
                ),
              ],
            ),
            backgroundColor: AppColors.midnightBlue,
            foregroundColor: AppColors.creamWhite,
            elevation: 0,
          ),
          floatingActionButton: _selectedUserIds.isNotEmpty
              ? FloatingActionButton(
                  onPressed: _isCreating ? null : () => _showGroupNameDialog(),
                  backgroundColor: AppColors.royalBlue,
                  foregroundColor: AppColors.creamWhite,
                  child: _isCreating
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                              color: Colors.white, strokeWidth: 2))
                      : const Icon(Icons.arrow_forward),
                )
              : null,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: AppColors.inputFill,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextField(
                    controller: _searchController,
                    style: const TextStyle(color: AppColors.creamWhite),
                    onChanged: _filterUsers,
                    decoration: const InputDecoration(
                      hintText: 'Search people...',
                      hintStyle: TextStyle(color: AppColors.softBlueGrey),
                      prefixIcon:
                          Icon(Icons.search, color: AppColors.softBlueGrey),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: _filteredUsers.isEmpty
                    ? const Center(
                        child: Text("No contacts found",
                            style: TextStyle(color: AppColors.softBlueGrey)))
                    : ListView.builder(
                        itemCount: _filteredUsers.length,
                        itemBuilder: (context, index) {
                          final user = _filteredUsers[index];
                          final isSelected = _selectedUserIds.contains(user.id);

                          return ListTile(
                            onTap: () {
                              setState(() {
                                if (isSelected) {
                                  _selectedUserIds.remove(user.id);
                                } else {
                                  _selectedUserIds.add(user.id);
                                }
                              });
                            },
                            leading: Stack(
                              children: [
                                ChatAvatar(
                                  name: user.name,
                                  imagePath: user.avatarUrl,
                                  size: 20,
                                  showOnlineStatus: false,
                                ),
                                if (isSelected)
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          color: AppColors.royalBlue,
                                          shape: BoxShape.circle,
                                          border: Border.fromBorderSide(
                                              BorderSide(
                                                  color: AppColors.midnightBlue,
                                                  width: 1.5))),
                                      padding: const EdgeInsets.all(2),
                                      child: const Icon(Icons.check,
                                          color: Colors.white, size: 12),
                                    ),
                                  ),
                              ],
                            ),
                            title: Text(user.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.creamWhite)),
                            subtitle: Text(user.status ?? 'Offline',
                                style: TextStyle(
                                    color: user.status == 'Online'
                                        ? Colors.blueAccent
                                        : AppColors.softBlueGrey
                                            .withValues(alpha: 0.6))),
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showGroupNameDialog() {
    final nameController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.cardSurface,
        title: const Text('Enter Group Name',
            style: TextStyle(color: AppColors.creamWhite)),
        content: TextField(
          controller: nameController,
          style: const TextStyle(color: AppColors.creamWhite),
          cursorColor: AppColors.royalBlue,
          decoration: const InputDecoration(
            hintText: 'Group Name (e.g. Family)',
            hintStyle: TextStyle(color: AppColors.softBlueGrey),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.softBlueGrey)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.royalBlue, width: 2)),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel',
                style: TextStyle(color: AppColors.softBlueGrey)),
          ),
          TextButton(
            onPressed: () {
              if (nameController.text.trim().isEmpty) return;

              Navigator.pop(context);
              setState(() => _isCreating = true);

              // Logic Create Group
              telegramProvider.createNewBasicGroupChat(
                  _selectedUserIds.toList(), nameController.text, (chatId) {
                if (!mounted) return;
                setState(() => _isCreating = false);
                Navigator.pop(context);

                final chat = Chat(
                  id: chatId,
                  name: nameController.text,
                  timestamp: DateTime.now(),
                  isGroup: true,
                  lastMessage: 'Group created',
                );

                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ChatScreen(chat: chat)));
              });
            },
            child: const Text('Create',
                style: TextStyle(
                    color: AppColors.royalBlue, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
