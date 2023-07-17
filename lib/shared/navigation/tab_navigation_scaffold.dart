import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:memoroutines/shared/navigation/navigation.dart';

class TabNavigationScaffold extends HookWidget {
  const TabNavigationScaffold({
    super.key,
    required this.child,
    required this.location,
    required this.routes,
  });

  final Widget child;
  final String location;
  final List<AppRoute> routes;

  @override
  Widget build(BuildContext context) {
    var currentIndex = useState(
      routes.indexWhere((element) => element.path == location),
    );

    return Scaffold(
      bottomNavigationBar: CupertinoTabBar(
        // selectedItemColor: context.colors.primary,
        currentIndex: currentIndex.value,
        onTap: (int index) {
          final route = routes[index];

          currentIndex.value = index;
          context.goNamed(route.name.name);
        },
        items: routes.map((route) => route.tab).toList(),
      ),
      body: child,
    );
  }
}

extension TabRoute on AppRoute {
  BottomNavigationBarItem get tab {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label ?? '',
    );
  }
}
