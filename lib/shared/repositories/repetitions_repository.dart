import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:memoroutines/shared/extensions/date_time.dart';
import 'package:memoroutines/shared/extensions/duration.dart';
import 'package:memoroutines/shared/models/repetition.dart';
import 'package:memoroutines/shared/models/routine.dart';
import 'package:memoroutines/shared/models/weekday.dart';
import 'package:memoroutines/shared/repositories/base_repository.dart';

class RepetitionsRepository extends BaseRepository<Repetition> {
  RepetitionsRepository(ProviderRef ref) : super(ref, 'repetitions_repo');

  List<Repetition> generateRepetitions(Routine routine) {
    final List<Repetition> result = [];
    var count = routine.completionRepetitionCount;

    if (!routine.metaData.isFlexible) {
      result.addAll(_generateFixedRepetitions(routine, count, DateTime.now()));
    }

    log.info('repetitions to create: ${result.length}.');

    return result;
  }

  List<Repetition> _generateFixedRepetitions(
    Routine routine,
    int count,
    DateTime fromDate,
  ) {
    final List<Repetition> result = [];
    var date = fromDate.clearTime();

    for (var i = 0; i < count; i++) {
      final shouldCreate = _shouldCreateFixedRepetition(routine, date);

      if (shouldCreate) {
        var completion = Repetition(scheduledCompletionDate: date);
        result.add(completion);
      }

      date = date.add(1.days);
    }

    return result;
  }

  bool _shouldCreateFixedRepetition(Routine routine, DateTime date) {
    final metaData = routine.metaData;
    final daysOfMonth = metaData.scheduledDaysOfMonth;
    final weekday = Weekday.fromDateTime(date);

    return switch (routine.frequency) {
      RoutineFrequency.daily => true,
      RoutineFrequency.weekly => metaData.daysOfWeek.contains(weekday),
      RoutineFrequency.monthly => daysOfMonth.contains(date.day),
    };
  }

  Future<void> toggleCompletion(Repetition repetition) async {
    final db = await isar;
    await db.writeTxn(() async {
      repetition.performedAt = DateTime.now();
      repetition.status = switch (repetition.status) {
        RepetitionStatus.completed => RepetitionStatus.upcoming,
        RepetitionStatus.upcoming => RepetitionStatus.completed,
        RepetitionStatus.missed => RepetitionStatus.completed,
        RepetitionStatus.skipped => RepetitionStatus.completed,
      };
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
        if (completion.scheduledCompletionDate.isAfter(DateTime.now()) &&
            completion.status == RepetitionStatus.upcoming) {
          await db.repetitions.delete(completion.id);
        }
      }
    });
  }

  Future<void> deleteAllRepetitionsForRoutine(Id routineId) async {
    final db = await isar;
    final repetitions = await getRepetitionsForRoutine(routineId);

    db.repetitions.deleteAll(repetitions.map((routine) => routine.id).toList());
  }

  Future<List<Repetition>> getRepetitionsForDate(DateTime date) async {
    final onlyDate = DateTime(date.year, date.month, date.day);

    final db = await isar;
    return db.repetitions
        .where()
        .filter()
        .scheduledCompletionDateEqualTo(onlyDate)
        .findAll();
  }

  Stream<List<Repetition>> listenRepetitionsForDate(DateTime date) async* {
    final onlyDate = DateTime(date.year, date.month, date.day);

    final db = await isar;
    yield* db.repetitions
        .where()
        .filter()
        .scheduledCompletionDateEqualTo(onlyDate)
        .watch(fireImmediately: true);
  }
}

final repetitionsPod = Provider((ref) => RepetitionsRepository(ref));
