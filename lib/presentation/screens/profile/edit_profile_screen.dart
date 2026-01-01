import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/theme/colors.dart';
import '../../../main.dart'; // Akses telegramProvider

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _bioController;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    final me = telegramProvider.me;
    
    // Pisahkan First Name dan Last Name (Sederhana)
    String fullName = me?.name ?? "";
    List<String> names = fullName.split(" ");
    String first = names.isNotEmpty ? names.first : "";
    String last = names.length > 1 ? names.sublist(1).join(" ") : "";

    _firstNameController = TextEditingController(text: first);
    _lastNameController = TextEditingController(text: last);
    _bioController = TextEditingController(text: telegramProvider.myBio);
  }

  Future<void> _changePhoto() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      telegramProvider.setProfilePhoto(image.path);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Updating profile photo...")));
      }
    }
  }

  void _saveProfile() {
    telegramProvider.updateName(_firstNameController.text, _lastNameController.text);
    telegramProvider.updateBio(_bioController.text);
    
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile updated successfully!'),
        backgroundColor: AppColors.royalBlue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final me = telegramProvider.me;
    final String? avatarPath = me?.avatarUrl;

    return Scaffold(
      backgroundColor: AppColors.midnightBlue, 
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: AppColors.midnightBlue,
        foregroundColor: AppColors.creamWhite,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: _saveProfile,
            child: const Text(
              'Save',
              style: TextStyle(
                color: AppColors.royalBlue,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Center(
            child: GestureDetector(
              onTap: _changePhoto,
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.royalBlue, width: 2),
                    ),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColors.inputFill,
                      backgroundImage: (avatarPath != null && File(avatarPath).existsSync())
                          ? FileImage(File(avatarPath))
                          : null,
                      child: (avatarPath == null || !File(avatarPath).existsSync())
                          ? const Icon(Icons.person, size: 50, color: AppColors.softBlueGrey)
                          : null,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: AppColors.royalBlue, 
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.camera_alt, color: AppColors.creamWhite, size: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),

          _buildTextField('First Name', _firstNameController, Icons.person),
          const SizedBox(height: 20),
          _buildTextField('Last Name', _lastNameController, Icons.person_outline),
          const SizedBox(height: 20),
          _buildTextField('Bio', _bioController, Icons.info_outline, maxLines: 3),
        ],
      ),
    );
  }

  Widget _buildTextField(
    String label, 
    TextEditingController controller, 
    IconData icon, 
    {TextInputType? keyboardType, int maxLines = 1}
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.softBlueGrey, 
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          style: const TextStyle(color: AppColors.creamWhite), 
          cursorColor: AppColors.royalBlue,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: AppColors.royalBlue), 
            filled: true,
            fillColor: AppColors.inputFill, 
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20), 
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: AppColors.royalBlue, width: 1.5),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _bioController.dispose();
    super.dispose();
  }
}