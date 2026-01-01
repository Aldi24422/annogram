import 'dart:ui'; 
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; 
import '../../../core/theme/colors.dart';
import '../../../data/models/chat/chat_model.dart';
import '../../../main.dart'; // Kita hanya butuh ini untuk akses variabel 'callProvider'

class CallScreen extends StatefulWidget {
  final Chat chat;

  const CallScreen({super.key, required this.chat});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {

  @override
  void initState() {
    super.initState();
    // Memulai panggilan saat layar dibuka
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callProvider.startCall(widget.chat.id, false);
    });
  }

  void _handleEndCall() {
    callProvider.endCall();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // Mendengarkan perubahan di CallProvider (Variabel global dari main.dart)
    return AnimatedBuilder(
      animation: callProvider,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.black, 
          body: Stack(
            fit: StackFit.expand,
            children: [
              // --- LAYER 1: BACKGROUND IMAGE ---
              if (widget.chat.avatarUrl != null)
                Image.network(
                  widget.chat.avatarUrl!,
                  fit: BoxFit.cover,
                )
              else
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Color(0xFF2D336B), Color(0xFF1A1D40)],
                    ),
                  ),
                ),

              // --- LAYER 2: BLUR ---
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15), 
                child: Container(color: Colors.black.withValues(alpha: 0.6)),
              ),

              // --- LAYER 3: KONTEN ---
              SafeArea(
                child: Column(
                  children: [
                    // Header
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white70, size: 30),
                            onPressed: () => Navigator.pop(context), 
                          ),
                          const Spacer(),
                          const Icon(Icons.lock, size: 14, color: Colors.white54),
                          const SizedBox(width: 6),
                          const Text("End-to-end Encrypted", style: TextStyle(color: Colors.white54, fontSize: 12)),
                          const Spacer(),
                          const SizedBox(width: 40), 
                        ],
                      ),
                    ),

                    const Spacer(flex: 1),

                    // AVATAR
                    Container(
                      padding: const EdgeInsets.all(3), 
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white.withValues(alpha: 0.2), width: 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.3),
                            blurRadius: 20,
                            spreadRadius: 5,
                          )
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: AppColors.inputFill,
                        backgroundImage: widget.chat.avatarUrl != null
                            ? NetworkImage(widget.chat.avatarUrl!)
                            : null,
                        child: widget.chat.avatarUrl == null
                            ? Text(
                                widget.chat.name.isNotEmpty ? widget.chat.name[0].toUpperCase() : '?',
                                style: GoogleFonts.lora(fontSize: 40, color: AppColors.creamWhite, fontWeight: FontWeight.bold),
                              )
                            : null,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // NAMA & STATUS (DINAMIS DARI PROVIDER)
                    Text(
                      widget.chat.name,
                      style: GoogleFonts.lora(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        shadows: [Shadow(color: Colors.black.withValues(alpha: 0.5), blurRadius: 10)],
                      ),
                    ),
                    const SizedBox(height: 8),
                    
                    // STATUS TEXT (Dialing -> Ringing -> 00:01)
                    Text(
                      callProvider.statusText,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.7),
                        fontSize: 16,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const Spacer(flex: 2),

                    // --- TOMBOL KONTROL ---
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50, left: 30, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // MUTE
                          _buildGlassButton(
                            icon: callProvider.isMuted ? Icons.mic_off : Icons.mic,
                            label: "Mute",
                            isActive: callProvider.isMuted,
                            onTap: callProvider.toggleMute,
                          ),

                          // END CALL
                          GestureDetector(
                            onTap: _handleEndCall,
                            child: Container(
                              height: 72, width: 72,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFF4B4B), 
                                borderRadius: BorderRadius.circular(24), 
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFFFF4B4B).withValues(alpha: 0.4),
                                    blurRadius: 20,
                                    offset: const Offset(0, 5),
                                  )
                                ],
                              ),
                              child: const Icon(Icons.call_end_rounded, color: Colors.white, size: 32),
                            ),
                          ),

                          // SPEAKER
                          _buildGlassButton(
                            icon: callProvider.isSpeakerOn ? Icons.volume_up : Icons.volume_off,
                            label: "Speaker",
                            isActive: callProvider.isSpeakerOn,
                            onTap: callProvider.toggleSpeaker,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGlassButton({
    required IconData icon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 56, width: 56,
            decoration: BoxDecoration(
              color: isActive ? Colors.white : Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20), 
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.2),
                width: 1
              ),
            ),
            child: Icon(
              icon,
              color: isActive ? Colors.black : Colors.white,
              size: 26,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label, 
          style: TextStyle(color: Colors.white.withValues(alpha: 0.6), fontSize: 12)
        ),
      ],
    );
  }
}