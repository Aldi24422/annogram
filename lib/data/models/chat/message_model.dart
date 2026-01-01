enum MessageType { text, image, video, file, voice, sticker, animation, unknown }

class Message {
  final String id;
  final String chatId;
  final String senderId;
  final String text;
  final MessageType type;
  final DateTime timestamp;
  final bool isRead;
  final bool isOutgoing; 
  final bool isSending; 
  final bool isError;
  final bool isEdited; 
  final String? replyToMessageId;

  final int? fileId;       
  final String? localPath; 
  
  // FIELD PROGRESS BARU
  final bool isDownloading;
  final double progress;        // Nilai 0.0 sampai 1.0
  final String progressLabel;   // Teks misal: "2.5 MB / 10 MB"

  final int duration; 
  final String? fileName;
  final String? fileSize; 
  
  final String? stickerEmoji; 
  final bool isAnimatedSticker; 
  final double? width;
  final double? height;

  const Message({
    required this.id,
    required this.chatId,
    required this.senderId,
    required this.text,
    this.type = MessageType.text,
    required this.timestamp,
    this.isRead = false,
    this.isOutgoing = false,
    this.isSending = false, 
    this.isError = false,
    this.isEdited = false, 
    this.replyToMessageId,
    this.fileId,
    this.localPath,
    
    // UPDATE CONSTRUCTOR
    this.isDownloading = false,
    this.progress = 0.0,
    this.progressLabel = "",

    this.duration = 0,
    this.fileName,
    this.fileSize,
    this.stickerEmoji,
    this.isAnimatedSticker = false,
    this.width,
    this.height,
  });

  factory Message.fromTdLibJson(Map<String, dynamic> json) {
    var content = json['content'];
    String textContent = '';
    MessageType msgType = MessageType.unknown;
    
    int? fId;
    String? lPath;
    int mediaDuration = 0;
    String? fName;
    String? fSize;
    String? sEmoji;
    bool sAnimated = false;
    double? w;
    double? h;

    if (content['@type'] == 'messageText') {
      msgType = MessageType.text;
      textContent = content['text']['text'];
    } else if (content['@type'] == 'messagePhoto') {
      msgType = MessageType.image;
      textContent = content['caption']?['text'] ?? '';
      if (content['photo'] != null && content['photo']['sizes'] != null) {
         List sizes = content['photo']['sizes'];
         if (sizes.isNotEmpty) {
           var largest = sizes.last;
           fId = largest['photo']['id']; 
           w = largest['width']?.toDouble();
           h = largest['height']?.toDouble();
           if (largest['photo']['local']['path'] != "") {
             lPath = largest['photo']['local']['path'];
           }
         }
      }
    } else if (content['@type'] == 'messageSticker') {
      msgType = MessageType.sticker;
      var sticker = content['sticker'];
      fId = sticker['sticker']['id'];
      w = sticker['width']?.toDouble();
      h = sticker['height']?.toDouble();
      sEmoji = sticker['emoji'];
      if (sticker['format']['@type'] == 'stickerFormatTgs') {
        sAnimated = true;
      }
      if (sticker['sticker']['local']['path'] != "") {
        lPath = sticker['sticker']['local']['path'];
      }
    } else if (content['@type'] == 'messageAnimation') {
      msgType = MessageType.animation;
      textContent = content['caption']?['text'] ?? ''; 
      var anim = content['animation'];
      fId = anim['animation']['id'];
      w = anim['width']?.toDouble();
      h = anim['height']?.toDouble();
      mediaDuration = anim['duration'] ?? 0;
      if (anim['animation']['local']['path'] != "") {
        lPath = anim['animation']['local']['path'];
      }
    } else if (content['@type'] == 'messageVoiceNote') {
      msgType = MessageType.voice;
      textContent = content['caption']?['text'] ?? '';
      var voice = content['voice_note'];
      mediaDuration = voice['duration'] ?? 0;
      fId = voice['voice']['id'];
      if (voice['voice']['local']['path'] != "") {
        lPath = voice['voice']['local']['path'];
      }
    } else if (content['@type'] == 'messageVideo') {
      msgType = MessageType.video;
      textContent = content['caption']?['text'] ?? '';
      var video = content['video'];
      mediaDuration = video['duration'] ?? 0;
      fId = video['video']['id'];
      fName = video['file_name'];
      fSize = formatBytes(video['video']['size'] ?? 0); // Use public helper
      if (video['video']['local']['path'] != "") {
        lPath = video['video']['local']['path'];
      }
    } else if (content['@type'] == 'messageDocument') {
      msgType = MessageType.file;
      textContent = content['caption']?['text'] ?? '';
      var doc = content['document'];
      fId = doc['document']['id'];
      fName = doc['file_name'];
      fSize = formatBytes(doc['document']['size'] ?? 0); // Use public helper
      if (doc['document']['local']['path'] != "") {
        lPath = doc['document']['local']['path'];
      }
    } else {
      textContent = '[Unsupported Message]';
    }

    bool sending = false;
    bool error = false;
    if (json['sending_state'] != null) {
      String state = json['sending_state']['@type'];
      if (state == 'messageSendingStatePending') sending = true;
      if (state == 'messageSendingStateFailed') error = true;
    }

    bool edited = false;
    if (json['edit_date'] != null && json['edit_date'] > 0) {
      edited = true;
    }

    return Message(
      id: json['id'].toString(),
      chatId: json['chat_id'].toString(),
      senderId: json['sender_id'] != null ? json['sender_id']['user_id'].toString() : '0',
      text: textContent,
      type: msgType,
      timestamp: DateTime.fromMillisecondsSinceEpoch((json['date'] ?? 0) * 1000),
      isOutgoing: json['is_outgoing'] ?? false,
      isRead: (json['is_outgoing'] ?? false) ? false : !(json['is_read'] ?? true),
      isSending: sending,
      isError: error,
      isEdited: edited,
      replyToMessageId: json['reply_to_message_id']?.toString(), 
      fileId: fId,
      localPath: lPath,
      // Default Values saat inisialisasi
      isDownloading: false,
      progress: 0.0,
      progressLabel: "",
      
      duration: mediaDuration,
      fileName: fName,
      fileSize: fSize,
      stickerEmoji: sEmoji,
      isAnimatedSticker: sAnimated,
      width: w,
      height: h,
    );
  }

  Message copyWith({
    String? localPath,
    bool? isDownloading,
    double? progress,
    String? progressLabel,
    bool? isRead,
    bool? isEdited,
  }) {
    return Message(
      id: id,
      chatId: chatId,
      senderId: senderId,
      text: text,
      type: type,
      timestamp: timestamp,
      isRead: isRead ?? this.isRead,
      isOutgoing: isOutgoing,
      isSending: isSending,
      isError: isError,
      isEdited: isEdited ?? this.isEdited,
      replyToMessageId: replyToMessageId,
      fileId: fileId,
      localPath: localPath ?? this.localPath,
      
      // Update Field Progress
      isDownloading: isDownloading ?? this.isDownloading,
      progress: progress ?? this.progress,
      progressLabel: progressLabel ?? this.progressLabel,
      
      duration: duration,
      fileName: fileName,
      fileSize: fileSize,
      stickerEmoji: stickerEmoji,
      isAnimatedSticker: isAnimatedSticker,
      width: width,
      height: height,
    );
  }

  // JADI PUBLIC AGAR BISA DIPAKAI PROVIDER
  static String formatBytes(int bytes) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB"];
    var i = 0;
    double size = bytes.toDouble();
    while (size >= 1024 && i < suffixes.length - 1) {
      size /= 1024;
      i++;
    }
    return '${size.toStringAsFixed(1)} ${suffixes[i]}';
  }
}