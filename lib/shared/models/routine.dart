// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  int completionRepetitionCount;
  int singleRepetitionDuration;
  RoutineMetaData metaData;
  RoutineStats stats;

  final repetitions = IsarLinks<Repetition>();

  Routine({
    required this.name,
    required this.description,
    required this.icon,
    this.status = RoutineStatus.active,
    this.frequency = RoutineFrequency.daily,
    this.completionRepetitionCount = 30,
    this.singleRepetitionDuration = 30,
  })  : metaData = RoutineMetaData(),
        stats = RoutineStats();

  void addRepetitions(List<Repetition> repetitions) {
    this.repetitions.addAll(repetitions);
  }

  // method used in logs!
  @override
  String toString() => 'Routine(id: $id, name: $name)';
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
  weekly,
  monthly,
  ;

  String get label {
    return switch (this) {
      RoutineFrequency.daily => LocaleKey.modelsRoutineFrequencyDaily,
      RoutineFrequency.weekly => LocaleKey.modelsRoutineFrequencyWeekly,
      RoutineFrequency.monthly => LocaleKey.modelsRoutineFrequencyMonthly,
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
  int flexibleRepetitionCount;
  List<int> _scheduledDaysOfWeek;
  List<int> scheduledDaysOfMonth;

  RoutineMetaData({
    this.isFlexible = false,
    this.flexibleRepetitionCount = 1,
    List<Weekday> scheduledDaysOfWeek = const [],
    this.scheduledDaysOfMonth = const [],
  })  : createdAt = DateTime.now(),
        updatedAt = DateTime.now(),
        _scheduledDaysOfWeek =
            scheduledDaysOfWeek.map((e) => e.number).toList();

  @ignore
  List<Weekday> get daysOfWeek {
    return _scheduledDaysOfWeek.map((day) => Weekday.values[day]).toList();
  }

  set daysOfWeek(List<Weekday> daysOfWeek) {
    _scheduledDaysOfWeek = daysOfWeek.map((e) => e.number).toList();
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
