import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:memoroutines/shared/models/routine.dart';
import 'package:memoroutines/shared/repositories/base_repository.dart';
import 'package:memoroutines/shared/repositories/repetitions_repository.dart';

class RoutinesRepository extends BaseRepository<Routine> {
  RoutinesRepository(ProviderRef ref) : super(ref, 'routines_repo');

  // TODO Refactor this logic
  Future<void> createRoutineAndGenerateCompletions(Routine routine) async {
    final db = await isar;
    db.writeTxnSync(() {
      log.info('Creating routine: $routine');
      final repetitionsToCreate =
          ref.read(repetitionsPod).generateRepetitions(routine);
      routine.addRepetitions(repetitionsToCreate.toList());
      db.routines.putSync(routine);
      log.info(
        'Routine repetitions: ${routine.repetitions.map((e) => e.dateToBeCompleted)}',
      );
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
            .read(repetitionsPod)
            .deleteUpcomingRepetitionsForRoutine(routineId);
      }
    });
  }

  Future<void> deleteWithRepetitions(Id routineId) async {
    final db = await isar;
    await db.writeTxn(() async {
      final routine = await db.routines.get(routineId);

      if (routine == null) {
        log.error('Failed to find routine with id: $routineId');
        return;
      }

      await ref.read(repetitionsPod).deleteAllRepetitionsForRoutine(routineId);
      await db.routines.delete(routineId);
    });
  }
}

final routinesPod = Provider((ref) => RoutinesRepository(ref));
