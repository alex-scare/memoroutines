import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_routine_state.freezed.dart';

@freezed
class EditRoutineState with _$EditRoutineState {
  const factory EditRoutineState({
    // form state
    @Default('') String name,
    @Default('') String description,
    // loaders
    @Default(false) bool submitLoading,
  }) = _EditRoutineState;
}

extension EditRoutineStateExt on EditRoutineState {
  String? nameValidator(String? value) {
    if (value!.isEmpty) {
      return 'invalid!';
    }
    return null;
  }

  List<TextInputFormatter> get nameFormatters {
    return [LengthLimitingTextInputFormatter(50)];
  }
}
