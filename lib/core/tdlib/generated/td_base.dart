// AUTO-GENERATED FILE - DO NOT MODIFY
// Generated from td_api.tl on 2026-01-01

/// Base class for all TDLib objects.
abstract class TdObject {
  /// The TDLib type string (e.g., "user", "message")
  String get tdType;

  /// Convert this object to a Map for JSON serialization.
  Map<String, dynamic> toMap();
}
