import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:lottie/lottie.dart';
import '../../../core/theme/colors.dart';
import '../../../data/models/chat/message_model.dart';
import '../../../data/models/chat/sticker_model.dart';
import '../../../main.dart';

class MessageInput extends StatefulWidget {
  final Function(String) onSendMessage;
  final Function(String) onSendPhoto;
  final Function(String) onSendVideo;
  final Function(String) onSendFile;
  final Function(String, int)? onSendVoice;
  final Message? replyToMessage;
  final VoidCallback? onCancelReply;
  final Message? editingMessage;
  final VoidCallback? onCancelEdit;
  final Function(String, String)? onEditMessage;
  final VoidCallback? onTyping;

  const MessageInput({
    super.key,
    required this.onSendMessage,
    required this.onSendPhoto,
    required this.onSendVideo,
    required this.onSendFile,
    this.onSendVoice,
    this.replyToMessage,
    this.onCancelReply,
    this.editingMessage,
    this.onCancelEdit,
    this.onEditMessage,
    this.onTyping,
  });

  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput>
    with SingleTickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  late final AudioRecorder _audioRecorder;
  late TabController _tabController;

  bool _isRecording = false;
  bool _hasText = false;
  bool _isPanelVisible = false;
  DateTime? _startTime;
  final FocusNode _focusNode = FocusNode();
  DateTime? _lastTypingSent;

  @override
  void initState() {
    super.initState();
    _audioRecorder = AudioRecorder();
    _tabController = TabController(length: 3, vsync: this);

    _textController.addListener(() {
      final text = _textController.text;
      setState(() => _hasText = text.trim().isNotEmpty);
      if (text.isNotEmpty && widget.onTyping != null) {
        final now = DateTime.now();
        if (_lastTypingSent == null ||
            now.difference(_lastTypingSent!) > const Duration(seconds: 3)) {
          widget.onTyping!();
          _lastTypingSent = now;
        }
      }
    });

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() => _isPanelVisible = false);
      }
    });

    if (widget.editingMessage != null) {
      _textController.text = widget.editingMessage!.text;
      _hasText = true;
      WidgetsBinding.instance
          .addPostFrameCallback((_) => _focusNode.requestFocus());
    }
  }

  @override
  void didUpdateWidget(MessageInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.editingMessage != null &&
        widget.editingMessage != oldWidget.editingMessage) {
      _textController.text = widget.editingMessage!.text;
      _focusNode.requestFocus();
    } else if (widget.editingMessage == null &&
        oldWidget.editingMessage != null) {
      _textController.clear();
    }
  }

  @override
  void dispose() {
    _audioRecorder.dispose();
    _textController.dispose();
    _focusNode.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _togglePanel() {
    if (_isPanelVisible) {
      _focusNode.requestFocus();
    } else {
      FocusScope.of(context).unfocus();
    }
    setState(() => _isPanelVisible = !_isPanelVisible);
  }

  Future<void> _startRecording() async {
    if (await Permission.microphone.request().isGranted) {
      final dir = await getApplicationDocumentsDirectory();
      String path =
          '${dir.path}/voice_${DateTime.now().millisecondsSinceEpoch}.m4a';
      await _audioRecorder.start(const RecordConfig(), path: path);
      setState(() {
        _isRecording = true;
        _startTime = DateTime.now();
      });
    }
  }

  Future<void> _stopRecording() async {
    if (!_isRecording) {
      return;
    }
    final path = await _audioRecorder.stop();
    final duration = DateTime.now().difference(_startTime!).inSeconds;
    setState(() => _isRecording = false);
    if (path != null && duration > 0 && widget.onSendVoice != null) {
      widget.onSendVoice!(path, duration);
    }
  }

  // ... (Attachment Functions SAMA) ...
  void _showAttachmentMenu() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.all(20),
            child: Wrap(
                spacing: 30,
                runSpacing: 30,
                alignment: WrapAlignment.center,
                children: [
                  _buildAttachmentItem(
                      Icons.image, "Gallery", Colors.purple, _pickImage),
                  _buildAttachmentItem(
                      Icons.videocam, "Video", Colors.pink, _pickVideo),
                  _buildAttachmentItem(
                      Icons.insert_drive_file, "File", Colors.blue, _pickFile),
                  _buildAttachmentItem(
                      Icons.camera_alt, "Camera", Colors.orange, _pickImage)
                ])));
  }

  Widget _buildAttachmentItem(
      IconData icon, String label, Color color, VoidCallback onTap) {
    return GestureDetector(
        onTap: () {
          Navigator.pop(context);
          onTap();
        },
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          CircleAvatar(
              radius: 28,
              backgroundColor: color.withValues(alpha: 0.1),
              child: Icon(icon, color: color, size: 28)),
          const SizedBox(height: 8),
          Text(label,
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                  fontSize: 12))
        ]));
  }

  Future<void> _pickImage() async {
    final XFile? image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 70);
    if (image != null) {
      widget.onSendPhoto(image.path);
    }
  }

  Future<void> _pickVideo() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      widget.onSendVideo(video.path);
    }
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.path != null) {
      widget.onSendFile(result.files.single.path!);
    }
  }

  void _handleSend() {
    if (_textController.text.trim().isNotEmpty) {
      if (widget.editingMessage != null) {
        widget.onEditMessage
            ?.call(widget.editingMessage!.id, _textController.text);
      } else {
        widget.onSendMessage(_textController.text);
      }
      _textController.clear();
      setState(() => _hasText = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // ... (UI TextField & Header SAMA) ...
    // Hamba singkat agar fokus ke Sticker
    return Column(
      children: [
        if (widget.replyToMessage != null || widget.editingMessage != null)
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Theme.of(context).cardColor,
              child: Row(children: [
                Icon(widget.editingMessage != null ? Icons.edit : Icons.reply,
                    color: AppColors.royalBlue),
                const SizedBox(width: 12),
                Container(width: 2, height: 35, color: AppColors.royalBlue),
                const SizedBox(width: 12),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(
                          widget.editingMessage != null
                              ? "Editing Message"
                              : "Replying to Message",
                          style: const TextStyle(
                              color: AppColors.royalBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                      Text(
                          widget.editingMessage != null
                              ? widget.editingMessage!.text
                              : (widget.replyToMessage?.text ?? "Media"),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyMedium?.color,
                              fontSize: 13))
                    ])),
                IconButton(
                    icon:
                        const Icon(Icons.close, color: AppColors.softBlueGrey),
                    onPressed: widget.editingMessage != null
                        ? widget.onCancelEdit
                        : widget.onCancelReply)
              ])),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: SafeArea(
                child: Row(children: [
              IconButton(
                  onPressed: _showAttachmentMenu,
                  icon: const Icon(Icons.attach_file,
                      color: AppColors.softBlueGrey, size: 26)),
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.inputFill
                              : Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.transparent
                                  : Colors.grey.shade300)),
                      child: Row(children: [
                        IconButton(
                            icon: Icon(
                                _isPanelVisible
                                    ? Icons.keyboard
                                    : Icons.emoji_emotions_outlined,
                                color: _isPanelVisible
                                    ? AppColors.royalBlue
                                    : AppColors.softBlueGrey),
                            onPressed: _togglePanel),
                        Expanded(
                            child: TextField(
                                controller: _textController,
                                focusNode: _focusNode,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.color,
                                    fontSize: 16),
                                decoration: const InputDecoration(
                                    hintText: 'Message',
                                    hintStyle: TextStyle(
                                        color: AppColors.softBlueGrey),
                                    border: InputBorder.none,
                                    isDense: true,
                                    filled: false,
                                    fillColor: Colors.transparent,
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 10)),
                                minLines: 1,
                                maxLines: 5))
                      ]))),
              const SizedBox(width: 8),
              GestureDetector(
                  onTap: _hasText ? _handleSend : null,
                  onLongPressStart: (_) => _startRecording(),
                  onLongPressEnd: (_) => _stopRecording(),
                  child: CircleAvatar(
                      radius: 24,
                      backgroundColor: AppColors.royalBlue,
                      child: Icon(
                          _hasText
                              ? (widget.editingMessage != null
                                  ? Icons.check
                                  : Icons.send)
                              : (_isRecording ? Icons.mic_off : Icons.mic),
                          color: Colors.white,
                          size: 22)))
            ]))),
        if (_isPanelVisible)
          SizedBox(
            height: 300,
            child: Column(
              children: [
                TabBar(
                    controller: _tabController,
                    indicatorColor: AppColors.royalBlue,
                    labelColor: AppColors.royalBlue,
                    unselectedLabelColor: AppColors.softBlueGrey,
                    tabs: const [
                      Tab(icon: Icon(Icons.emoji_emotions)),
                      Tab(icon: Icon(Icons.sticky_note_2)),
                      Tab(text: "GIF")
                    ]),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      EmojiPicker(
                          textEditingController: _textController,
                          config: const Config(
                              height: 250,
                              checkPlatformCompatibility: true,
                              emojiViewConfig: EmojiViewConfig(columns: 7))),
                      _buildStickerPicker(), // UPDATED
                      _buildGifPicker(),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildStickerPicker() {
    return AnimatedBuilder(
      animation: telegramProvider,
      builder: (context, child) {
        final sets = telegramProvider.stickerSets;
        if (sets.isEmpty) {
          return const Center(
              child: Text("No stickers found.",
                  style: TextStyle(color: AppColors.softBlueGrey)));
        }

        return ListView.builder(
          itemCount: sets.length,
          itemBuilder: (context, index) {
            final set = sets[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(set.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.softBlueGrey)),
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: set.stickers.length,
                    itemBuilder: (context, sIndex) {
                      final sticker = set.stickers[sIndex];
                      return GestureDetector(
                        onTap: () {
                          if (telegramProvider.currentChatId != null) {
                            telegramProvider.sendSticker(
                                telegramProvider.currentChatId!, sticker.fileId,
                                replyToMessageId: widget.replyToMessage?.id);
                          }
                        },
                        // OPTION C: STICKER PREVIEW
                        onLongPress: () => _showStickerPreview(sticker),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: _renderStickerThumb(sticker),
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }

  void _showStickerPreview(Sticker sticker) {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: _renderStickerThumb(sticker, size: 200), // Besar
            ),
            const SizedBox(height: 10),
            Text(sticker.emoji, style: const TextStyle(fontSize: 40)),
          ],
        ),
      ),
    );
  }

  Widget _renderStickerThumb(Sticker sticker, {double size = 80}) {
    if (sticker.localPath != null && File(sticker.localPath!).existsSync()) {
      if (sticker.isAnimated) {
        return SizedBox(
            width: size,
            height: size,
            child: Lottie.file(File(sticker.localPath!),
                fit: BoxFit.contain, animate: false));
      } else {
        return Image.file(File(sticker.localPath!),
            width: size, height: size, fit: BoxFit.contain);
      }
    }
    return Container(
        width: size,
        height: size,
        color: Colors.black12,
        child: const Icon(Icons.downloading));
  }

  Widget _buildGifPicker() {
    return AnimatedBuilder(
        animation: telegramProvider,
        builder: (context, child) {
          final gifs = telegramProvider.savedAnimations;
          if (gifs.isEmpty) {
            return const Center(
                child: Text("No saved GIFs",
                    style: TextStyle(color: AppColors.softBlueGrey)));
          }
          return GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 4, mainAxisSpacing: 4),
              itemCount: gifs.length,
              itemBuilder: (context, index) {
                final gif = gifs[index];
                return GestureDetector(
                    onTap: () {
                      if (telegramProvider.currentChatId != null) {
                        telegramProvider.sendAnimation(
                            telegramProvider.currentChatId!, gif.fileId,
                            replyToMessageId: widget.replyToMessage?.id);
                      }
                    },
                    child: Stack(fit: StackFit.expand, children: [
                      if (gif.localPath != null &&
                          File(gif.localPath!).existsSync())
                        Image.file(File(gif.localPath!), fit: BoxFit.cover)
                      else
                        Container(color: Colors.black12),
                      const Center(
                          child: Icon(Icons.gif, color: Colors.white, size: 30))
                    ]));
              });
        });
  }
}
