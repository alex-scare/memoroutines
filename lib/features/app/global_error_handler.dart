import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:memoroutines/services/logger/dev_logger.dart';
import 'package:memoroutines/shared/navigation/navigation.dart';

class GlobalErrorHandler extends StatefulWidget {
  const GlobalErrorHandler({
    super.key,
    required this.child,
    required this.router,
  });

  final Widget child;
  final GoRouter router;

  @override
  State<GlobalErrorHandler> createState() => _GlobalErrorHandlerState();
}

class _GlobalErrorHandlerState extends State<GlobalErrorHandler> {
  static final _log = DevLogger('GLOBAL_ERROR');

  @override
  void initState() {
    super.initState();

    FlutterError.onError = (error) {
      final routeState = AppNavigation().globalRouteKey.currentState;
      final page = routeState?.widget.pages.last.name ?? '';
      final message = 'flutter error! Lib: "${error.library}". Screen: "$page"';
      _log.wtf(message, error.exception, error.stack ?? StackTrace.empty);
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      final routeState = AppNavigation().globalRouteKey.currentState;
      final page = routeState?.widget.pages.last.name ?? '';
      final message = 'platform error! Screen: "$page"';
      _log.wtf(message, error, stack);

      return true;
    };
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
