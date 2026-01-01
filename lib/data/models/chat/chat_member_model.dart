import 'user_model.dart';

enum ChatMemberStatus { creator, administrator, member, restricted, left, banned }

class ChatMember {
  final String userId;
  final String name;
  final String? avatarUrl;
  final ChatMemberStatus status;
  final String customTitle; // Gelar khusus (misal: "King")

  const ChatMember({
    required this.userId,
    required this.name,
    this.avatarUrl,
    required this.status,
    this.customTitle = "",
  });

  factory ChatMember.fromTdLibJson(Map<String, dynamic> json, Map<String, User> userMap) {
    // 1. Ambil User ID
    String uid = '0';
    if (json['member_id'] != null && json['member_id']['@type'] == 'messageSenderUser') {
      uid = json['member_id']['user_id'].toString();
    }

    // 2. Ambil Info User dari Cache (UserMap)
    final user = userMap[uid];
    String uName = user?.name ?? "Unknown";
    String? uAvatar = user?.avatarUrl;

    // 3. Parse Status
    ChatMemberStatus st = ChatMemberStatus.member;
    String title = "";
    
    if (json['status'] != null) {
      final type = json['status']['@type'];
      if (type == 'chatMemberStatusCreator') {
        st = ChatMemberStatus.creator;
        title = json['status']['custom_title'] ?? "Owner";
      } else if (type == 'chatMemberStatusAdministrator') {
        st = ChatMemberStatus.administrator;
        title = json['status']['custom_title'] ?? "Admin";
      } else if (type == 'chatMemberStatusBanned') {
        st = ChatMemberStatus.banned;
      } else if (type == 'chatMemberStatusLeft') {
        st = ChatMemberStatus.left;
      }
    }

    return ChatMember(
      userId: uid,
      name: uName,
      avatarUrl: uAvatar,
      status: st,
      customTitle: title,
    );
  }
}