import 'package:isar/isar.dart';
import 'package:memoroutines/shared/models/completion.dart';

part 'routine.g.dart';

@Collection()
class Routine {
  Id id = Isar.autoIncrement;
  String name;
  String description;
  @Enumerated(EnumType.name)
  RoutineStatus status;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? lastDoneAt;
  @Enumerated(EnumType.name)
  RoutineFrequency frequency;
  List<int> daysOfWeek;
  int? dayOfMonth;
  int? dayOfYear;
  bool isFlexible;

  final completions = IsarLinks<Completion>();

  /// number of repetitions to mark routine completed
  int repetitionsGoal;

  /// measured in minutes
  int singleRepetitionDuration;

  Routine({
    required this.name,
    required this.description,
    this.status = RoutineStatus.active,
    this.frequency = RoutineFrequency.daily,
    this.repetitionsGoal = 30,
    this.singleRepetitionDuration = 30,
    this.daysOfWeek = const [],
    this.dayOfMonth,
    this.dayOfYear,
    this.isFlexible = false,
  }) {
    createdAt = DateTime.now();
    updatedAt = DateTime.now();
    lastDoneAt = null;
  }
}

enum RoutineStatus {
  active,
  paused,
  completed,
  archived,
  ;
}

enum RoutineFrequency {
  daily,
  dayAfterDay,
  weekly,
  monthly,
  yearly,
  ;
}
