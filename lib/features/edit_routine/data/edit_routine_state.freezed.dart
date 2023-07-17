// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_routine_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditRoutineState {
// form state
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError; // loaders
  bool get submitLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditRoutineStateCopyWith<EditRoutineState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditRoutineStateCopyWith<$Res> {
  factory $EditRoutineStateCopyWith(
          EditRoutineState value, $Res Function(EditRoutineState) then) =
      _$EditRoutineStateCopyWithImpl<$Res, EditRoutineState>;
  @useResult
  $Res call({String name, String description, bool submitLoading});
}

/// @nodoc
class _$EditRoutineStateCopyWithImpl<$Res, $Val extends EditRoutineState>
    implements $EditRoutineStateCopyWith<$Res> {
  _$EditRoutineStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? submitLoading = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      submitLoading: null == submitLoading
          ? _value.submitLoading
          : submitLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EditRoutineStateCopyWith<$Res>
    implements $EditRoutineStateCopyWith<$Res> {
  factory _$$_EditRoutineStateCopyWith(
          _$_EditRoutineState value, $Res Function(_$_EditRoutineState) then) =
      __$$_EditRoutineStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String description, bool submitLoading});
}

/// @nodoc
class __$$_EditRoutineStateCopyWithImpl<$Res>
    extends _$EditRoutineStateCopyWithImpl<$Res, _$_EditRoutineState>
    implements _$$_EditRoutineStateCopyWith<$Res> {
  __$$_EditRoutineStateCopyWithImpl(
      _$_EditRoutineState _value, $Res Function(_$_EditRoutineState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? submitLoading = null,
  }) {
    return _then(_$_EditRoutineState(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      submitLoading: null == submitLoading
          ? _value.submitLoading
          : submitLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_EditRoutineState implements _EditRoutineState {
  const _$_EditRoutineState(
      {this.name = '', this.description = '', this.submitLoading = false});

// form state
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String description;
// loaders
  @override
  @JsonKey()
  final bool submitLoading;

  @override
  String toString() {
    return 'EditRoutineState(name: $name, description: $description, submitLoading: $submitLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditRoutineState &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.submitLoading, submitLoading) ||
                other.submitLoading == submitLoading));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, description, submitLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditRoutineStateCopyWith<_$_EditRoutineState> get copyWith =>
      __$$_EditRoutineStateCopyWithImpl<_$_EditRoutineState>(this, _$identity);
}

abstract class _EditRoutineState implements EditRoutineState {
  const factory _EditRoutineState(
      {final String name,
      final String description,
      final bool submitLoading}) = _$_EditRoutineState;

  @override // form state
  String get name;
  @override
  String get description;
  @override // loaders
  bool get submitLoading;
  @override
  @JsonKey(ignore: true)
  _$$_EditRoutineStateCopyWith<_$_EditRoutineState> get copyWith =>
      throw _privateConstructorUsedError;
}
