import 'dart:io';
import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../../data/models/chat/message_model.dart';

class MediaViewerScreen extends StatefulWidget {
  final List<Message> mediaMessages;
  final int initialIndex;

  const MediaViewerScreen({
    super.key,
    required this.mediaMessages,
    required this.initialIndex,
  });

  @override
  State<MediaViewerScreen> createState() => _MediaViewerScreenState();
}

class _MediaViewerScreenState extends State<MediaViewerScreen> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true, // Agar gambar full screen di balik AppBar
      appBar: AppBar(
        backgroundColor: Colors.black.withValues(alpha: 0.4),
        foregroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Media", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(
              "${_currentIndex + 1} of ${widget.mediaMessages.length}",
              style: const TextStyle(fontSize: 12, color: Colors.white70),
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.share), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.mediaMessages.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          final msg = widget.mediaMessages[index];
          
          if (msg.localPath == null || !File(msg.localPath!).existsSync()) {
            return const Center(child: CircularProgressIndicator(color: AppColors.royalBlue));
          }

          if (msg.type == MessageType.video) {
            return const Center(child: Icon(Icons.play_circle_outline, size: 80, color: Colors.white));
            // Note: Video Player logic bisa ditambahkan disini nanti
          }

          return InteractiveViewer(
            minScale: 0.5,
            maxScale: 4.0,
            child: Center(
              child: Image.file(
                File(msg.localPath!),
                fit: BoxFit.contain,
              ),
            ),
          );
        },
      ),
    );
  }
}