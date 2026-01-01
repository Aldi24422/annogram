class StickerSetInfo {
  final String id;
  final String title;
  final String name;
  final List<Sticker> stickers; 

  const StickerSetInfo({
    required this.id, 
    required this.title, 
    required this.name, 
    required this.stickers
  });
}

class Sticker {
  final int id;
  final String emoji;
  final int width;
  final int height;
  final int? fileId;
  final String? localPath;
  final bool isAnimated;

  const Sticker({
    required this.id, 
    required this.emoji, 
    required this.width, 
    required this.height, 
    this.fileId, 
    this.localPath, 
    this.isAnimated = false
  });
}