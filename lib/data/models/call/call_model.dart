enum CallType { voice, video }
enum CallDirection { incoming, outgoing }
enum CallStatus { missed, completed, rejected, ongoing }

class Call {
  final String id;
  final String callerId;
  final String callerName;
  final String? callerAvatar;
  final CallType type;
  final CallDirection direction;
  final CallStatus status;
  final DateTime timestamp;
  final Duration? duration;

  const Call({
    required this.id,
    required this.callerId,
    required this.callerName,
    this.callerAvatar,
    required this.type,
    required this.direction,
    required this.status,
    required this.timestamp,
    this.duration,
  });

  // FACTORY BARU: Menerjemahkan Data TDLib
  factory Call.fromTdLibJson(Map<String, dynamic> json, int myUserId) {
    // 1. Tentukan Caller & Direction
    // Di TDLib history, pesan call disimpan sbg pesan biasa.
    // Jika sender_id == my_id, berarti Outgoing.
    int senderId = 0;
    if (json['sender_id'] != null && json['sender_id']['user_id'] != null) {
      senderId = json['sender_id']['user_id'];
    }

    bool isOutgoing = (senderId == myUserId);
    CallDirection direction = isOutgoing ? CallDirection.outgoing : CallDirection.incoming;

    // 2. Parse Konten Call
    var content = json['content'];
    int durationSec = 0;
    String discardReason = "";
    bool isVideo = false;

    if (content['@type'] == 'messageCall') {
      durationSec = content['duration'] ?? 0;
      discardReason = content['discard_reason']['@type'];
      isVideo = content['is_video'] ?? false;
    }

    // 3. Tentukan Status
    CallStatus status = CallStatus.completed;
    if (discardReason == 'callDiscardReasonMissed') {
      status = CallStatus.missed;
    } else if (discardReason == 'callDiscardReasonDeclined') {
      status = CallStatus.rejected;
    } else if (durationSec == 0 && !isOutgoing) {
      status = CallStatus.missed; // Asumsi jika durasi 0 dan incoming
    }

    // 4. Nama & Avatar (Nanti di-enrich di Provider, disini default dulu)
    // Kita simpan ID user lawan bicara. 
    // Jika outgoing, lawan bicaranya adalah chat_id. Jika incoming, sender_id.
    String partnerId = isOutgoing ? json['chat_id'].toString() : senderId.toString();

    return Call(
      id: json['id'].toString(),
      callerId: partnerId, 
      callerName: "User $partnerId", // Placeholder, nanti diganti provider
      callerAvatar: null,            // Placeholder
      type: isVideo ? CallType.video : CallType.voice,
      direction: direction,
      status: status,
      timestamp: DateTime.fromMillisecondsSinceEpoch((json['date'] ?? 0) * 1000),
      duration: Duration(seconds: durationSec),
    );
  }

  // Helper untuk update info user setelah data kontak tersedia
  Call copyWith({String? callerName, String? callerAvatar}) {
    return Call(
      id: id,
      callerId: callerId,
      callerName: callerName ?? this.callerName,
      callerAvatar: callerAvatar ?? this.callerAvatar,
      type: type,
      direction: direction,
      status: status,
      timestamp: timestamp,
      duration: duration,
    );
  }
}