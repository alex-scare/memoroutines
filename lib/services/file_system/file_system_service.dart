import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../logger/dev_logger.dart';

class FileSystemService {
  static final _log = DevLogger('FileSystemService');

  static Directory? appSupportDirectory;
  static Directory? appDocumentsDirectory;

  static Future<Directory> getSupportDirectory() async {
    return appSupportDirectory ??= await getApplicationSupportDirectory();
  }

  static Future<Directory> getDocumentsDirectory() async {
    return appDocumentsDirectory ??= await getApplicationDocumentsDirectory();
  }

  static Future<void> shareFile(File file) async {
    try {
      final String fileName = file.path.split('/').last;

      ShareResult shareResult;
      final files = <XFile>[];
      files.add(XFile(file.path, name: fileName));

      shareResult = await Share.shareXFiles(files);
      if (shareResult.status == ShareResultStatus.unavailable) {
        _log.error('download error: file not found $fileName', null,
            StackTrace.current);
      }
    } on PlatformException catch (e, stack) {
      _log.error('Platform Error: File download error', e, stack);
    } catch (e, stack) {
      _log.wtf('Unknown error: File download error', e, stack);
    }
  }
}
