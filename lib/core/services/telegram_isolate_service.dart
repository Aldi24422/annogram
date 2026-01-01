// TelegramIsolateService - Main thread facade for TDLib isolate communication
// Spawns background isolate and provides clean API for the rest of the app

import 'dart:async';
import 'dart:isolate';

import 'package:flutter/foundation.dart';

import '../tdlib/generated/tdlib.dart';
import 'telegram_isolate_worker.dart';

/// Service that manages TDLib communication through a background isolate.
/// All heavy JSON processing happens off the main thread.
class TelegramIsolateService {
  static TelegramIsolateService? _instance;

  /// Singleton instance
  static TelegramIsolateService get instance {
    _instance ??= TelegramIsolateService._();
    return _instance!;
  }

  TelegramIsolateService._();

  // Isolate communication
  Isolate? _isolate;
  SendPort? _isolateSendPort;
  ReceivePort? _receivePort;

  // Event stream
  final _eventController = StreamController<TdObject>.broadcast();
  final _rawEventController =
      StreamController<Map<String, dynamic>>.broadcast();

  // Request tracking for responses
  final _pendingRequests = <String, Completer<TdObject?>>{};
  int _requestCounter = 0;

  // State
  bool _isInitialized = false;
  bool _isReady = false;

  /// Stream of typed TDLib events (recommended)
  Stream<TdObject> get eventStream => _eventController.stream;

  /// Stream of raw events for backwards compatibility
  Stream<Map<String, dynamic>> get rawEventStream => _rawEventController.stream;

  /// Whether the service is initialized and ready
  bool get isReady => _isReady;

  /// Initialize the isolate and TDLib client
  Future<void> initialize() async {
    if (_isInitialized) return;
    _isInitialized = true;

    try {
      _receivePort = ReceivePort();

      // Spawn the isolate
      _isolate = await Isolate.spawn(
        isolateEntryPoint,
        _receivePort!.sendPort,
      );

      // Wait for the isolate's SendPort
      final completer = Completer<void>();

      _receivePort!.listen((message) {
        if (message is SendPort) {
          _isolateSendPort = message;

          // Initialize TDLib in the isolate
          _isolateSendPort!.send(
            const IsolateRequest(type: IsolateMessageType.initialize),
          );
        } else if (message is IsolateResponse) {
          _handleIsolateResponse(message, completer);
        }
      });

      // Wait for ready signal
      await completer.future.timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('TDLib initialization timed out');
        },
      );

      debugPrint('✅ TelegramIsolateService initialized');
    } catch (e) {
      debugPrint('❌ Failed to initialize TelegramIsolateService: $e');
      _isInitialized = false;
      rethrow;
    }
  }

  void _handleIsolateResponse(
      IsolateResponse response, Completer<void>? initCompleter) {
    switch (response.type) {
      case IsolateMessageType.ready:
        _isReady = true;
        initCompleter?.complete();
        break;

      case IsolateMessageType.event:
        // Handle typed object
        if (response.object != null) {
          _eventController.add(response.object!);
        }

        // Also emit raw data for backwards compatibility
        if (response.rawData != null) {
          _rawEventController.add(response.rawData!);
        }

        // Check if this is a response to a pending request
        if (response.extra != null &&
            _pendingRequests.containsKey(response.extra)) {
          _pendingRequests[response.extra]!.complete(response.object);
          _pendingRequests.remove(response.extra);
        }
        break;

      case IsolateMessageType.error:
        debugPrint('❌ Isolate error: ${response.error}');

        // Complete any pending request with null on error
        if (response.extra != null &&
            _pendingRequests.containsKey(response.extra)) {
          _pendingRequests[response.extra]!.complete(null);
          _pendingRequests.remove(response.extra);
        }
        break;

      default:
        break;
    }
  }

  /// Send a request to TDLib (fire-and-forget)
  void send(Map<String, dynamic> request) {
    if (!_isReady || _isolateSendPort == null) {
      debugPrint('⚠️ TelegramIsolateService not ready, dropping request');
      return;
    }

    _isolateSendPort!.send(IsolateRequest(
      type: IsolateMessageType.sendRequest,
      data: request,
    ));
  }

  /// Send a request and wait for a response
  Future<TdObject?> sendAsync(Map<String, dynamic> request,
      {Duration? timeout}) async {
    if (!_isReady || _isolateSendPort == null) {
      debugPrint('⚠️ TelegramIsolateService not ready');
      return null;
    }

    // Generate unique request ID
    final requestId = 'req_${_requestCounter++}';
    final completer = Completer<TdObject?>();
    _pendingRequests[requestId] = completer;

    _isolateSendPort!.send(IsolateRequest(
      type: IsolateMessageType.sendRequest,
      data: request,
      extra: requestId,
    ));

    try {
      return await completer.future.timeout(
        timeout ?? const Duration(seconds: 30),
        onTimeout: () {
          _pendingRequests.remove(requestId);
          return null;
        },
      );
    } catch (e) {
      _pendingRequests.remove(requestId);
      return null;
    }
  }

  /// Send a request and wait for raw Map response (for repositories)
  Future<Map<String, dynamic>?> sendAsyncRaw(Map<String, dynamic> request,
      {Duration? timeout}) async {
    if (!_isReady || _isolateSendPort == null) {
      debugPrint('⚠️ TelegramIsolateService not ready');
      return null;
    }

    // Generate unique request ID
    final requestId = 'req_${_requestCounter++}';

    // Store a wrapper completer that converts TdObject to Map
    final tdCompleter = Completer<TdObject?>();
    _pendingRequests[requestId] = tdCompleter;

    _isolateSendPort!.send(IsolateRequest(
      type: IsolateMessageType.sendRequest,
      data: request,
      extra: requestId,
    ));

    try {
      final result = await tdCompleter.future.timeout(
        timeout ?? const Duration(seconds: 30),
        onTimeout: () {
          _pendingRequests.remove(requestId);
          return null;
        },
      );
      // Convert TdObject back to Map if we have it
      return result?.toMap();
    } catch (e) {
      _pendingRequests.remove(requestId);
      return null;
    }
  }

  /// Send a typed TdObject request (preferred method)
  void sendTyped(TdObject request) {
    send(request.toMap());
  }

  /// Send a typed request and wait for response
  Future<T?> sendTypedAsync<T extends TdObject>(TdObject request,
      {Duration? timeout}) async {
    final response = await sendAsync(request.toMap(), timeout: timeout);
    if (response is T) {
      return response;
    }
    return null;
  }

  /// Dispose of the service
  Future<void> dispose() async {
    if (_isolateSendPort != null) {
      _isolateSendPort!.send(
        const IsolateRequest(type: IsolateMessageType.shutdown),
      );
    }

    // Cancel all pending requests
    for (final completer in _pendingRequests.values) {
      completer.complete(null);
    }
    _pendingRequests.clear();

    await _eventController.close();
    await _rawEventController.close();
    _receivePort?.close();
    _isolate?.kill();

    _isolate = null;
    _isolateSendPort = null;
    _receivePort = null;
    _isInitialized = false;
    _isReady = false;
    _instance = null;

    debugPrint('🔌 TelegramIsolateService disposed');
  }
}
