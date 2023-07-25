import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:memoroutines/shared/extensions/date_time.dart';
import 'package:memoroutines/shared/models/repetition.dart';
import 'package:memoroutines/shared/models/routine.dart';
import 'package:memoroutines/shared/repositories/base_repository.dart';
import 'package:memoroutines/shared/repositories/repetitions_repository.dart';

class RoutinesRepository extends BaseRepository<Routine> {
  RoutinesRepository(ProviderRef ref) : super(ref, 'routines_repo');

  Future<void> createRoutineAndGenerateCompletions(Routine routine) async {
    final db = await isar;
    try {
      db.writeTxnSync(() {
        log.info('Creating routine: $routine');
        final repetitionsToCreate =
            ref.read(repetitionsPod).generateRepetitions(routine);
        routine.addRepetitions(repetitionsToCreate.toList());
        db.routines.putSync(routine);

        final dates = routine.repetitions.map((e) => e.scheduledCompletionDate);
        log.info('Routine repetitions: $dates');
      });
    } catch (e, stack) {
      log.error('Failed to create routine', e, stack);
    }
  }

  Future<void> update(Routine routine) async {
    final db = await isar;

    try {
      db.writeTxnSync(() {
        routine.metaData.updatedAt = DateTime.now();
        db.routines.putSync(routine);
      });
    } catch (e, stack) {
      log.error('Failed to update routine: $routine with error', e, stack);
    }
  }

  Future<void> updateStatus(Id routineId, RoutineStatus status) async {
    final db = await isar;
    db.writeTxnSync(() async {
      final routine = db.routines.getSync(routineId);

      if (routine == null) {
        log.error('Failed to find routine with id: $routineId');
        return;
      }

      routine.status = status;
      db.routines.putSync(routine);

      if (!status.needRemoveUpcomingCompletions) return;

      await ref
          .read(repetitionsPod)
          .deleteUpcomingRepetitionsForRoutine(routineId);
    });
  }

  Future<void> deleteWithRepetitions(Id routineId) async {
    final db = await isar;
    try {
      await db.writeTxn(() async {
        final routine = await db.routines.get(routineId);

        if (routine == null) {
          log.error('Failed to find routine with id: $routineId');
          return;
        }

        await ref
            .read(repetitionsPod)
            .deleteAllRepetitionsForRoutine(routineId);
        await db.routines.delete(routineId);
      });
    } catch (e, stack) {
      log.error('Failed to delete routine with id: $routineId', e, stack);
    }
  }

  // TODO complete this logic
  Future<List<Repetition>> getRepetitionsForFlexibleRoutinesForDate(
    DateTime date,
  ) async {
    final db = await isar;
    final day = date.clearTime();

    final allFlexibleRoutines = await db.routines
        .where()
        .filter()
        .metaData((q) => q.isFlexibleEqualTo(true))
        .findAll();

    // Filter the flexible routines with completed repetitions count less than completionCount
    final incompleteFlexibleRoutines = <Routine>[];
    for (final routine in allFlexibleRoutines) {
      if (routine.stats.timesCompleted >= routine.completionRepetitionCount) {
        continue;
      }

      incompleteFlexibleRoutines.add(routine);
    }

    return incompleteFlexibleRoutines.map(
      (routine) {
        return Repetition(scheduledCompletionDate: day)..addRoutine(routine);
      },
    ).toList();
  }
}

final routinesPod = Provider((ref) => RoutinesRepository(ref));
