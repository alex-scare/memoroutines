// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class GlobalState {
  final bool? isLoggerEnabled;

  const GlobalState({
    this.isLoggerEnabled,
  });

  @override
  String toString() => 'GlobalState(isLoggerEnabled: $isLoggerEnabled)';

  String toJson() => json.encode(toMap());

  factory GlobalState.fromJson(String source) =>
      GlobalState.fromMap(json.decode(source) as Map<String, dynamic>);

  GlobalState copyWith({
    bool? isLoggerEnabled,
  }) {
    return GlobalState(
      isLoggerEnabled: isLoggerEnabled ?? this.isLoggerEnabled,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isLoggerEnabled': isLoggerEnabled,
    };
  }

  factory GlobalState.fromMap(Map<String, dynamic> map) {
    return GlobalState(
      isLoggerEnabled: map['isLoggerEnabled'] != null
          ? map['isLoggerEnabled'] as bool
          : null,
    );
  }
}
