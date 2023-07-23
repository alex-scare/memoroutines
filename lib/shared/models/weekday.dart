import 'package:memoroutines/services/i18n/locale_key.g.dart';

enum Weekday {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
  ;

  int get number {
    return switch (this) {
      monday => 1,
      tuesday => 2,
      wednesday => 3,
      thursday => 4,
      friday => 5,
      saturday => 6,
      sunday => 7,
    };
  }

  String get shortName {
    return switch (this) {
      monday => LocaleKey.durationNamesWeekDayMondayShort,
      tuesday => LocaleKey.durationNamesWeekDayTuesdayShort,
      wednesday => LocaleKey.durationNamesWeekDayWednesdayShort,
      thursday => LocaleKey.durationNamesWeekDayThursdayShort,
      friday => LocaleKey.durationNamesWeekDayFridayShort,
      saturday => LocaleKey.durationNamesWeekDaySaturdayShort,
      sunday => LocaleKey.durationNamesWeekDaySundayShort,
    };
  }

  static Weekday fromDateTime(DateTime date) {
    return switch (date.weekday) {
      1 => monday,
      2 => tuesday,
      3 => wednesday,
      4 => thursday,
      5 => friday,
      6 => saturday,
      7 => sunday,
      _ => sunday,
    };
  }

  static Weekday fromNow() {
    return fromDateTime(DateTime.now());
  }
}
