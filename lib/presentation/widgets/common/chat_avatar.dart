import 'dart:io';
import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';

class ChatAvatar extends StatelessWidget {
  final String? imagePath;
  final String? imageUrl;
  final String name;
  final double size;
  final bool isOnline;
  final bool showOnlineStatus;
  final double fontSize;

  const ChatAvatar({
    super.key,
    this.imagePath,
    this.imageUrl,
    required this.name,
    this.size = 24, // Radius default
    this.isOnline = false,
    this.showOnlineStatus = false,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    // 1. Base Avatar
    ImageProvider? backgroundImage;
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      backgroundImage = NetworkImage(imageUrl!);
    } else if (imagePath != null &&
        imagePath!.isNotEmpty &&
        File(imagePath!).existsSync()) {
      backgroundImage = FileImage(File(imagePath!));
    }

    Widget avatar = CircleAvatar(
      radius: size,
      backgroundColor: AppColors.royalBlue.withValues(alpha: 0.2),
      backgroundImage: backgroundImage,
      child: backgroundImage == null
          ? Text(
              name.isNotEmpty ? name[0].toUpperCase() : '?',
              style: TextStyle(
                color: AppColors.royalBlue,
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
              ),
            )
          : null,
    );

    // 2. Jika tidak butuh status online, return avatar saja
    if (!showOnlineStatus) return avatar;

    // 3. Jika butuh status online, bungkus dengan Stack
    return Stack(
      children: [
        avatar,
        if (isOnline)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: size * 0.6, // Ukuran indikator proporsional
              height: size * 0.6,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context)
                      .scaffoldBackgroundColor, // Border warna background agar terlihat terpisah
                  width: 2,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
