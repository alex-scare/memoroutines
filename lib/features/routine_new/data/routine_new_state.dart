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
    // helpers
    @Default(0) int page,
    @Default(7) int iconIndex,
    // loaders
    @Default(false) bool submitLoading,
  }) = _RoutineNewState;
}

extension RoutineNewStateExt on RoutineNewState {
  String? nameValidator(String? value) {
    if (value!.isEmpty) {
      return 'invalid!';
    }
    return null;
  }

  List<TextInputFormatter> get nameFormatters {
    return [LengthLimitingTextInputFormatter(50)];
  }

  Set<RoutineFrequency> get frequencySet {
    return {frequency};
  }

  Set<Weekday> get daysOfWeekSet {
    return Set.from(daysOfWeek.isEmpty ? [Weekday.fromNow()] : daysOfWeek);
  }

  Set<int> get daysOfMonthsSet {
    return Set.from(daysOfMonth.isEmpty ? [DateTime.now().day] : daysOfMonth);
  }
}
