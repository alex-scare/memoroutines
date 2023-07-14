import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'navigation.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        // selectedItemColor: context.colors.primary,
        currentIndex: currentIndex.value,
        onTap: (index) {
          currentIndex.value = index;
          // context.navigateGo(routes[index].config);
        },
        // itemPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
      label: label,
    );
  }
}
