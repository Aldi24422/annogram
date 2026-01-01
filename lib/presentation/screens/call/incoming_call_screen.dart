import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/colors.dart';
import '../../../main.dart'; // Akses variabel global 'callProvider'
import '../../../core/providers/call_provider.dart'; // IMPORT PENTING: Agar 'CallState' dikenali

class IncomingCallScreen extends StatelessWidget {
  const IncomingCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: callProvider,
      builder: (context, child) {
        // Jika panggilan sudah diterima/mati, tutup layar ini
        if (callProvider.callState != CallState.incoming) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (Navigator.canPop(context)) Navigator.pop(context);
          });
        }

        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            fit: StackFit.expand,
            children: [
              // BACKGROUND
              if (callProvider.callerAvatar != null)
                Image.network(callProvider.callerAvatar!, fit: BoxFit.cover)
              else
                Container(color: const Color(0xFF2D336B)),

              // BLUR EFFECT
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(color: Colors.black.withValues(alpha: 0.5)),
              ),

              // KONTEN
              SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 2),
                    
                    // FOTO PROFIL
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: AppColors.royalBlue,
                      backgroundImage: callProvider.callerAvatar != null
                          ? NetworkImage(callProvider.callerAvatar!)
                          : null,
                      child: callProvider.callerAvatar == null
                          ? Text(
                              callProvider.callerName.isNotEmpty ? callProvider.callerName[0] : '?',
                              style: const TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
                            )
                          : null,
                    ),
                    const SizedBox(height: 24),
                    
                    // NAMA & STATUS
                    Text(
                      callProvider.callerName,
                      style: GoogleFonts.lora(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Incoming Voice Call...",
                      style: TextStyle(color: Colors.white70, fontSize: 16, letterSpacing: 1.0),
                    ),
                    
                    const Spacer(flex: 3),

                    // TOMBOL TERIMA / TOLAK
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // DECLINE BUTTON (MERAH)
                          _buildCallButton(
                            icon: Icons.call_end,
                            color: Colors.redAccent,
                            label: "Decline",
                            onTap: () {
                              callProvider.endCall(); // Tolak
                            },
                          ),

                          // ACCEPT BUTTON (HIJAU)
                          _buildCallButton(
                            icon: Icons.call,
                            color: Colors.greenAccent,
                            label: "Accept",
                            isAnimated: true, // Efek getar/pulse
                            onTap: () {
                              callProvider.answerCall(); // Terima
                              // Pindah ke layar CallScreen (Ongoing)
                              Navigator.pushReplacementNamed(context, '/call'); 
                            },
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

  Widget _buildCallButton({
    required IconData icon,
    required Color color,
    required String label,
    required VoidCallback onTap,
    bool isAnimated = false,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 75, width: 75,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: isAnimated 
                ? [BoxShadow(color: color.withValues(alpha: 0.6), blurRadius: 20, spreadRadius: 5)] 
                : [],
            ),
            child: Icon(icon, color: Colors.white, size: 32),
          ),
        ),
        const SizedBox(height: 12),
        Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
      ],
    );
  }
}