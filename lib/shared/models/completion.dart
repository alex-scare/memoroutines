import 'package:isar/isar.dart';
import 'package:memoroutines/shared/models/routine.dart';

part 'completion.g.dart';

enum CompletionStatus {
  completed, // The routine was completed
  missed, // The routine was not completed and is now overdue
  upcoming, // The routine is due to be completed in the future
  skipped, // The routine was skipped
}

@Collection()
class Completion {
  Id id = Isar.autoIncrement;
  DateTime dateToBeCompleted;
  DateTime? actionedAt;
  @Enumerated(EnumType.name)
  CompletionStatus status;

  @Backlink(to: 'completions')
  final routine = IsarLink<Routine>();

  Completion({
    required this.dateToBeCompleted,
    this.actionedAt,
    this.status = CompletionStatus.upcoming,
  });

  Completion.now()
      : dateToBeCompleted = DateTime.now(),
        status = CompletionStatus.upcoming;
}
