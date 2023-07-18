import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:memoroutines/features/routine_new/data/routine_new_state.dart';
import 'package:memoroutines/shared/models/routine.dart';
import 'package:memoroutines/shared/repositories/routines_repository.dart';

final routineNewPod = StateNotifierProvider.family
    .autoDispose<RoutineNewStateNotifier, RoutineNewState, Id?>(
  (ref, routineId) => RoutineNewStateNotifier(ref, routineId),
);

class RoutineNewStateNotifier extends StateNotifier<RoutineNewState> {
  static const _pageLimit = 3;
  final pageController = PageController(initialPage: 0);

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
    state = state.copyWith(frequency: frequency.first);
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

  void nextFormPage() {
    if (state.page == _pageLimit) return;
    pageController.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.bounceInOut,
    );
    state = state.copyWith(page: state.page + 1);
  }

  void prevFormPage() {
    if (state.page == 0) return;
    state = state.copyWith(page: state.page - 1);
  }
}
