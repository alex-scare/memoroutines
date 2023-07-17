import 'dart:io';

import 'package:flutter/services.dart';
import 'package:memoroutines/services/logger/dev_logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class FileSystemService {
  static final _log = DevLogger('FileSystemService');

  static Directory? _appSupportDirectory;
  static Directory? _appDocumentsDirectory;

  static Future<Directory> getSupportDirectory() async {
    return _appSupportDirectory ??= await getApplicationSupportDirectory();
  }

  static Future<Directory> getDocumentsDirectory() async {
    return _appDocumentsDirectory ??= await getApplicationDocumentsDirectory();
  }

  static Future<void> shareFile(File file) async {
    try {
      final String fileName = file.path.split('/').last;

      ShareResult shareResult;
      final files = <XFile>[];
      files.add(XFile(file.path, name: fileName));

      shareResult = await Share.shareXFiles(files);
      if (shareResult.status == ShareResultStatus.unavailable) {
        _log.error(
          'download error: file not found $fileName',
          null,
          StackTrace.current,
        );
      }
    } on PlatformException catch (e, stack) {
      _log.error('platform error: file download error', e, stack);
    }
  }
}
