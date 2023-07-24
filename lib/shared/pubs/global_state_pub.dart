import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoroutines/services/logger/dev_logger.dart';
import 'package:memoroutines/services/shared_preferences/shared_preferences.dart';
import 'package:memoroutines/shared/models/global_state.dart';

class GlobalStateNotifier extends StateNotifier<GlobalState> {
  static final _log = DevLogger('global_state');

  GlobalStateNotifier() : super(const GlobalState()) {
    _loadState();
  }

  void setLoggerEnabled(bool value) {
    if (!value) _log.info('Logger disabled');

    DevLogger.setLogEnabled(value);
    state = state.copyWith(isLoggerEnabled: value);

    if (value) _log.info('Logger enabled');
    _persistState();
  }

  Future<void> _persistState() async {
    await SharedPreferencesService().setGlobalState(state.toJson());
  }

  Future<void> _loadState() async {
    final sharedPreferences = SharedPreferencesService();
    state = GlobalState.fromJson(await sharedPreferences.globalState);
    _log.info('Loaded state, logger enabled: ${state.isLoggerEnabled}');
    DevLogger.setLogEnabled(state.isLoggerEnabled ?? false);
  }
}

final globalStatePub = StateNotifierProvider<GlobalStateNotifier, GlobalState>(
  (ref) => GlobalStateNotifier(),
);
