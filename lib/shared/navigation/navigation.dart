import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';
import 'package:memoroutines/features/home/home_screen.dart';
import 'package:memoroutines/features/routine_new/routine_new_screen.dart';
import 'package:memoroutines/features/routines/routines_screen.dart';
import 'package:memoroutines/features/settings/settings_screen.dart';
import 'package:memoroutines/services/logger/dev_logger.dart';
import 'package:memoroutines/shared/navigation/tab_navigation_scaffold.dart';

enum RouteName {
  initial,
  home,
  settings,
  routines,
  newRoutine,
  ;
}

final _log = DevLogger('navigation');

class AppNavigation {
  static final AppNavigation _singleton = AppNavigation._internal();
  factory AppNavigation() => _singleton;
  AppNavigation._internal();

  GlobalKey<NavigatorState> tabRouteKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> globalRouteKey = GlobalKey<NavigatorState>();

  GoRouter? _router;
  GoRouter get router => _router ??= _createRouter();

  GoRouter _createRouter() {
    return GoRouter(
      navigatorKey: globalRouteKey,
      initialLocation: '/',
      routes: [
        ...routes.map((route) => route.route(globalRouteKey)).toList(),
        ShellRoute(
          navigatorKey: tabRouteKey,
          routes: tabRoutes.map((route) => route.route(tabRouteKey)).toList(),
          builder: (_, state, child) {
            return TabNavigationScaffold(
              location: state.location,
              routes: tabRoutes,
              child: child,
            );
          },
        ),
      ],
    );
  }

  final List<AppRoute> routes = [
    AppRoute(
      name: RouteName.initial,
      path: '/',
      redirectCheck: (_, __) => '/home',
    ),
    AppRoute(
      name: RouteName.newRoutine,
      path: '/routines/new',
      builder: (_, state) => RoutineNewScreen(goState: state),
    ),
  ];

  final List<AppRoute> tabRoutes = [
    AppRoute(
      name: RouteName.home,
      path: '/home',
      // label: 'Home',
      icon: LineIcons.home,
      builder: (_, __) => const HomeScreen(),
    ),
    AppRoute(
      name: RouteName.routines,
      path: '/routines',
      // label: 'Routines',
      icon: LineIcons.bookOpen,
      builder: (_, __) => const RoutinesScreen(),
    ),
    AppRoute(
      name: RouteName.settings,
      path: '/settings',
      // label: 'Settings',
      icon: LineIcons.cog,
      builder: (_, __) => const SettingsScreen(),
    ),
  ];

  void showModal(BuildContext context, Widget Function(BuildContext) builder) {
    showModalBottomSheet(context: context, builder: builder);
  }

  void showFlexibleModal(
    BuildContext context, {
    required Widget Function(BuildContext, ScrollController) builder,
    List<double>? anchors,
    double? maxHeight,
    double? minHeight,
    double? initHeight,
    Color backgroundColor = Colors.transparent,
  }) {
    showFlexibleBottomSheet(
      context: context,
      useRootNavigator: true,
      initHeight: initHeight,
      anchors: anchors,
      maxHeight: maxHeight,
      minHeight: minHeight,
      bottomSheetColor: backgroundColor,
      builder: (context, scrollController, ___) {
        return builder(context, scrollController);
      },
    );
  }

  void closeModal(BuildContext context) {
    context.navigateBack();
  }
}

// Add requireAnonimous and requireAuth
class AppRoute {
  final RouteName name;
  final String path;
  final Widget Function(BuildContext, GoRouterState)? builder;
  final String? Function(BuildContext, GoRouterState)? redirectCheck;

  // Only for tab routes
  final String? label;
  final IconData? icon;
  final List<AppRoute> children;

  AppRoute({
    required this.name,
    required this.path,
    this.builder,
    this.redirectCheck,
    this.label,
    this.icon,
    this.children = const [],
  });

  GoRoute route(GlobalKey<NavigatorState>? key) => GoRoute(
        parentNavigatorKey: key,
        path: path,
        builder: builder,
        name: name.name,
        routes: children.map((route) => route.route(key)).toList(),
        redirect: (context, state) {
          _log.info('redirecting to ${state.name} (${state.location})');

          if (redirectCheck != null) {
            return redirectCheck?.call(context, state);
          }

          return null;
        },
      );
}

extension ContextNavigationExt on BuildContext {
  void navigateBack() {
    if (!Navigator.of(this).canPop()) return;

    Navigator.of(this).pop();
  }
}
