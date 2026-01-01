import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; 
import '../../../data/models/chat/chat_model.dart';

class VideoCallScreen extends StatefulWidget {
  final Chat chat;

  const VideoCallScreen({super.key, required this.chat});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  bool isMuted = false;
  bool isVideoOff = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand, // Pastikan stack memenuhi layar
        children: [
          // 1. REMOTE VIDEO (FULL SCREEN BACKGROUND)
          Positioned.fill(
            child: widget.chat.avatarUrl != null
                ? Image.network(
                    widget.chat.avatarUrl!,
                    fit: BoxFit.cover, // Memaksa gambar memenuhi layar
                  )
                : Container(
                    color: const Color(0xFF2D336B),
                    child: Center(
                      child: Text(
                        widget.chat.name[0],
                        style: GoogleFonts.lora(
                          color: Colors.white12, 
                          fontSize: 150,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
          ),

          // Gradient Hitam di Bawah (Agar tombol terlihat jelas)
          Positioned(
            bottom: 0, left: 0, right: 0,
            height: 180,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.8),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // 2. HEADER NAMA (Atas)
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.chat.name,
                    style: GoogleFonts.lora(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      shadows: [Shadow(blurRadius: 5, color: Colors.black.withValues(alpha: 0.5))],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "02:15",
                      style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),

          // 3. KAMERA SENDIRI (Floating)
          Positioned(
            right: 20,
            top: 60,
            child: Container(
              width: 100,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(18), 
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: 0.5), blurRadius: 15, offset: const Offset(0, 5))
                ],
                image: const DecorationImage(
                  image: NetworkImage('https://i.pravatar.cc/150?img=11'), // Simulasi
                  fit: BoxFit.cover,
                ),
              ),
              child: isVideoOff
                  ? const Center(child: Icon(Icons.videocam_off, color: Colors.white54))
                  : null,
            ),
          ),

          // 4. KONTROL TOMBOL (Floating Individual) - PERBAIKAN OVERFLOW
          Positioned(
            bottom: 40,
            left: 20,  
            right: 20, 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Jarak merata antar tombol
              children: [
                _buildCircleGlassButton(
                  icon: isVideoOff ? Icons.videocam_off : Icons.videocam,
                  isActive: !isVideoOff,
                  onTap: () => setState(() => isVideoOff = !isVideoOff),
                ),
                _buildCircleGlassButton(
                  icon: isMuted ? Icons.mic_off : Icons.mic,
                  isActive: !isMuted,
                  onTap: () => setState(() => isMuted = !isMuted),
                ),
                
                // End Call Besar (Padding dikurangi sedikit agar muat)
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(16), // Dikurangi dari 18 ke 16
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF4B4B),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(color: const Color(0xFFFF4B4B).withValues(alpha: 0.4), blurRadius: 15)
                      ],
                    ),
                    child: const Icon(Icons.call_end_rounded, color: Colors.white, size: 32),
                  ),
                ),
                
                _buildCircleGlassButton(
                  icon: Icons.cameraswitch_rounded,
                  isActive: true,
                  onTap: () {}, 
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleGlassButton({
    required IconData icon,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12), // Dikurangi dari 14 ke 12 agar tidak overflow
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.white.withValues(alpha: 0.2),
          shape: BoxShape.circle, 
        ),
        child: Icon(
          icon,
          color: isActive ? Colors.black : Colors.white,
          size: 24,
        ),
      ),
    );
  }
}