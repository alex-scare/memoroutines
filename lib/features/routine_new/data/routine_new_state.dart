import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:memoroutines/shared/models/routine.dart';
import 'package:memoroutines/shared/models/weekday.dart';

part 'routine_new_state.freezed.dart';

@freezed
class RoutineNewState with _$RoutineNewState {
  const factory RoutineNewState({
    // form state
    @Default('') String name,
    @Default('') String description,
    @Default(RoutineFrequency.daily) RoutineFrequency frequency,
    @Default(false) bool isFlexible,
    @Default(30) int repetitionsToComplete,
    @Default(30) int singleRepetititionDuration,
    @Default([]) List<Weekday> daysOfWeek,
    @Default([]) List<int> daysOfMonth,
    @Default(1) int repetitionsPerPeriod,
    @Default(null) IconData? icon,
    // form helpers
    @Default(7) int iconIndex,
  }) = _RoutineNewState;
}

extension RoutineNewStateExt on RoutineNewState {
  // formatters

  LengthLimitingTextInputFormatter _lengthFormatter(int length) =>
      LengthLimitingTextInputFormatter(length);

  List<TextInputFormatter> get nameFormatters => [_lengthFormatter(30)];
  List<TextInputFormatter> get descriptionFormatters => [_lengthFormatter(50)];

  // validations

  bool get isNameValid => name.isNotEmpty;
  bool get isDescriptionValid => true;

  // data transformation getters

  Set<RoutineFrequency> get frequencySet {
    return {frequency};
  }

  Set<Weekday> get daysOfWeekSet {
    return Set.from(daysOfWeek.isEmpty ? [Weekday.fromNow()] : daysOfWeek);
  }

  Set<int> get daysOfMonthSet {
    return Set.from(daysOfMonth.isEmpty ? [DateTime.now().day] : daysOfMonth);
  }

  Routine get currentRoutine {
    return Routine(
      name: name,
      description: description,
      singleRepetitionDuration: singleRepetititionDuration,
      repetitionsNumberToComplete: repetitionsToComplete,
      frequency: frequency,
      iconData: icon,
    )..metaData = RoutineMetaData(
        isFlexible: isFlexible,
        daysOfMonth: daysOfMonth,
        daysOfWeek: daysOfWeek,
        repetitionsPerFrequencyPeriod: repetitionsPerPeriod,
      );
  }
}
