import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart'; 
import '../../../data/models/call/call_model.dart';
import '../../../data/models/chat/chat_model.dart'; 
import 'call_screen.dart';
import 'video_call_screen.dart';
import '../../../main.dart'; // Akses telegramProvider

class CallHistoryScreen extends StatefulWidget {
  const CallHistoryScreen({super.key});

  @override
  State<CallHistoryScreen> createState() => _CallHistoryScreenState();
}

class _CallHistoryScreenState extends State<CallHistoryScreen> {
  
  @override
  void initState() {
    super.initState();
    // Load call history saat screen dibuka
    WidgetsBinding.instance.addPostFrameCallback((_) {
      telegramProvider.loadCallLogs();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.midnightBlue, 
      appBar: AppBar(
        title: const Text('Calls', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.midnightBlue, 
        foregroundColor: AppColors.creamWhite,   
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => telegramProvider.loadCallLogs(),
          )
        ],
      ),
      body: AnimatedBuilder(
        animation: telegramProvider,
        builder: (context, child) {
          final calls = telegramProvider.callHistory;
          
          if (telegramProvider.isLoadingCalls && calls.isEmpty) {
            return const Center(child: CircularProgressIndicator(color: AppColors.royalBlue));
          }

          if (calls.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.call_end_outlined, size: 64, color: AppColors.softBlueGrey.withValues(alpha: 0.3)),
                  const SizedBox(height: 16),
                  Text("No recent calls", style: TextStyle(color: AppColors.softBlueGrey.withValues(alpha: 0.5))),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async => telegramProvider.loadCallLogs(),
            backgroundColor: AppColors.cardSurface,
            color: AppColors.royalBlue,
            child: ListView.separated(
              padding: const EdgeInsets.only(top: 10, bottom: 100),
              itemCount: calls.length,
              separatorBuilder: (context, index) => Divider(
                color: AppColors.softBlueGrey.withValues(alpha: 0.1), 
                height: 1,
              ),
              itemBuilder: (context, index) {
                final call = calls[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  leading: CircleAvatar(
                    radius: 24,
                    backgroundColor: AppColors.royalBlue.withValues(alpha: 0.2), 
                    backgroundImage: call.callerAvatar != null
                        ? NetworkImage(call.callerAvatar!)
                        : null,
                    child: call.callerAvatar == null
                        ? Text(
                            call.callerName.isNotEmpty ? call.callerName[0] : '?',
                            style: const TextStyle(color: AppColors.royalBlue, fontWeight: FontWeight.bold),
                          )
                        : null,
                  ),
                  title: Text(
                    call.callerName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.creamWhite, 
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Icon(
                        _getCallIcon(call.direction, call.status),
                        size: 14,
                        color: _getCallColor(call.status),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        _formatDate(call.timestamp),
                        style: const TextStyle(color: AppColors.softBlueGrey), 
                      ),
                      if (call.duration != null && call.duration!.inSeconds > 0)
                         Text(" • ${_formatDuration(call.duration!)}", style: const TextStyle(color: AppColors.softBlueGrey, fontSize: 12)),
                    ],
                  ),
                  trailing: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: AppColors.inputFill,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      call.type == CallType.voice ? Icons.call : Icons.videocam,
                      color: AppColors.royalBlue, 
                      size: 20,
                    ),
                  ),
                  // KONEKSI: KLIK UNTUK TELEPON BALIK
                  onTap: () {
                    // Buat Chat Object untuk Redial
                    final dummyChat = Chat(
                      id: call.callerId, 
                      name: call.callerName, 
                      avatarUrl: call.callerAvatar,
                      timestamp: DateTime.now()
                    );

                    if (call.type == CallType.voice) {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => CallScreen(chat: dummyChat)));
                    } else {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => VideoCallScreen(chat: dummyChat)));
                    }
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }

  IconData _getCallIcon(CallDirection direction, CallStatus status) {
    if (status == CallStatus.missed) return Icons.call_missed;
    if (status == CallStatus.rejected) return Icons.call_end;
    if (direction == CallDirection.incoming) return Icons.call_received;
    return Icons.call_made;
  }

  Color _getCallColor(CallStatus status) {
    if (status == CallStatus.missed || status == CallStatus.rejected) return AppColors.error;
    return AppColors.softBlueGrey;
  }

  String _formatDate(DateTime timestamp) {
    final now = DateTime.now();
    final diff = now.difference(timestamp);
    if (diff.inDays == 0) {
      return "${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}";
    } else {
      return "${timestamp.day}/${timestamp.month}";
    }
  }

  String _formatDuration(Duration d) {
    if (d.inMinutes > 0) return "${d.inMinutes}m ${d.inSeconds % 60}s";
    return "${d.inSeconds}s";
  }
}