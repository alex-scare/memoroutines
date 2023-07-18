import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:memoroutines/shared/models/completion.dart';
import 'package:memoroutines/shared/models/routine.dart';
import 'package:memoroutines/shared/repositories/base_repository.dart';

class CompletionsRepository extends BaseRepository<Completion> {
  CompletionsRepository(ProviderRef ref) : super(ref, 'completions_repo');

  Future<void> generateCompletions(Routine routine) async {
    var date = DateTime.now();
    for (var i = 0; i < 30; i++) {
      if (_shouldCreateCompletion(routine, date)) {
        var completion = Completion(
          dateToBeCompleted: date,
          status: CompletionStatus.upcoming,
        );
        routine.completions.add(completion);
      }
      date = date.add(const Duration(days: 1));
    }
  }

  bool _shouldCreateCompletion(Routine routine, DateTime date) {
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

  Future<void> complete(Completion completion) async {
    final db = await isar;
    await db.writeTxn(() async {
      completion.status = CompletionStatus.completed;
      completion.actionedAt = DateTime.now();
      await db.completions.put(completion);
    });
  }

  Future<void> miss(Completion completion) async {
    final db = await isar;
    await db.writeTxn(() async {
      completion.status = CompletionStatus.missed;
      completion.actionedAt = DateTime.now();
      await db.completions.put(completion);
    });
  }

  Future<List<Completion>> getCompletionsOfRoutine(Id routineId) async {
    final db = await isar;
    return db.completions
        .where()
        .filter()
        .routine((routine) => routine.idEqualTo(routineId))
        .findAll();
  }

  Future<void> removeUpcomingCompletionsOfRoutine(Id routineId) async {
    final db = await isar;
    await db.writeTxn(() async {
      final completions = await getCompletionsOfRoutine(routineId);
      for (var completion in completions) {
        if (completion.dateToBeCompleted.isAfter(DateTime.now()) &&
            completion.status == CompletionStatus.upcoming) {
          await db.completions.delete(completion.id);
        }
      }
    });
  }
}

final completionsPod = Provider((ref) => CompletionsRepository(ref));
