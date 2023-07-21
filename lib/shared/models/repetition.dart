import 'package:isar/isar.dart';
import 'package:memoroutines/shared/models/routine.dart';

part 'repetition.g.dart';

enum RepetitionStatus {
  completed, // The routine was completed
  missed, // The routine was not completed and is now overdue
  upcoming, // The routine is due to be completed in the future
  skipped, // The routine was skipped
}

@Collection()
class Repetition {
  Id id = Isar.autoIncrement;
  DateTime dateToBeCompleted;
  DateTime? actionedAt;
  @Enumerated(EnumType.name)
  RepetitionStatus status;

  @Backlink(to: 'repetitions')
  final routine = IsarLink<Routine>();

  Repetition({
    required this.dateToBeCompleted,
    this.actionedAt,
    this.status = RepetitionStatus.upcoming,
  });

  Repetition.now()
      : dateToBeCompleted = DateTime.now(),
        status = RepetitionStatus.upcoming;
}
