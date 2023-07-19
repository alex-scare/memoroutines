import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:memoroutines/features/routine_new/data/routine_new_state.dart';
import 'package:memoroutines/shared/models/routine.dart';
import 'package:memoroutines/shared/models/weekday.dart';
import 'package:memoroutines/shared/repositories/routines_repository.dart';

final routineNewPod = StateNotifierProvider.family
    .autoDispose<RoutineNewStateNotifier, RoutineNewState, Id?>(
  (ref, routineId) => RoutineNewStateNotifier(ref, routineId),
);

class RoutineNewStateNotifier extends StateNotifier<RoutineNewState> {
  final Ref _ref;
  late Routine? routine;

  RoutineNewStateNotifier(this._ref, Id? routineId)
      : super(const RoutineNewState()) {
    _fetchRoutine(routineId);
  }

  Future<void> _fetchRoutine(Id? routineId) async {
    if (routineId == null) return;
    routine = await (_ref.read(routinesPod)).getById(routineId);
  }

  Future<void> submitRoutine() async {
    final routine = Routine(description: state.description, name: state.name);
    await _ref.read(routinesPod).createRoutineAndGenerateCompletions(routine);
  }

  void setName(String? value) {
    state = state.copyWith(name: value ?? '');
  }

  void setDescription(String? value) {
    state = state.copyWith(description: value ?? '');
  }

  void setFrequency(Set<RoutineFrequency> frequency) {
    state = state.copyWith(frequency: frequency.first, repetitionsPerPeriod: 1);
  }

  void toggleFlexible() {
    state = state.copyWith(isFlexible: !state.isFlexible);
  }

  void setRepetitionsPerPeriod(int value) {
    state = state.copyWith(repetitionsPerPeriod: value);
  }

  void setRepetitionsToComplete(int value) {
    state = state.copyWith(repetitionsToComplete: value);
  }

  void setSingleRepetitionDuration(int value) {
    state = state.copyWith(singleRepetititionDuration: value);
  }

  void setIcon(IconData icon, int index) {
    state = state.copyWith(icon: icon, iconIndex: index);
  }

  void setDaysOfWeek(Set<Weekday> days) {
    state = state.copyWith(daysOfWeek: days.toList());
  }

  void toggleDayOfMonth(int day) {
    final days = [...state.daysOfMonth];

    days.contains(day) ? days.remove(day) : days.add(day);

    state = state.copyWith(daysOfMonth: days);
  }
}
