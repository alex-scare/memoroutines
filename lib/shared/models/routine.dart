import 'package:isar/isar.dart';

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
  @Enumerated(EnumType.name)
  RoutineFrequency frequency;
  int countToDone;
  int duration;
  List<int> daysOfWeek;
  int? dayOfMonth;
  int? dayOfYear;

  Routine({
    required this.name,
    required this.description,
    this.status = RoutineStatus.active,
    this.frequency = RoutineFrequency.daily,
    this.countToDone = 30,
    this.duration = 30,
    this.daysOfWeek = const [],
    this.dayOfMonth,
    this.dayOfYear,
  }) {
    createdAt = DateTime.now();
    updatedAt = DateTime.now();
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
