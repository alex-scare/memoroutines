import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:memoroutines/services/file_system/file_system_service.dart';

class AppLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}

class DevLogger {
  static final Future<Logger> _loggerFuture = _initLogger();
  final String group;

  DevLogger(this.group);

  static const String logfilePath = '/logs.txt';

  static Future<File> getFile() async {
    final dir = await FileSystemService.getDocumentsDirectory();
    final file = File('${dir.path}$logfilePath');
    if (!file.existsSync()) {
      file.createSync();
    }
    if (file.readAsLinesSync().length > 3000) {
      file.writeAsStringSync('');
    }
    return file;
  }

  static void _logFilePath(File file) {
    String link = 'file://${file.absolute.path}';
    String message = 'Logs file path (click to open file): $link';
    debugPrint(message);
  }

  static Future<Logger> _initLogger() async {
    final file = await getFile();
    _logFilePath(file);
    return Logger(
      printer: PrettyPrinter(
        colors: false,
        printTime: false,
        noBoxingByDefault: true,
        printEmojis: true,
      ),
      filter: AppLogFilter(),
      output: MultiOutput(
        [
          FileOutput(file: file),
          kDebugMode ? ConsoleOutput() : null,
        ],
      ),
    );
  }

  static Future clearLogsFile() async {
    final file = await getFile();
    file.writeAsStringSync('');
  }

  String get _groupName {
    return group.length > 15 ? group : group.padRight(15, '.');
  }

  String _createMessage(String message) {
    final date = DateTime.now().toIso8601String();

    return '$date $_groupName $message';
  }

  Future<void> empty({lines = 1}) async {
    final logger = await _loggerFuture;
    final message = '\n' * lines;
    logger.i(message, null, StackTrace.empty);
  }

  Future<void> infoWithDelimiters(String message) async {
    final logger = await _loggerFuture;

    final date = DateTime.now().toIso8601String();
    final suffix = '-' * 10;
    final messageString = '$suffix$message$suffix'.padRight(70, '-');

    logger.i('$date $_groupName $messageString', null, StackTrace.empty);
  }

  Future<void> debug(String message) async {
    if (kDebugMode == false) return;

    final logger = await _loggerFuture;
    logger.d(_createMessage(message), null, StackTrace.empty);
  }

  Future<void> info(String message) async {
    final logger = await _loggerFuture;
    logger.i(_createMessage(message), null, StackTrace.empty);
  }

  Future<void> warning(
    String message, [
    dynamic error,
    StackTrace stack = StackTrace.empty,
  ]) async =>
      (await _loggerFuture).w(_createMessage(message), error, stack);

  Future<void> error(
    String message, [
    dynamic error,
    StackTrace stack = StackTrace.empty,
  ]) async =>
      (await _loggerFuture).e(_createMessage(message), error, stack);

  Future<void> wtf(
    String message, [
    dynamic error,
    StackTrace stack = StackTrace.empty,
  ]) async =>
      (await _loggerFuture).wtf(_createMessage(message), error, stack);
}
