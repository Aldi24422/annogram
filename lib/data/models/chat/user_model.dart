class User {
  final String id;
  final String name;
  final String? phoneNumber;
  final String? avatarUrl;
  final bool isOnline;
  final String? status;

  const User({
    required this.id,
    required this.name,
    this.phoneNumber,
    this.avatarUrl,
    this.isOnline = false,
    this.status,
  });

  // Factory: Mengubah JSON TDLib menjadi Object User
  factory User.fromTdLibJson(Map<String, dynamic> json) {
    // Gabungkan First Name & Last Name
    String fullName = json['first_name'] ?? '';
    if (json['last_name'] != null && json['last_name'].isNotEmpty) {
      fullName += ' ${json['last_name']}';
    }
    if (fullName.trim().isEmpty) fullName = 'Unknown';

    // Cek Status Online
    bool online = false;
    String statusText = 'Offline';

    if (json['status'] != null) {
      final type = json['status']['@type'];
      if (type == 'userStatusOnline') {
        online = true;
        statusText = 'Online';
      } else if (type == 'userStatusRecently') {
        statusText = 'Last seen recently';
      } else {
        statusText = 'Offline';
      }
    }

    // Ambil Foto Profil Kecil (jika ada)
    String? avatar;
    if (json['profile_photo'] != null &&
        json['profile_photo']['small'] != null) {
      avatar = json['profile_photo']['small']['local']['path'];
      if (avatar == "") {
        avatar = null;
      } // Jika path kosong, berarti belum didownload
    }

    return User(
      id: json['id'].toString(),
      name: fullName,
      phoneNumber: json['phone_number'],
      avatarUrl: avatar, // Akan berisi path lokal
      isOnline: online,
      status: statusText,
    );
  }

  // Factory: Convert TdUser (Generated) to User (Legacy UI Model)
  // This allows us to use the new Repository pattern with existing UI
  factory User.fromTdUser(dynamic tdUser) {
    // Note: using dynamic to avoid import cycles if TdUser is not easily available,
    // but ideally should be typed TdUser.
    // For now assuming tdUser matches the structure of TdUser class.

    String fullName = tdUser.firstName ?? '';
    if (tdUser.lastName != null && tdUser.lastName!.isNotEmpty) {
      fullName += ' ${tdUser.lastName}';
    }
    if (fullName.trim().isEmpty) fullName = 'Unknown';

    bool online = false;
    String statusText = 'Offline';

    if (tdUser.status != null) {
      // Map TdUserStatus to String
      // Depending on how TdAny is generated, checking runtime type or properties
      final statusType = tdUser.status.runtimeType.toString();
      if (statusType.contains('Onl') || statusType.contains('Online')) {
        // Weak check, better checks needed
        online = true;
        statusText = 'Online';
      } else if (statusType.contains('Recently')) {
        statusText = 'Last seen recently';
      }
    }

    String? avatar;
    if (tdUser.profilePhoto != null && tdUser.profilePhoto!.small != null) {
      avatar = tdUser.profilePhoto!.small!.local?.path;
      if (avatar == "") avatar = null;
    }

    return User(
      id: tdUser.id.toString(),
      name: fullName,
      phoneNumber: tdUser.phoneNumber,
      avatarUrl: avatar,
      isOnline: online,
      status: statusText,
    );
  }
}
