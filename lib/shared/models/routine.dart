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
  @Enumerated(EnumType.name)
  RoutineFrequency frequency;
  bool isFlexible;
  int timesPerPeriod; // Number of times the routine should be performed in a time period (determined by frequency)
  bool notifications;
  int repetitionsNumberToComplete; // Number of repetitions to mark the routine as completed
  int singleRepetitionDuration; // Number of repetitions to mark the routine as completed
  RoutineMetaData metaData;
  RoutineStats stats;

  final completions = IsarLinks<Completion>();

  Routine({
    required this.name,
    required this.description,
    this.status = RoutineStatus.active,
    this.frequency = RoutineFrequency.daily,
    this.repetitionsNumberToComplete = 30,
    this.singleRepetitionDuration = 30,
    this.timesPerPeriod = 1,
    this.isFlexible = false,
    this.notifications = false,
  })  : metaData = RoutineMetaData(),
        stats = RoutineStats();
}

enum RoutineStatus {
  active,
  paused,
  completed,
  archived,
  ;

  bool get needRemoveUpcomingCompletions =>
      this == RoutineStatus.completed ||
      this == RoutineStatus.archived ||
      this == RoutineStatus.paused;
}

enum RoutineFrequency {
  daily,
  dayAfterDay,
  weekly,
  monthly,
  yearly,
  ;
}

@Embedded()
class RoutineMetaData {
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? lastDoneAt;

  /// List of days the routine occurs on, for weekly routines
  List<int> daysOfWeek;

  /// The day of the month the routine occurs on, for monthly routines
  int? dayOfMonth;

  /// The day of the year the routine occurs on, for yearly routines
  DateTime? yearlyRoutineDate;

  RoutineMetaData()
      : createdAt = DateTime.now(),
        updatedAt = DateTime.now(),
        daysOfWeek = [];
}

@Embedded()
class RoutineStats {
  int timesCompleted;
  int timesMissed;
  int longestStreak;
  int currentStreak;

  RoutineStats({
    this.timesCompleted = 0,
    this.timesMissed = 0,
    this.longestStreak = 0,
    this.currentStreak = 0,
  });
}
