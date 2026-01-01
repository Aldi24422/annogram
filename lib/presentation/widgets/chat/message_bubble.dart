import 'dart:io';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:video_player/video_player.dart';
import 'package:open_filex/open_filex.dart';
import 'package:lottie/lottie.dart';
import '../../../data/models/chat/message_model.dart';
import '../../../core/theme/colors.dart';
import 'package:provider/provider.dart';
import '../../../core/providers/telegram_provider.dart';

class MessageBubble extends StatefulWidget {
  final Message message;
  final bool isMe;

  const MessageBubble({
    super.key,
    required this.message,
    required this.isMe,
  });

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble>
    with SingleTickerProviderStateMixin {
  late AudioPlayer _audioPlayer;
  bool _isAudioPlaying = false;
  Duration _audioPosition = Duration.zero;

  VideoPlayerController? _videoController;
  bool _isVideoInitialized = false;

  late AnimationController _entryController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _initAudio();
    _initVideo();
    _initAnimation();
  }

  void _initAnimation() {
    _entryController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _fadeAnimation =
        CurvedAnimation(parent: _entryController, curve: Curves.easeIn);
    _slideAnimation = Tween<Offset>(
      begin: Offset(widget.isMe ? 0.1 : -0.1, 0),
      end: Offset.zero,
    ).animate(
        CurvedAnimation(parent: _entryController, curve: Curves.easeOutQuad));
    _entryController.forward();
  }

  void _initAudio() {
    _audioPlayer = AudioPlayer();
    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() => _isAudioPlaying = state == PlayerState.playing);
      }
    });
    _audioPlayer.onPositionChanged.listen((newPos) {
      if (mounted) setState(() => _audioPosition = newPos);
    });
    _audioPlayer.onPlayerComplete.listen((event) {
      if (mounted) setState(() => _audioPosition = Duration.zero);
    });
  }

  void _initVideo() {
    bool isVideoOrGif = widget.message.type == MessageType.video ||
        widget.message.type == MessageType.animation;

    if (isVideoOrGif &&
        widget.message.localPath != null &&
        File(widget.message.localPath!).existsSync()) {
      _videoController =
          VideoPlayerController.file(File(widget.message.localPath!))
            ..initialize().then((_) {
              if (widget.message.type == MessageType.animation) {
                _videoController!.setLooping(true);
                _videoController!.setVolume(0);
                _videoController!.play();
              }
              if (mounted) setState(() => _isVideoInitialized = true);
            });
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _videoController?.dispose();
    _entryController.dispose();
    super.dispose();
  }

  Future<void> _playPauseAudio() async {
    if (_isAudioPlaying) {
      await _audioPlayer.pause();
    } else {
      if (widget.message.localPath != null) {
        await _audioPlayer.play(DeviceFileSource(widget.message.localPath!));
      }
    }
  }

  void _playPauseVideo() {
    if (_videoController != null && _isVideoInitialized) {
      setState(() {
        _videoController!.value.isPlaying
            ? _videoController!.pause()
            : _videoController!.play();
      });
    }
  }

  void _openFile() async {
    if (widget.message.localPath != null) {
      await OpenFilex.open(widget.message.localPath!);
    }
  }

  void _openFullImage(BuildContext context, String path) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              elevation: 0),
          body: Center(child: InteractiveViewer(child: Image.file(File(path)))),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.message.type == MessageType.sticker) {
      return FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            alignment:
                widget.isMe ? Alignment.centerRight : Alignment.centerLeft,
            child: _buildStickerContent(),
          ),
        ),
      );
    }

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          alignment: widget.isMe ? Alignment.centerRight : Alignment.centerLeft,
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.75),
            child: Container(
              padding: EdgeInsets.all(
                  widget.message.type == MessageType.text ? 10 : 4),
              decoration: BoxDecoration(
                gradient: widget.isMe
                    ? const LinearGradient(
                        colors: [AppColors.royalBlue, Color(0xFF3A5BA0)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null,
                color: widget.isMe ? null : AppColors.cardSurface,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
                  bottomLeft: widget.isMe
                      ? const Radius.circular(16)
                      : const Radius.circular(4),
                  bottomRight: widget.isMe
                      ? const Radius.circular(4)
                      : const Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.message.type == MessageType.image)
                    _buildImageContent(context),
                  if (widget.message.type == MessageType.video)
                    _buildVideoContent(),
                  if (widget.message.type == MessageType.animation)
                    _buildGifContent(),
                  if (widget.message.type == MessageType.file)
                    _buildFileContent(),
                  if (widget.message.type == MessageType.voice)
                    _buildVoiceContent(),
                  if (widget.message.text.isNotEmpty &&
                      widget.message.type != MessageType.voice)
                    Padding(
                      padding: (widget.message.type == MessageType.text ||
                              widget.message.type == MessageType.animation)
                          ? EdgeInsets.zero
                          : const EdgeInsets.fromLTRB(4, 4, 4, 4),
                      child: Text(
                        widget.message.text,
                        style: const TextStyle(
                            color: AppColors.creamWhite, fontSize: 15),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(right: 0, bottom: 0, top: 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(width: 4),
                        Text(
                          _formatTime(widget.message.timestamp),
                          style: TextStyle(
                              color:
                                  AppColors.creamWhite.withValues(alpha: 0.7),
                              fontSize: 10),
                        ),
                        if (widget.isMe) ...[
                          const SizedBox(width: 4),
                          _buildStatusIcon(),
                        ]
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStickerContent() {
    final msg = widget.message;
    if (msg.localPath != null && File(msg.localPath!).existsSync()) {
      if (msg.isAnimatedSticker) {
        return Lottie.file(File(msg.localPath!),
            width: 180, height: 180, fit: BoxFit.contain, animate: true);
      } else {
        return Image.file(File(msg.localPath!),
            width: 180, height: 180, fit: BoxFit.contain);
      }
    }
    return const SizedBox(
      width: 150,
      height: 150,
      child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
    );
  }

  Widget _buildProgressOverlay(Message msg) {
    if (!msg.isDownloading) return const SizedBox.shrink();
    return Container(
      color: Colors.black.withValues(alpha: 0.5),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(
                value: msg.progress, color: Colors.white, strokeWidth: 4),
            const SizedBox(height: 8),
            Text(msg.progressLabel,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildImageContent(BuildContext context) {
    final msg = widget.message;
    bool hasFile = msg.localPath != null && File(msg.localPath!).existsSync();
    return GestureDetector(
      onTap: () {
        if (hasFile) {
          _openFullImage(context, msg.localPath!);
        } else if (!msg.isDownloading && msg.fileId != null) {
          context.read<TelegramProvider>().downloadFile(msg.fileId!);
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (hasFile)
              Image.file(File(msg.localPath!), fit: BoxFit.cover)
            else
              Container(
                  width: 200,
                  height: 200,
                  color: Colors.black12,
                  child: !msg.isDownloading
                      ? const Center(
                          child: Icon(Icons.download_rounded,
                              color: Colors.white54, size: 40))
                      : null),
            _buildProgressOverlay(msg),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoContent() {
    final msg = widget.message;
    if (_videoController != null && _isVideoInitialized) {
      return GestureDetector(
        onTap: _playPauseVideo,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: AspectRatio(
            aspectRatio: _videoController!.value.aspectRatio,
            child: Stack(
              alignment: Alignment.center,
              children: [
                VideoPlayer(_videoController!),
                if (!_videoController!.value.isPlaying && !msg.isDownloading)
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.3),
                          shape: BoxShape.circle),
                      child: const Icon(Icons.play_circle_fill,
                          size: 50, color: Colors.white)),
                _buildProgressOverlay(msg),
              ],
            ),
          ),
        ),
      );
    } else {
      return Container(
          width: 200,
          height: 150,
          decoration: BoxDecoration(
              color: Colors.black12, borderRadius: BorderRadius.circular(12)),
          child: Stack(alignment: Alignment.center, children: [
            if (!msg.isDownloading)
              const Icon(Icons.play_circle_outline,
                  size: 50, color: Colors.white54),
            _buildProgressOverlay(msg)
          ]));
    }
  }

  Widget _buildFileContent() {
    final msg = widget.message;
    return GestureDetector(
      onTap: _openFile,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppColors.royalBlue.withValues(alpha: 0.2),
                  shape: BoxShape.circle),
              child: msg.isDownloading
                  ? SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                          value: msg.progress,
                          strokeWidth: 3,
                          color: AppColors.creamWhite))
                  : const Icon(Icons.insert_drive_file,
                      color: AppColors.creamWhite),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(msg.fileName ?? 'Document',
                      style: const TextStyle(
                          color: AppColors.creamWhite,
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  Text(
                      msg.isDownloading
                          ? msg.progressLabel
                          : (msg.fileSize ?? 'Unknown size'),
                      style: TextStyle(
                          color: AppColors.creamWhite.withValues(alpha: 0.7),
                          fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGifContent() {
    if (_videoController != null && _isVideoInitialized) {
      return AspectRatio(
        aspectRatio: _videoController!.value.aspectRatio,
        child: Stack(
          alignment: Alignment.center,
          children: [
            VideoPlayer(_videoController!),
            const Positioned(
                top: 8,
                right: 8,
                child: Icon(Icons.gif,
                    color: Colors.white,
                    size: 30,
                    shadows: [Shadow(blurRadius: 5, color: Colors.black)])),
          ],
        ),
      );
    }
    return Container(
        width: 200,
        height: 150,
        color: Colors.black12,
        child: const Center(child: Icon(Icons.movie, color: Colors.white54)));
  }

  Widget _buildStatusIcon() {
    if (widget.message.isError) {
      return const Icon(Icons.error_outline, size: 14, color: Colors.redAccent);
    }
    if (widget.message.isSending) {
      return const Icon(Icons.access_time,
          size: 14, color: AppColors.softBlueGrey);
    }
    // Sent (Single Tick) vs Read (Double Tick)
    if (widget.message.isRead) {
      return const Icon(Icons.done_all,
          size: 14, color: Colors.lightBlueAccent);
    } else {
      return const Icon(Icons.done, size: 14, color: AppColors.softBlueGrey);
    }
  }

  Widget _buildVoiceContent() {
    return SizedBox(
      width: 200,
      child: Row(
        children: [
          GestureDetector(
              onTap: _playPauseAudio,
              child: Icon(
                  _isAudioPlaying
                      ? Icons.pause_circle_filled
                      : Icons.play_circle_fill,
                  color: AppColors.creamWhite,
                  size: 36)),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LinearProgressIndicator(
                  value: (widget.message.duration > 0)
                      ? (_audioPosition.inSeconds / widget.message.duration)
                      : 0,
                  backgroundColor: AppColors.creamWhite.withValues(alpha: 0.3),
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(AppColors.creamWhite),
                  minHeight: 3,
                ),
                const SizedBox(height: 4),
                Text(
                    _formatDuration(_audioPosition.inSeconds > 0
                        ? _audioPosition.inSeconds
                        : widget.message.duration),
                    style: const TextStyle(
                        color: AppColors.creamWhite, fontSize: 10)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime timestamp) =>
      '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}';
  String _formatDuration(int seconds) =>
      '${(seconds ~/ 60).toString().padLeft(2, '0')}:${(seconds % 60).toString().padLeft(2, '0')}';
}
