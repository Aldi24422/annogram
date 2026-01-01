import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../../main.dart'; // Akses callProvider & telegramProvider
import '../../../core/providers/call_provider.dart'; // IMPORT PENTING: CallState ada di sini

class GroupCallScreen extends StatelessWidget {
  const GroupCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: callProvider,
      builder: (context, child) {
        // Jika call berakhir, tutup layar
        if (callProvider.callState != CallState.inGroupCall) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
             if (Navigator.canPop(context)) Navigator.pop(context);
          });
        }

        return Scaffold(
          // Background sedikit lebih gelap dari Midnight Blue untuk nuansa Call
          backgroundColor: const Color(0xFF1A1D40),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
              onPressed: () => Navigator.pop(context), // Minimize call
            ),
            title: Column(
              children: [
                const Text("Voice Chat", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                Text(
                  "${callProvider.groupCallParticipantCount} Participants", 
                  style: const TextStyle(fontSize: 12, color: Colors.white70)
                ),
              ],
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              // GRID PARTICIPANTS
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.8,
                  ),
                  // Dummy count visual (karena list participant real belum diparsing dari JSON)
                  itemCount: callProvider.groupCallParticipantCount > 0 ? callProvider.groupCallParticipantCount : 6, 
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColors.inputFill,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: AppColors.royalBlue,
                            child: Text("U${index+1}", style: const TextStyle(color: Colors.white)),
                          ),
                          const SizedBox(height: 8),
                          Text("User ${index+1}", style: const TextStyle(color: Colors.white, fontSize: 12)),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // CONTROLS PANEL
              Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: AppColors.cardSurface, // Sesuai Tema
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                     IconButton(
                       icon: Icon(callProvider.isMuted ? Icons.mic_off : Icons.mic),
                       color: Colors.white,
                       iconSize: 32,
                       onPressed: callProvider.toggleMute,
                     ),
                     
                     GestureDetector(
                       onTap: () {
                         callProvider.leaveGroupCall();
                         Navigator.pop(context);
                       },
                       child: Container(
                         padding: const EdgeInsets.all(16),
                         decoration: BoxDecoration(
                           color: Colors.red,
                           borderRadius: BorderRadius.circular(20)
                         ),
                         child: const Icon(Icons.call_end, color: Colors.white, size: 32),
                       ),
                     ),
                     
                     IconButton(
                       icon: const Icon(Icons.videocam_off), // Video not yet implemented
                       color: Colors.white54,
                       iconSize: 32,
                       onPressed: () {
                         ScaffoldMessenger.of(context).showSnackBar(
                           const SnackBar(content: Text("Video for Group Call coming soon!"))
                         );
                       },
                     ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}