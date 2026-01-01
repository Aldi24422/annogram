import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/theme/colors.dart';
import '../../../core/services/security_service.dart';
import '../../../data/models/chat/chat_model.dart';
import '../../../data/models/chat/message_model.dart';
import '../../widgets/chat/message_bubble.dart';
import '../../widgets/chat/message_input.dart';
import '../call/call_screen.dart';
import '../call/video_call_screen.dart';
import 'chat_info_screen.dart';
import 'search_message_screen.dart';
import '../../widgets/chat/typing_indicator.dart';
import '../../widgets/common/chat_avatar.dart';
import '../../../main.dart';

class ChatScreen extends StatefulWidget {
  final Chat chat;
  final String? highlightMessageId; // Parameter Baru untuk Jump

  const ChatScreen({super.key, required this.chat, this.highlightMessageId});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();

  Message? _replyToMessage;
  Message? _editingMessage;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      telegramProvider.setCurrentChatId(widget.chat.id);

      // LOGIC JUMP TO MESSAGE
      if (widget.highlightMessageId != null) {
        // Load history di sekitar pesan yang dicari (offset -10)
        telegramProvider.loadChatHistory(widget.chat.id,
            fromMessageId: widget.highlightMessageId!, offset: -10);
      } else {
        // Load biasa (pesan terbaru)
        telegramProvider.loadChatHistory(widget.chat.id, fromMessageId: '0');
      }

      _markVisibleMessagesAsRead();
    });
  }

  @override
  void dispose() {
    telegramProvider.setCurrentChatId(null);
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Logic Pagination Standar
    if (_scrollController.hasClients &&
        _scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200) {
      final messages = telegramProvider.getMessages(widget.chat.id);
      if (messages.isNotEmpty && !telegramProvider.isLoadingHistory) {
        final lastMessageId = messages.last.id;
        telegramProvider.loadChatHistory(widget.chat.id,
            fromMessageId: lastMessageId);
      }
    }
  }

  void _markVisibleMessagesAsRead() {
    final messages = telegramProvider.getMessages(widget.chat.id);
    if (messages.isNotEmpty) {
      final unreadIds = messages
          .where((m) => !m.isRead && !m.isOutgoing)
          .map((m) => m.id)
          .toList();
      if (unreadIds.isNotEmpty) {
        telegramProvider.markMessagesAsRead(widget.chat.id, unreadIds);
      }
    }
  }

  // --- ACTIONS ---
  void _sendMessage(String text) {
    telegramProvider.sendMessage(widget.chat.id, text,
        replyToMessageId: _replyToMessage?.id);
    _clearInteractions();
    _scrollToBottom();
  }

  void _editMessage(String messageId, String newText) {
    telegramProvider.editMessageText(widget.chat.id, messageId, newText);
    _clearInteractions();
  }

  void _clearInteractions() {
    setState(() {
      _replyToMessage = null;
      _editingMessage = null;
    });
  }

  void _sendPhoto(String path) {
    telegramProvider.sendPhoto(widget.chat.id, path,
        replyToMessageId: _replyToMessage?.id);
    _clearInteractions();
    _scrollToBottom();
  }

  void _sendVideo(String path) {
    telegramProvider.sendVideo(widget.chat.id, path,
        replyToMessageId: _replyToMessage?.id);
    _clearInteractions();
    _scrollToBottom();
  }

  void _sendFile(String path) {
    telegramProvider.sendDocument(widget.chat.id, path,
        replyToMessageId: _replyToMessage?.id);
    _clearInteractions();
    _scrollToBottom();
  }

  void _sendVoice(String path, int duration) {
    telegramProvider.sendVoiceNote(widget.chat.id, path, duration,
        replyToMessageId: _replyToMessage?.id);
    _clearInteractions();
    _scrollToBottom();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(0,
          duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    }
  }

  void _showMessageOptions(BuildContext context, Message message) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).cardColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                  leading: const Icon(Icons.reply, color: AppColors.royalBlue),
                  title: Text('Reply',
                      style: TextStyle(
                          color:
                              Theme.of(context).textTheme.bodyMedium?.color)),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() => _replyToMessage = message);
                  }),
              ListTile(
                  leading:
                      const Icon(Icons.forward, color: AppColors.royalBlue),
                  title: Text('Forward',
                      style: TextStyle(
                          color:
                              Theme.of(context).textTheme.bodyMedium?.color)),
                  onTap: () {
                    Navigator.pop(context);
                    _showForwardDialog(message.id);
                  }),
              ListTile(
                leading: const Icon(Icons.push_pin, color: AppColors.royalBlue),
                title: Text('Pin Message',
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyMedium?.color)),
                onTap: () {
                  telegramProvider.pinChatMessage(
                      widget.chat.id, message.id, false);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Message Pinned")));
                },
              ),
              if (message.isOutgoing && message.type == MessageType.text)
                ListTile(
                    leading: const Icon(Icons.edit, color: AppColors.royalBlue),
                    title: Text('Edit',
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodyMedium?.color)),
                    onTap: () {
                      Navigator.pop(context);
                      setState(() => _editingMessage = message);
                    }),
              if (message.type == MessageType.text)
                ListTile(
                    leading:
                        const Icon(Icons.copy, color: AppColors.softBlueGrey),
                    title: Text('Copy Text',
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodyMedium?.color)),
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: message.text));
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Text copied"),
                          backgroundColor: AppColors.royalBlue,
                          duration: Duration(seconds: 1)));
                    }),
              if (message.isOutgoing)
                ListTile(
                    leading: const Icon(Icons.delete, color: Colors.redAccent),
                    title: const Text('Delete Message',
                        style: TextStyle(color: Colors.redAccent)),
                    onTap: () {
                      Navigator.pop(context);
                      _confirmDelete(message.id);
                    }),
            ],
          ),
        );
      },
    );
  }

  void _showForwardDialog(String messageId) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).cardColor,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.4,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) {
            final chats = telegramProvider.chats;
            return Column(
              children: [
                const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text("Forward to...",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18))),
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: chats.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return ListTile(
                          leading: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: AppColors.royalBlue,
                                  shape: BoxShape.circle),
                              child: const Icon(Icons.bookmark,
                                  color: Colors.white, size: 20)),
                          title: const Text("Saved Messages",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          onTap: () {
                            telegramProvider.openSavedMessages((chatId) {
                              telegramProvider.forwardMessages(
                                  chatId, widget.chat.id, [messageId]);
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Saved to Saved Messages")));
                            });
                          },
                        );
                      }
                      final chat = chats[index - 1];
                      if (chat.id == widget.chat.id) {
                        return const SizedBox.shrink();
                      }
                      return ListTile(
                        leading: ChatAvatar(
                          name: chat.name,
                          imageUrl: chat.avatarUrl,
                          size: 20,
                        ),
                        title: Text(chat.name),
                        onTap: () {
                          telegramProvider.forwardMessages(
                              chat.id, widget.chat.id, [messageId]);
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Forwarded to ${chat.name}")));
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _confirmDelete(String messageId) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
                backgroundColor: Theme.of(context).cardColor,
                title: Text("Delete Message?",
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyMedium?.color)),
                content: Text("This message will be deleted for everyone.",
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodySmall?.color)),
                actions: [
                  TextButton(
                      child: const Text("Cancel"),
                      onPressed: () => Navigator.pop(context)),
                  TextButton(
                      child: const Text("Delete",
                          style: TextStyle(color: Colors.redAccent)),
                      onPressed: () {
                        telegramProvider.deleteMessage(
                            widget.chat.id, messageId);
                        Navigator.pop(context);
                      })
                ]));
  }

  void _showCallDialog(String callType) {
    if (callType == 'Voice Call') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CallScreen(chat: widget.chat)));
    } else if (callType == 'Video Call') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => VideoCallScreen(chat: widget.chat)));
    }
  }

  bool _isSameDay(DateTime d1, DateTime d2) {
    return d1.year == d2.year && d1.month == d2.month && d1.day == d2.day;
  }

  String _formatDateHeader(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final checkDate = DateTime(date.year, date.month, date.day);
    if (checkDate == today) return "Today";
    if (checkDate == yesterday) return "Yesterday";
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    return "${date.day} ${months[date.month - 1]} ${date.year}";
  }

  Widget _buildPinnedHeader(Message? pinnedMsg) {
    return InkWell(
      onTap: () {
        if (pinnedMsg != null) {
          // JUMP KE PESAN YANG DI-PIN
          telegramProvider.loadChatHistory(widget.chat.id,
              fromMessageId: pinnedMsg.id, offset: -10);
        }
      },
      onLongPress: () {
        showDialog(
            context: context,
            builder: (ctx) =>
                AlertDialog(title: const Text("Unpin Message?"), actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(ctx),
                      child: const Text("Cancel")),
                  TextButton(
                      onPressed: () {
                        telegramProvider.pinChatMessage(
                            widget.chat.id, pinnedMsg?.id ?? "0", true);
                        Navigator.pop(ctx);
                      },
                      child: const Text("Unpin",
                          style: TextStyle(color: Colors.red)))
                ]));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: const Border(
                bottom: BorderSide(color: Colors.black12, width: 0.5))),
        child: Row(
          children: [
            Container(width: 2, height: 35, color: AppColors.royalBlue),
            const SizedBox(width: 12),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  const Text("Pinned Message",
                      style: TextStyle(
                          color: AppColors.royalBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 12)),
                  Text(pinnedMsg?.text ?? "Tap to view",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                          fontSize: 13))
                ])),
            const Icon(Icons.push_pin, size: 16, color: AppColors.softBlueGrey),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: telegramProvider,
      builder: (context, child) {
        final List<Message> messages =
            telegramProvider.getMessages(widget.chat.id);
        final typingStatus = telegramProvider.getTypingStatus(widget.chat.id);
        final currentChat = telegramProvider.chats.firstWhere(
            (c) => c.id == widget.chat.id,
            orElse: () => widget.chat);

        Message? pinnedMsg;
        if (currentChat.pinnedMessageId != null) {
          pinnedMsg = telegramProvider.getMessage(
              widget.chat.id, currentChat.pinnedMessageId!);
        }

        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: theme.appBarTheme.backgroundColor,
            foregroundColor: theme.appBarTheme.foregroundColor,
            elevation: 0,
            titleSpacing: 0,
            title: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ChatInfoScreen(chat: widget.chat))),
              child: Row(
                children: [
                  Hero(
                    tag: 'avatar_${widget.chat.id}',
                    child: ChatAvatar(
                      name: widget.chat.name,
                      imageUrl: widget.chat.avatarUrl,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            if (widget.chat.isSecret)
                              const Padding(
                                padding: EdgeInsets.only(right: 6),
                                child: Icon(Icons.lock,
                                    size: 14, color: Colors.greenAccent),
                              ),
                            Flexible(
                              child: Text(widget.chat.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: widget.chat.isSecret
                                          ? Colors.greenAccent
                                          : theme.textTheme.bodyMedium?.color)),
                            ),
                          ],
                        ),
                        if (typingStatus != null)
                          Row(
                            children: [
                              const TypingIndicator(color: AppColors.royalBlue),
                              const SizedBox(width: 4),
                              Text(typingStatus,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: AppColors.royalBlue,
                                      fontWeight: FontWeight.bold)),
                            ],
                          )
                        else if (widget.chat.isSecret)
                          const Text('🔒 Secret Chat',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.greenAccent))
                        else if (widget.chat.isOnline)
                          const Text('Online',
                              style: TextStyle(
                                  fontSize: 12, color: AppColors.royalBlue))
                        else
                          const Text('Tap for info',
                              style: TextStyle(
                                  fontSize: 12, color: AppColors.softBlueGrey)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              // Lock button for secret chats only
              if (widget.chat.isSecret ||
                  SecurityService().isSecretChat(widget.chat.id))
                IconButton(
                  icon:
                      const Icon(Icons.lock_outline, color: Colors.greenAccent),
                  tooltip: 'Lock & Exit',
                  onPressed: () {
                    SecurityService().lockSession();
                    // PERBAIKAN: Navigasi Explicit ke Login (yg auto ke MainScreen)
                    // Ini memastikan stack bersih dan tab reset ke 0
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/login', (route) => false);
                  },
                ),
              IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                SearchMessageScreen(chatId: widget.chat.id)));
                  }),
              IconButton(
                  icon: const Icon(Icons.call),
                  onPressed: () => _showCallDialog('Voice Call')),
              IconButton(
                  icon: const Icon(Icons.videocam),
                  onPressed: () => _showCallDialog('Video Call')),
              IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
            ],
          ),
          body: Column(
            children: [
              if (currentChat.pinnedMessageId != null)
                _buildPinnedHeader(pinnedMsg),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    // Enhanced background for secret chats
                    gradient: (widget.chat.isSecret ||
                            SecurityService().isSecretChat(widget.chat.id))
                        ? LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              theme.scaffoldBackgroundColor,
                              const Color(0xFF0D2818)
                                  .withValues(alpha: 0.6), // Subtle green tint
                            ],
                          )
                        : null,
                    color: (widget.chat.isSecret ||
                            SecurityService().isSecretChat(widget.chat.id))
                        ? null
                        : theme.scaffoldBackgroundColor,
                  ),
                  child: messages.isEmpty
                      ? Center(
                          child: Text('No messages yet\nSay Hi! 👋',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: theme.textTheme.bodySmall?.color)))
                      : ListView.builder(
                          controller: _scrollController,
                          reverse: true,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          itemCount: messages.length +
                              (telegramProvider.isLoadingHistory ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index == messages.length) {
                              return const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Center(
                                      child: SizedBox(
                                          width: 24,
                                          height: 24,
                                          child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              color: AppColors.royalBlue))));
                            }
                            final message = messages[index];

                            // HIGHLIGHT EFFECT UNTUK PESAN HASIL SEARCH
                            bool isHighlighted =
                                (widget.highlightMessageId != null &&
                                    message.id == widget.highlightMessageId);

                            bool showDateHeader = false;
                            if (index == messages.length - 1) {
                              showDateHeader = true;
                            } else {
                              final olderMessage = messages[index + 1];
                              if (!_isSameDay(
                                  message.timestamp, olderMessage.timestamp)) {
                                showDateHeader = true;
                              }
                            }
                            return Column(
                              children: [
                                if (showDateHeader)
                                  Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 4),
                                      decoration: BoxDecoration(
                                          color: AppColors.softBlueGrey
                                              .withValues(alpha: 0.2),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Text(
                                          _formatDateHeader(message.timestamp),
                                          style: const TextStyle(
                                              color: AppColors.softBlueGrey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold))),
                                Container(
                                  color: isHighlighted
                                      ? AppColors.royalBlue
                                          .withValues(alpha: 0.3)
                                      : null, // Efek Highlight
                                  padding: isHighlighted
                                      ? const EdgeInsets.symmetric(vertical: 4)
                                      : EdgeInsets.zero,
                                  child: GestureDetector(
                                    onLongPress: () {
                                      HapticFeedback.lightImpact();
                                      _showMessageOptions(context, message);
                                    },
                                    child: MessageBubble(
                                        message: message,
                                        isMe: message.isOutgoing),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                ),
              ),
              MessageInput(
                  onSendMessage: _sendMessage,
                  onSendPhoto: _sendPhoto,
                  onSendVideo: _sendVideo,
                  onSendFile: _sendFile,
                  onSendVoice: _sendVoice,
                  replyToMessage: _replyToMessage,
                  onCancelReply: _clearInteractions,
                  editingMessage: _editingMessage,
                  onCancelEdit: _clearInteractions,
                  onEditMessage: _editMessage,
                  onTyping: () => telegramProvider.sendTyping(widget.chat.id)),
            ],
          ),
        );
      },
    );
  }
}
