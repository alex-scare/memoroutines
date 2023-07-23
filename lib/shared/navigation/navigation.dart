import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';
import 'package:memoroutines/features/routine_new/routine_new_screen.dart';
import 'package:memoroutines/features/routines/routines_screen.dart';
import 'package:memoroutines/features/schedule/schedule_screen.dart';
import 'package:memoroutines/features/settings/settings_screen.dart';
import 'package:memoroutines/services/logger/dev_logger.dart';
import 'package:memoroutines/shared/navigation/tab_navigation_scaffold.dart';

enum RouteName {
  initial,
  schedule,
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
      redirectCheck: (_, __) => '/schedule',
    ),
    AppRoute(
      name: RouteName.newRoutine,
      path: '/routines/new',
      builder: (_, state) => RoutineNewScreen(goState: state),
    ),
  ];

  final List<AppRoute> tabRoutes = [
    AppRoute(
      name: RouteName.schedule,
      path: '/schedule',
      icon: LineIcons.calendar,
      transitionType: PageTransitionType.instant,
      builder: (_, __) => const ScheduleScreen(),
    ),
    AppRoute(
      name: RouteName.routines,
      path: '/routines',
      icon: LineIcons.bookOpen,
      transitionType: PageTransitionType.instant,
      builder: (_, __) => const RoutinesScreen(),
    ),
    AppRoute(
      name: RouteName.settings,
      path: '/settings',
      icon: LineIcons.cog,
      transitionType: PageTransitionType.instant,
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

enum PageTransitionType {
  instant,
  cupertino,
  ;
}

// TODO Add requireAnonimous and requireAuth
class AppRoute {
  final RouteName name;
  final String path;
  final Widget Function(BuildContext, GoRouterState)? builder;
  final String? Function(BuildContext, GoRouterState)? redirectCheck;
  final PageTransitionType transitionType;

  // Only for tab routes
  final String? label;
  final IconData? icon;
  final List<AppRoute> children;

  AppRoute({
    required this.name,
    required this.path,
    this.builder,
    this.redirectCheck,
    this.transitionType = PageTransitionType.cupertino,
    this.label,
    this.icon,
    this.children = const [],
  });

  GoRoute route(GlobalKey<NavigatorState>? key) => GoRoute(
        parentNavigatorKey: key,
        path: path,
        builder: builder,
        name: name.name,
        pageBuilder: transitionType == PageTransitionType.cupertino
            ? null
            : (context, state) => InstantTransitionPage(
                  child: builder!.call(context, state),
                ),
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

class InstantTransitionPage extends Page {
  final Widget child;

  InstantTransitionPage({required this.child}) : super(key: ValueKey(child));

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) =>
          child,
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        // Return the child directly, without any transition.
        return child;
      },
    );
  }
}
