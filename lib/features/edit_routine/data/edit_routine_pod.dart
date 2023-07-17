import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:memoroutines/features/edit_routine/data/edit_routine_state.dart';
import 'package:memoroutines/shared/models/routine.dart';
import 'package:memoroutines/shared/repositories/routines_repository.dart';

final editRoutinePod = StateNotifierProvider.family
    .autoDispose<EditRoutineStateNotifier, EditRoutineState, Id?>(
  (ref, routineId) => EditRoutineStateNotifier(ref, routineId),
);

class EditRoutineStateNotifier extends StateNotifier<EditRoutineState> {
  final Ref _ref;
  late Routine? routine;

  EditRoutineStateNotifier(this._ref, Id? routineId)
      : super(const EditRoutineState()) {
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
}
