import 'dart:async';
import 'package:flutter/material.dart';
import '../../main.dart'; // Akses telegramProvider
import '../../data/models/chat/user_model.dart'; 

enum CallState { initial, dialing, ringing, incoming, connected, ended, discarding, inGroupCall }

class CallProvider extends ChangeNotifier {
  CallState _callState = CallState.initial;
  Duration _duration = Duration.zero;
  Timer? _callTimer;
  int _callId = 0;
  
  // 1-on-1 Call Info
  String _callerName = "Unknown";
  String? _callerAvatar;
  
  // Group Call Info (BARU)
  int _activeGroupCallId = 0;
  int _groupCallParticipantCount = 0;
  final Set<String> _groupCallParticipants = {}; // Set User IDs

  bool _isMuted = false;
  bool _isSpeakerOn = false;

  // Getters
  CallState get callState => _callState;
  Duration get duration => _duration;
  bool get isMuted => _isMuted;
  bool get isSpeakerOn => _isSpeakerOn;
  int get callId => _callId;
  String get callerName => _callerName;
  String? get callerAvatar => _callerAvatar;
  
  int get activeGroupCallId => _activeGroupCallId;
  int get groupCallParticipantCount => _groupCallParticipantCount;
  List<String> get groupCallParticipants => _groupCallParticipants.toList();

  String get statusText {
    switch (_callState) {
      case CallState.initial: return "Ready";
      case CallState.dialing: return "Dialing...";
      case CallState.ringing: return "Ringing...";
      case CallState.incoming: return "Incoming Call...";
      case CallState.connected: return _formatDuration(_duration);
      case CallState.ended: return "Call Ended";
      case CallState.discarding: return "Ending...";
      case CallState.inGroupCall: return "Voice Chat Active";
    }
  }

  // --- 1-ON-1 ACTIONS ---
  void startCall(String userId, bool isVideo) {
    _reset();
    _callState = CallState.dialing;
    notifyListeners();
    telegramProvider.createCall(userId, isVideo);
  }

  void answerCall() {
    if (_callId != 0) {
      telegramProvider.acceptCall(_callId); 
      _callState = CallState.connected;     
      _startTimer();
      notifyListeners();
    }
  }

  void endCall() {
    if (_callId != 0) {
      _callState = CallState.discarding;
      notifyListeners();
      telegramProvider.discardCall(_callId);
    } else if (_activeGroupCallId != 0) {
      // Leave Group Call
      leaveGroupCall();
    } else {
      _reset();
    }
  }

  // --- GROUP CALL ACTIONS (BARU) ---
  
  void joinGroupCall(int groupCallId) {
    _reset();
    _activeGroupCallId = groupCallId;
    _callState = CallState.inGroupCall; // Set state
    notifyListeners();
    
    telegramProvider.joinGroupCall(groupCallId);
  }

  void leaveGroupCall() {
    if (_activeGroupCallId != 0) {
      telegramProvider.leaveGroupCall(_activeGroupCallId);
      _reset();
    }
  }

  // --- UPDATE DARI TELEGRAM PROVIDER ---

  void handleIncomingCall(int id, String userId) {
    _callId = id;
    _callState = CallState.incoming; 
    
    final user = telegramProvider.contacts.firstWhere(
      (u) => u.id == userId, 
      orElse: () => const User(id: '0', name: 'Unknown Caller') 
    );
    _callerName = user.name;
    _callerAvatar = user.avatarUrl;
    notifyListeners();
  }

  // Update State Group Call
  void updateGroupCallState(int id, int count, bool isJoined) {
    if (isJoined) {
      _activeGroupCallId = id;
      _groupCallParticipantCount = count;
      _callState = CallState.inGroupCall;
    } else if (_activeGroupCallId == id) {
      // Jika kita sebelumnya join tapi sekarang isJoined false, berarti ended/kicked
      _reset();
    }
    notifyListeners();
  }

  // Update Peserta Group Call
  void updateGroupCallParticipant(int groupCallId, Map participant) {
    // Ambil User ID dari participant info (simplifikasi)
    if (groupCallId == _activeGroupCallId) {
      // Logic parsing participant ID dari TDLib JSON agak kompleks
      // Disini kita simpan ID dummy dulu agar UI terupdate
      // Nanti bisa diperbaiki dengan parsing 'messageSenderUser'
      notifyListeners();
    }
  }

  void setCallId(int id) { _callId = id; }

  void updateCallState(String stateType) {
    switch (stateType) {
      case 'callStatePending':
        if (_callState == CallState.initial) { _callState = CallState.dialing; }
        break;
      case 'callStateReady': 
        if (_callState != CallState.connected) { _callState = CallState.connected; _startTimer(); }
        break;
      case 'callStateDiscarded':
        _callState = CallState.ended;
        _stopTimer();
        Future.delayed(const Duration(seconds: 2), () => _reset());
        break;
    }
    notifyListeners();
  }

  void toggleMute() { _isMuted = !_isMuted; notifyListeners(); }
  void toggleSpeaker() { _isSpeakerOn = !_isSpeakerOn; notifyListeners(); }

  void _startTimer() {
    _callTimer?.cancel();
    _callTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _duration += const Duration(seconds: 1);
      notifyListeners();
    });
  }

  void _stopTimer() => _callTimer?.cancel();

  void _reset() {
    _callState = CallState.initial;
    _duration = Duration.zero;
    _callId = 0;
    _activeGroupCallId = 0;
    _groupCallParticipants.clear();
    _isMuted = false;
    _isSpeakerOn = false;
    _stopTimer();
    notifyListeners();
  }

  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    return "${twoDigits(d.inMinutes.remainder(60))}:${twoDigits(d.inSeconds.remainder(60))}";
  }

  @override
  void dispose() {
    _callTimer?.cancel();
    super.dispose();
  }
}