import 'dart:io';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import '../../../core/theme/colors.dart';
import '../../../data/models/chat/chat_model.dart';
import '../../../data/models/chat/message_model.dart';
import '../../../data/models/chat/chat_member_model.dart';
import 'add_member_screen.dart';
import 'media_viewer_screen.dart';
import '../call/group_call_screen.dart';
import '../../../main.dart';

class ChatInfoScreen extends StatefulWidget {
  final Chat chat;

  const ChatInfoScreen({super.key, required this.chat});

  @override
  State<ChatInfoScreen> createState() => _ChatInfoScreenState();
}

class _ChatInfoScreenState extends State<ChatInfoScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    int tabCount = widget.chat.isGroup ? 3 : 2;
    _tabController = TabController(length: tabCount, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      telegramProvider.loadSharedMedia(widget.chat.id);
      if (widget.chat.isGroup) {
        telegramProvider.loadChatMembers(widget.chat.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final messages = telegramProvider.getMessages(widget.chat.id);
    final fileMessages =
        messages.where((m) => m.type == MessageType.file).toList();

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      floatingActionButton: (widget.chat.isGroup && _tabController.index == 2)
          ? FloatingActionButton(
              backgroundColor: AppColors.royalBlue,
              child: const Icon(Icons.person_add, color: Colors.white),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            AddMemberScreen(chatId: widget.chat.id)));
              },
            )
          : null,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 300,
              pinned: true,
              backgroundColor: theme.appBarTheme.backgroundColor,
              foregroundColor: theme.appBarTheme.foregroundColor,
              elevation: 0,
              actions: [
                if (widget.chat.isGroup)
                  IconButton(
                    icon: const Icon(Icons.record_voice_over),
                    tooltip: "Start Voice Chat",
                    onPressed: () {
                      telegramProvider.createVoiceChat(widget.chat.id);
                      callProvider.joinGroupCall(0);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const GroupCallScreen()));
                    },
                  ),
                IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: _buildProfileHeader(widget.chat),
              ),
              bottom: TabBar(
                controller: _tabController,
                indicatorColor: AppColors.royalBlue,
                labelColor: AppColors.royalBlue,
                unselectedLabelColor: AppColors.softBlueGrey,
                indicatorWeight: 3,
                onTap: (index) => setState(() {}),
                tabs: [
                  const Tab(text: "Media"),
                  const Tab(text: "Files"),
                  if (widget.chat.isGroup) const Tab(text: "Members"),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildSharedMediaTab(),
            _buildFileList(fileMessages),
            if (widget.chat.isGroup) _buildMembersList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSharedMediaTab() {
    return AnimatedBuilder(
      animation: telegramProvider,
      builder: (context, child) {
        final mediaList = telegramProvider.sharedMedia;
        if (telegramProvider.isLoadingMedia) {
          return const Center(
              child: CircularProgressIndicator(color: AppColors.royalBlue));
        }
        if (mediaList.isEmpty) {
          return _buildEmptyState(
              Icons.image_not_supported_outlined, "No media shared");
        }
        return GridView.builder(
          padding: const EdgeInsets.all(2),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
          ),
          itemCount: mediaList.length,
          itemBuilder: (context, index) {
            final msg = mediaList[index];
            final isVideo = msg.type == MessageType.video;
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MediaViewerScreen(
                      mediaMessages: mediaList,
                      initialIndex: index,
                    ),
                  ),
                );
              },
              child: Stack(
                fit: StackFit.expand,
                children: [
                  if (msg.localPath != null &&
                      File(msg.localPath!).existsSync())
                    Image.file(File(msg.localPath!), fit: BoxFit.cover)
                  else
                    Container(
                      color: Colors.black12,
                      child: const Icon(Icons.broken_image, color: Colors.grey),
                    ),
                  if (isVideo)
                    const Center(
                        child: Icon(Icons.play_circle_fill,
                            color: Colors.white, size: 30)),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildMembersList() {
    return AnimatedBuilder(
      animation: telegramProvider,
      builder: (context, child) {
        final members = telegramProvider.chatMembers;
        if (telegramProvider.isLoadingMembers) {
          return const Center(
              child: CircularProgressIndicator(color: AppColors.royalBlue));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: members.length,
          itemBuilder: (context, index) {
            final member = members[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.royalBlue.withValues(alpha: 0.2),
                backgroundImage: member.avatarUrl != null
                    ? FileImage(File(member.avatarUrl!))
                    : null,
                child: member.avatarUrl == null ? Text(member.name[0]) : null,
              ),
              title: Row(
                children: [
                  Text(member.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.creamWhite)),
                  if (member.status == ChatMemberStatus.creator)
                    const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Icon(Icons.star, color: Colors.amber, size: 16)),
                  if (member.status == ChatMemberStatus.administrator)
                    const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Icon(Icons.shield,
                            color: Colors.blueAccent, size: 16)),
                ],
              ),
              subtitle: Text(
                member.customTitle.isNotEmpty
                    ? member.customTitle
                    : _getStatusText(member.status),
                style: const TextStyle(
                    color: AppColors.softBlueGrey, fontSize: 12),
              ),
              trailing: IconButton(
                icon:
                    const Icon(Icons.more_vert, color: AppColors.softBlueGrey),
                onPressed: () => _showMemberOptions(member),
              ),
            );
          },
        );
      },
    );
  }

  String _getStatusText(ChatMemberStatus status) {
    switch (status) {
      case ChatMemberStatus.creator:
        return "Owner";
      case ChatMemberStatus.administrator:
        return "Admin";
      case ChatMemberStatus.member:
        return "Member";
      case ChatMemberStatus.restricted:
        return "Restricted";
      case ChatMemberStatus.left:
        return "Left";
      case ChatMemberStatus.banned:
        return "Banned";
    }
  }

  void _showMemberOptions(ChatMember member) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.cardSurface,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            if (member.status != ChatMemberStatus.administrator &&
                member.status != ChatMemberStatus.creator)
              ListTile(
                leading: const Icon(Icons.security, color: Colors.blueAccent),
                title: const Text("Promote to Admin",
                    style: TextStyle(color: AppColors.creamWhite)),
                onTap: () {
                  telegramProvider.promoteToAdmin(
                      widget.chat.id, member.userId);
                  Navigator.pop(context);
                },
              ),
            ListTile(
              leading: const Icon(Icons.remove_circle, color: Colors.redAccent),
              title: const Text("Kick Member",
                  style: TextStyle(color: Colors.redAccent)),
              onTap: () {
                telegramProvider.kickChatMember(widget.chat.id, member.userId);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(Chat chat) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Hero(
            tag: 'avatar_${chat.id}',
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: AppColors.royalBlue.withValues(alpha: 0.5),
                    width: 2),
              ),
              child: CircleAvatar(
                radius: 60,
                backgroundColor: AppColors.royalBlue.withValues(alpha: 0.2),
                backgroundImage: chat.avatarUrl != null
                    ? NetworkImage(chat.avatarUrl!)
                    : null,
                child: chat.avatarUrl == null
                    ? Text(
                        chat.name.isNotEmpty ? chat.name[0].toUpperCase() : '?',
                        style: const TextStyle(
                            fontSize: 40,
                            color: AppColors.royalBlue,
                            fontWeight: FontWeight.bold))
                    : null,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(chat.name,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyMedium?.color)),
          const SizedBox(height: 8),
          Text(chat.isOnline ? "Online" : "Last seen recently",
              style: TextStyle(
                  color: chat.isOnline
                      ? AppColors.royalBlue
                      : AppColors.softBlueGrey,
                  fontSize: 14)),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildFileList(List<Message> messages) {
    if (messages.isEmpty) {
      return _buildEmptyState(
          Icons.insert_drive_file_outlined, "No files shared");
    }
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: messages.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final msg = messages[index];
        return ListTile(
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: AppColors.royalBlue.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8)),
            child:
                const Icon(Icons.insert_drive_file, color: AppColors.royalBlue),
          ),
          title: Text(msg.fileName ?? "Unknown File",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyMedium?.color)),
          subtitle: Text(msg.fileSize ?? "Unknown Size",
              style:
                  const TextStyle(color: AppColors.softBlueGrey, fontSize: 12)),
          onTap: () async {
            if (msg.localPath != null) await OpenFilex.open(msg.localPath!);
          },
        );
      },
    );
  }

  Widget _buildEmptyState(IconData icon, String text) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,
              size: 60, color: AppColors.softBlueGrey.withValues(alpha: 0.3)),
          const SizedBox(height: 16),
          Text(text,
              style: TextStyle(
                  color: AppColors.softBlueGrey.withValues(alpha: 0.5))),
        ],
      ),
    );
  }
}
