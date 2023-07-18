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
  // dayAfterDay,
  weekly,
  monthly,
  // yearly,
  ;

  String get label {
    return switch (this) {
      RoutineFrequency.daily => 'daily',
      RoutineFrequency.weekly => 'weekly',
      RoutineFrequency.monthly => 'monthly',
      // RoutineFrequency.yearly => 'yearly',
      // RoutineFrequency.dayAfterDay => 'dayAfterDay',
    };
  }
}

@Embedded()
class RoutineMetaData {
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? lastDoneAt;
  bool isFlexible;

  /// Number of times the routine should be performed in a time period (determined by frequency)
  int repetitionsPerFrequencyPeriod;
  List<int> daysOfWeek;
  List<int> daysOfMonth;

  RoutineMetaData()
      : createdAt = DateTime.now(),
        updatedAt = DateTime.now(),
        isFlexible = false,
        repetitionsPerFrequencyPeriod = 1,
        daysOfWeek = [],
        daysOfMonth = [];
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
