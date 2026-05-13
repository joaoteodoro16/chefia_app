import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AppLogger {
  AppLogger._();

  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 120,
      colors: true,
      printEmojis: true,
    ),
  );

  /// Debug
  static void d(
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (kDebugMode) {
      _logger.d(
        message,
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  /// Info
  static void i(String message) {
    _logger.i(message);
  }

  /// Warning
  static void w(
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.w(
      message,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Error
  static Future<void> e(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    bool sendToCrashlytics = true,
  }) async {
    _logger.e(
      message,
      error: error,
      stackTrace: stackTrace,
    );

    if (sendToCrashlytics) {
      await FirebaseCrashlytics.instance.recordError(
        error ?? message,
        stackTrace,
        reason: message,
      );
    }
  }

  /// Fatal
  static Future<void> fatal(
    String message, {
    required Object error,
    StackTrace? stackTrace,
  }) async {
    _logger.f(
      message,
      error: error,
      stackTrace: stackTrace,
    );

    await FirebaseCrashlytics.instance.recordError(
      error,
      stackTrace,
      reason: message,
      fatal: true,
    );
  }
}
