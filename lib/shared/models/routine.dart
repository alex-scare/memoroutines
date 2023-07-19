import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:memoroutines/services/i18n/locale_key.g.dart';
import 'package:memoroutines/shared/models/completion.dart';

part 'routine.g.dart';

@Collection()
class Routine {
  Id id = Isar.autoIncrement;
  String name;
  String description;
  int? _iconCodePoint;
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

  @ignore
  IconData? get iconData {
    if (_iconCodePoint == null) return null;
    return IconData(_iconCodePoint!, fontFamily: 'MaterialIcons');
  }

  set iconData(IconData? value) {
    _iconCodePoint = value?.codePoint;
  }
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
      RoutineFrequency.daily => LocaleKey.modelsRoutineFrequencyDaily,
      RoutineFrequency.weekly => LocaleKey.modelsRoutineFrequencyWeekly,
      RoutineFrequency.monthly => LocaleKey.modelsRoutineFrequencyMonthly,
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

enum SingleRepetitionDuration {
  minute(1),
  twoMinutes(2),
  treeMinutes(3),
  fourMinutes(4),
  fiveMinutes(5),
  tenMinutes(10),
  fifteenMinutes(15),
  twentyMinutes(20),
  twentyFiveMinutes(25),
  thirtyMinutes(30),
  fourtyFiveMinutes(45),
  oneHour(60),
  twoHours(120),
  threeHours(180),
  fourHours(240),
  fiveHours(300),
  sixHours(360),
  sevenHours(420),
  eightHours(480),
  nineHours(540),
  tenHours(600),
  elevenHours(660),
  twelveHours(720),
  ;

  const SingleRepetitionDuration(this.minutes);

  final int minutes;

  static SingleRepetitionDuration durationFromMinutes(int minutes) {
    return values.firstWhere((element) => element.minutes == minutes);
  }

  int get indexInList => values.indexWhere((element) => element == this);
}
