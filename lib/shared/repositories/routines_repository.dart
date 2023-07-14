import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:memoroutines/shared/models/routine.dart';

import '../../services/logger/dev_logger.dart';
import '../models/completion.dart';
import 'base_repository.dart';

class RoutinesRepository extends BaseRepository<Routine> {
  static final _log = DevLogger('routines_repo');
  RoutinesRepository(ProviderRef ref) : super(ref);

  // Returns a stream of a routine by its id
  Stream<Routine> listenById(Id id) async* {
    final db = await isar;
    yield* db.routines.watchObject(id, fireImmediately: true).cast();
  }

  // Updates a routine
  Future<void> update(Routine routine) async {
    final db = await isar;
    await db.writeTxn(() async => await db.routines.put(routine));
  }

  // Generates completions for a routine for the next month
  Future<void> generateCompletions(Routine routine) async {
    final db = await isar;
    await db.writeTxn(() async {
      var date = DateTime.now();
      for (var i = 0; i < 30; i++) {
        var completion = Completion(
          dateToBeCompleted: date,
          status: CompletionStatus.upcoming,
        );
        routine.completions.add(completion);
        date = date.add(const Duration(days: 1));
      }
      await db.routines.put(routine);
    });
  }
}

final routinesPod = Provider((ref) => RoutinesRepository(ref));
