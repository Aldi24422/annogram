// TelegramIsolateWorker - Runs in background isolate
// Handles FFI calls, JSON decoding, and object mapping OFF the main thread

import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:isolate';

import 'package:ffi/ffi.dart';

import '../tdlib/generated/tdlib.dart';

/// Message types for isolate communication
enum IsolateMessageType {
  /// Initialize the TDLib client
  initialize,

  /// Send a request to TDLib
  sendRequest,

  /// Received event from TDLib (worker -> main)
  event,

  /// Error occurred (worker -> main)
  error,

  /// Shutdown the isolate
  shutdown,

  /// Initialization complete (worker -> main)
  ready,
}

/// Message sent TO the isolate worker
class IsolateRequest {
  final IsolateMessageType type;
  final Map<String, dynamic>? data;
  final String? extra;

  const IsolateRequest({
    required this.type,
    this.data,
    this.extra,
  });
}

/// Message sent FROM the isolate worker
class IsolateResponse {
  final IsolateMessageType type;
  final TdObject? object;
  final Map<String, dynamic>? rawData;
  final String? error;
  final String? extra;

  const IsolateResponse({
    required this.type,
    this.object,
    this.rawData,
    this.error,
    this.extra,
  });
}

/// FFI typedefs for TDLib
typedef TdJsonClientCreateNative = Pointer<Void> Function();
typedef TdJsonClientCreate = Pointer<Void> Function();

typedef TdJsonClientSendNative = Void Function(
    Pointer<Void> client, Pointer<Utf8> request);
typedef TdJsonClientSend = void Function(
    Pointer<Void> client, Pointer<Utf8> request);

typedef TdJsonClientReceiveNative = Pointer<Utf8> Function(
    Pointer<Void> client, Double timeout);
typedef TdJsonClientReceive = Pointer<Utf8> Function(
    Pointer<Void> client, double timeout);

typedef TdJsonClientDestroyNative = Void Function(Pointer<Void> client);
typedef TdJsonClientDestroy = void Function(Pointer<Void> client);

/// Entry point for the background isolate
void isolateEntryPoint(SendPort mainSendPort) {
  final worker = _IsolateWorker(mainSendPort);
  worker.start();
}

/// Internal worker class that runs in the isolate
class _IsolateWorker {
  final SendPort _mainSendPort;
  late final ReceivePort _receivePort;

  // FFI bindings
  late final DynamicLibrary _lib;
  late final TdJsonClientCreate _createClient;
  late final TdJsonClientSend _send;
  late final TdJsonClientReceive _receive;
  late final TdJsonClientDestroy _destroy;

  Pointer<Void>? _client;
  bool _isRunning = false;
  bool _isInitialized = false;

  _IsolateWorker(this._mainSendPort);

  void start() {
    _receivePort = ReceivePort();
    _mainSendPort.send(_receivePort.sendPort);

    _receivePort.listen(_handleMessage);
  }

  void _handleMessage(dynamic message) {
    if (message is! IsolateRequest) return;

    switch (message.type) {
      case IsolateMessageType.initialize:
        _initialize();
        break;
      case IsolateMessageType.sendRequest:
        _sendRequest(message.data!, message.extra);
        break;
      case IsolateMessageType.shutdown:
        _shutdown();
        break;
      default:
        break;
    }
  }

  void _initialize() {
    try {
      // Load the TDLib library
      _lib = DynamicLibrary.open('libtdjson.so');

      _createClient =
          _lib.lookupFunction<TdJsonClientCreateNative, TdJsonClientCreate>(
              'td_json_client_create');
      _send = _lib.lookupFunction<TdJsonClientSendNative, TdJsonClientSend>(
          'td_json_client_send');
      _receive =
          _lib.lookupFunction<TdJsonClientReceiveNative, TdJsonClientReceive>(
              'td_json_client_receive');
      _destroy =
          _lib.lookupFunction<TdJsonClientDestroyNative, TdJsonClientDestroy>(
              'td_json_client_destroy');

      // Create TDLib client
      _client = _createClient();
      _isInitialized = true;
      _isRunning = true;

      // Notify main thread that we're ready
      _mainSendPort.send(const IsolateResponse(type: IsolateMessageType.ready));

      // Start the receiver loop
      _startReceiverLoop();
    } catch (e) {
      _mainSendPort.send(IsolateResponse(
        type: IsolateMessageType.error,
        error: 'Failed to initialize TDLib: $e',
      ));
    }
  }

  void _sendRequest(Map<String, dynamic> request, String? extra) {
    if (!_isInitialized || _client == null) return;

    // Add @extra if provided for request tracking
    if (extra != null) {
      request['@extra'] = extra;
    }

    final jsonString = jsonEncode(request);
    final nativeString = jsonString.toNativeUtf8();
    _send(_client!, nativeString);
    malloc.free(nativeString);
  }

  void _startReceiverLoop() {
    Future.doWhile(() async {
      if (!_isRunning) return false;

      // Small delay to prevent busy-waiting
      await Future.delayed(const Duration(milliseconds: 10));

      try {
        // Receive with 0.0 timeout (non-blocking)
        final responsePtr = _receive(_client!, 0.0);

        if (responsePtr.address != 0) {
          final jsonString = responsePtr.toDartString();

          // Decode JSON in the isolate (OFF main thread!)
          // This is the key performance win - jsonDecode is CPU-intensive
          final Map<String, dynamic> jsonMap = jsonDecode(jsonString);

          // Create typed object using factory
          final type = jsonMap['@type'] as String?;
          final TdObject? tdObject =
              type != null ? TdObjectFactory.create(type, jsonMap) : null;

          // Send both typed object and raw data to main thread
          _mainSendPort.send(IsolateResponse(
            type: IsolateMessageType.event,
            object: tdObject,
            rawData: jsonMap,
            extra: jsonMap['@extra'] as String?,
          ));
        }
      } catch (e) {
        _mainSendPort.send(IsolateResponse(
          type: IsolateMessageType.error,
          error: 'Error in receiver loop: $e',
        ));
      }

      return _isRunning;
    });
  }

  void _shutdown() {
    _isRunning = false;
    if (_client != null) {
      _destroy(_client!);
      _client = null;
    }
    _receivePort.close();
  }
}
