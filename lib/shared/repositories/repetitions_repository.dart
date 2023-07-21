import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:memoroutines/shared/models/repetition.dart';
import 'package:memoroutines/shared/models/routine.dart';
import 'package:memoroutines/shared/repositories/base_repository.dart';

class RepetitionsRepository extends BaseRepository<Repetition> {
  RepetitionsRepository(ProviderRef ref) : super(ref, 'repetitions_repo');

  Future<void> generateRepetitions(Routine routine) async {
    var date = DateTime.now();
    for (var i = 0; i < 30; i++) {
      if (_shouldCreateRepetition(routine, date)) {
        var completion = Repetition(
          dateToBeCompleted: date,
          status: RepetitionStatus.upcoming,
        );
        routine.repetitions.add(completion);
      }
      date = date.add(const Duration(days: 1));
    }
  }

  bool _shouldCreateRepetition(Routine routine, DateTime date) {
    switch (routine.frequency) {
      case RoutineFrequency.daily:
        return true;
      // case RoutineFrequency.dayAfterDay:
      //   return date.difference(routine.metaData.lastDoneAt ?? date).inDays >= 1;
      case RoutineFrequency.weekly:
        return routine.metaData.daysOfWeek.contains(date.weekday);
      case RoutineFrequency.monthly:
        return routine.metaData.daysOfMonth.contains(date.day);
      // case RoutineFrequency.yearly:
      //   return routine.metaData.yearlyRoutineDate?.day == date.day &&
      //       routine.metaData.yearlyRoutineDate?.month == date.month;
      default:
        return false;
    }
  }

  Future<void> complete(Repetition completion) async {
    final db = await isar;
    await db.writeTxn(() async {
      completion.status = RepetitionStatus.completed;
      completion.actionedAt = DateTime.now();
      await db.repetitions.put(completion);
    });
  }

  Future<void> miss(Repetition completion) async {
    final db = await isar;
    await db.writeTxn(() async {
      completion.status = RepetitionStatus.missed;
      completion.actionedAt = DateTime.now();
      await db.repetitions.put(completion);
    });
  }

  Future<List<Repetition>> getRepetitionsForRoutine(Id routineId) async {
    final db = await isar;
    return db.repetitions
        .where()
        .filter()
        .routine((routine) => routine.idEqualTo(routineId))
        .findAll();
  }

  Future<void> removeUpcomingRepetitionsForRoutine(Id routineId) async {
    final db = await isar;
    await db.writeTxn(() async {
      final repetitions = await getRepetitionsForRoutine(routineId);
      for (var completion in repetitions) {
        if (completion.dateToBeCompleted.isAfter(DateTime.now()) &&
            completion.status == RepetitionStatus.upcoming) {
          await db.repetitions.delete(completion.id);
        }
      }
    });
  }
}

final completionsPod = Provider((ref) => RepetitionsRepository(ref));
