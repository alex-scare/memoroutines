import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:memoroutines/services/file_system/file_system_service.dart';
import 'package:memoroutines/services/logger/dev_logger.dart';
import 'package:memoroutines/shared/models/completion.dart';
import 'package:memoroutines/shared/models/profile.dart';
import 'package:memoroutines/shared/models/routine.dart';

final _log = DevLogger('isar');

const List<CollectionSchema> _isarSchemas = [
  RoutineSchema,
  CompletionSchema,
  ProfileSchema,
];

final FutureProvider<Isar> isarPod = FutureProvider((ref) async {
  final dir = await FileSystemService.getDocumentsDirectory();
  final isar = await Isar.open(_isarSchemas, directory: dir.path);

  _log.info('service started');
  return isar;
});
