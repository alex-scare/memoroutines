import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:memoroutines/shared/models/routine.dart';

import 'base_repository.dart';
import 'completions_repository.dart';

class RoutinesRepository extends BaseRepository<Routine> {
  RoutinesRepository(ProviderRef ref) : super(ref, 'routines_repo');

  Future<void> createRoutineAndGenerateCompletions(Routine routine) async {
    final db = await isar;
    await db.writeTxn(() async {
      await db.routines.put(routine);
      await ref.read(completionsPod).generateCompletions(routine);
    });
  }

  Future<void> update(Routine routine) async {
    final db = await isar;
    await db.writeTxn(() async => await db.routines.put(routine));
  }

  Future<void> updateStatus(Id routineId, RoutineStatus status) async {
    final db = await isar;
    await db.writeTxn(() async {
      final routine = await db.routines.get(routineId);

      if (routine == null) {
        log.error('Failed to find routine with id: $routineId');
        return;
      }

      routine.status = status;
      await db.routines.put(routine);

      if (status.needRemoveUpcomingCompletions) {
        await ref
            .read(completionsPod)
            .removeUpcomingCompletionsOfRoutine(routineId);
      }
    });
  }
}

final routinesPod = Provider((ref) => RoutinesRepository(ref));
