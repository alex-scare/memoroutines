import 'package:isar/isar.dart';
import 'package:memoroutines/shared/models/routine.dart';

part 'repetition.g.dart';

@Collection()
class Repetition {
  Id id = Isar.autoIncrement;
  @Index()
  DateTime scheduledCompletionDate;
  DateTime? performedAt;
  int? deviationFromPlannedDuration; // In minutes
  @Enumerated(EnumType.name)
  RepetitionStatus status;

  @Backlink(to: 'repetitions')
  final routine = IsarLink<Routine>();

  Repetition({
    required this.scheduledCompletionDate,
    this.performedAt,
    this.status = RepetitionStatus.upcoming,
  });

  Repetition.now()
      : scheduledCompletionDate = DateTime.now(),
        status = RepetitionStatus.upcoming;

  void addRoutine(Routine routine) {
    this.routine.value = routine;
  }
}

enum RepetitionStatus {
  /// The repetition was completed
  completed,

  /// The repetition was not completed and is now overdue
  missed,

  /// The repetition is due to be completed in the future
  upcoming,

  /// The repetition was skipped by user (it differ from missed because it was not due to be completed)
  skipped,
}
