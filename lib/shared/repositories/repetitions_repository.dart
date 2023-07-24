import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:memoroutines/shared/extensions/duration.dart';
import 'package:memoroutines/shared/models/repetition.dart';
import 'package:memoroutines/shared/models/routine.dart';
import 'package:memoroutines/shared/repositories/base_repository.dart';

class RepetitionsRepository extends BaseRepository<Repetition> {
  RepetitionsRepository(ProviderRef ref) : super(ref, 'repetitions_repo');

  List<Repetition> generateRepetitions(Routine routine) {
    final List<Repetition> repetitionsToCreate = [];
    var now = DateTime.now();
    var onlyDate = DateTime(now.year, now.month, now.day);
    for (var i = 0; i < 30; i++) {
      final shouldCreateRepetition = _shouldCreateRepetition(routine, onlyDate);
      if (shouldCreateRepetition) {
        var completion = Repetition(
          dateToBeCompleted: onlyDate,
          status: RepetitionStatus.upcoming,
        );
        repetitionsToCreate.add(completion);
      }
      onlyDate = onlyDate.add(1.days);
    }

    log.info(
      'repetitionsToCreate: ${repetitionsToCreate.length}. from ${repetitionsToCreate.first.dateToBeCompleted} to ${repetitionsToCreate.last.dateToBeCompleted}',
    );
    return repetitionsToCreate;
  }

  bool _shouldCreateRepetition(Routine routine, DateTime date) {
    switch (routine.frequency) {
      case RoutineFrequency.daily:
        return true;
      // case RoutineFrequency.dayAfterDay:
      //   return date.difference(routine.metaData.lastDoneAt ?? date).inDays >= 1;
      case RoutineFrequency.weekly:
        // TODO fix this logic (see warning below)
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

  Future<void> toggleCompletion(Repetition repetition) async {
    final db = await isar;
    await db.writeTxn(() async {
      repetition.status = switch (repetition.status) {
        RepetitionStatus.upcoming => RepetitionStatus.completed,
        RepetitionStatus.completed => RepetitionStatus.upcoming,
        RepetitionStatus.missed => RepetitionStatus.completed,
        RepetitionStatus.skipped => RepetitionStatus.completed,
      };
      repetition.actionedAt = DateTime.now();
      await db.repetitions.put(repetition);
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

  Future<void> deleteUpcomingRepetitionsForRoutine(Id routineId) async {
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

  Future<void> deleteAllRepetitionsForRoutine(Id routineId) async {
    final db = await isar;
    final repetitions = await getRepetitionsForRoutine(routineId);

    await db.repetitions
        .deleteAll(repetitions.map((routine) => routine.id).toList());
  }

  Future<List<Repetition>> getRepetitionsForDate(DateTime date) async {
    final onlyDate = DateTime(date.year, date.month, date.day);

    final db = await isar;
    return db.repetitions
        .where()
        .filter()
        .dateToBeCompletedEqualTo(onlyDate)
        .findAll();
  }

  Stream<List<Repetition>> listenRepetitionsForDate(DateTime date) async* {
    final onlyDate = DateTime(date.year, date.month, date.day);

    final db = await isar;
    yield* db.repetitions
        .where()
        .filter()
        .dateToBeCompletedEqualTo(onlyDate)
        .watch(fireImmediately: true);
  }
}

final repetitionsPod = Provider((ref) => RepetitionsRepository(ref));
