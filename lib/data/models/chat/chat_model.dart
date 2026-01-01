class Chat {
  final String id;
  final String name;
  final String? lastMessage;
  final DateTime timestamp;
  final int unreadCount;
  final bool isOnline;
  final bool isGroup;
  final bool isSecret;
  final bool isArchived;
  final bool isPinned; 
  final bool isMuted;  
  
  // FIELD BARU: ID PESAN YANG DI-PIN DI DALAM CHAT
  final String? pinnedMessageId;
  
  final String? avatarUrl;
  final List<String>? members;

  const Chat({
    required this.id,
    required this.name,
    this.lastMessage,
    required this.timestamp,
    this.unreadCount = 0,
    this.isOnline = false,
    this.isGroup = false,
    this.isSecret = false,
    this.isArchived = false,
    this.isPinned = false,
    this.isMuted = false,
    this.pinnedMessageId, // Constructor update
    this.avatarUrl,
    this.members,
  });

  Chat copyWith({
    String? id,
    String? name,
    String? lastMessage,
    DateTime? timestamp,
    int? unreadCount,
    bool? isOnline,
    bool? isGroup,
    bool? isSecret,
    bool? isArchived,
    bool? isPinned,
    bool? isMuted,
    String? pinnedMessageId, // Parameter update
    String? avatarUrl,
    List<String>? members,
  }) {
    return Chat(
      id: id ?? this.id,
      name: name ?? this.name,
      lastMessage: lastMessage ?? this.lastMessage,
      timestamp: timestamp ?? this.timestamp,
      unreadCount: unreadCount ?? this.unreadCount,
      isOnline: isOnline ?? this.isOnline,
      isGroup: isGroup ?? this.isGroup,
      isSecret: isSecret ?? this.isSecret,
      isArchived: isArchived ?? this.isArchived,
      isPinned: isPinned ?? this.isPinned,
      isMuted: isMuted ?? this.isMuted,
      pinnedMessageId: pinnedMessageId ?? this.pinnedMessageId,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      members: members ?? this.members,
    );
  }
}