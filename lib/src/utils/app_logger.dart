import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AppLogger {
  factory AppLogger() => _instance;

  AppLogger._internal() : _logger = Logger(output: _ConsoleOutput());

  static final AppLogger _instance = AppLogger._internal();

  final Logger _logger;

  void debug(dynamic message) {
    _logger.d(message);
  }

  void info(dynamic message) {
    _logger.i(message);
  }

  void warning(dynamic message) {
    _logger.w(message);
  }

  void error(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  void captureException(dynamic exception, [StackTrace? stackTrace]) {
    _logger.e(exception, stackTrace: stackTrace);
  }
}

class _ConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    if (kReleaseMode || !Platform.isIOS) {
      event.lines.forEach(debugPrint);
    } else {
      event.lines.forEach(developer.log);
    }
  }
}
