import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';

import 'package:memoroutines/services/i18n/locale_key.g.dart';
import 'package:memoroutines/shared/helpers/routine_icon.dart';
import 'package:memoroutines/shared/models/repetition.dart';
import 'package:memoroutines/shared/models/weekday.dart';

part 'routine.g.dart';

@Collection()
class Routine {
  Id id = Isar.autoIncrement;
  String name;
  String description;
  @Enumerated(EnumType.name)
  RoutineIcon icon;
  @Enumerated(EnumType.name)
  RoutineStatus status;
  @Enumerated(EnumType.name)
  RoutineFrequency frequency;
  bool notifications;
  int repetitionsNumberToComplete; // Number of repetitions to mark the routine as completed
  int singleRepetitionDuration; // Number of repetitions to mark the routine as completed
  RoutineMetaData metaData;
  RoutineStats stats;

  final repetitions = IsarLinks<Repetition>();

  Routine({
    required this.name,
    required this.description,
    required this.icon,
    this.status = RoutineStatus.active,
    this.frequency = RoutineFrequency.daily,
    this.repetitionsNumberToComplete = 30,
    this.singleRepetitionDuration = 30,
    this.notifications = false,
  })  : metaData = RoutineMetaData(),
        stats = RoutineStats();

  @override
  String toString() {
    return 'Routine(id: $id, name: $name, description: $description, notifications: $notifications, repetitionsNumberToComplete: $repetitionsNumberToComplete, singleRepetitionDuration: $singleRepetitionDuration)';
  }

  void addRepetitions(List<Repetition> repetitions) {
    this.repetitions.addAll(repetitions);
  }
}

extension RoutineExt on Routine {
  String singleRepetitionDurationString(BuildContext context) {
    final value = singleRepetitionDuration;

    return switch (singleRepetitionDuration) {
      < 60 => context.plural(LocaleKey.durationsMinute, value),
      <= 60 * 24 => context.plural(LocaleKey.durationsHour, value ~/ 60),
      _ => ''
    };
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
  List<int> _daysOfWeek;
  List<int> daysOfMonth;

  RoutineMetaData({
    this.isFlexible = false,
    this.repetitionsPerFrequencyPeriod = 1,
    List<Weekday> daysOfWeek = const [],
    this.daysOfMonth = const [],
  })  : createdAt = DateTime.now(),
        updatedAt = DateTime.now(),
        _daysOfWeek = daysOfWeek.map((e) => e.number).toList();

  @ignore
  List<Weekday> get daysOfWeek {
    return _daysOfWeek.map((day) => Weekday.values[day]).toList();
  }

  set daysOfWeek(List<Weekday> daysOfWeek) {
    _daysOfWeek = daysOfWeek.map((e) => e.number).toList();
  }
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

// TODO this realization looks not really cool. Try to implement this another way
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
