import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:memoroutines/features/routine_new/widgets/routine_new_actions.dart';
import 'package:memoroutines/features/routine_new/widgets/routine_new_app_bar.dart';
import 'package:memoroutines/features/routine_new/widgets/routine_new_frequency.dart';
import 'package:memoroutines/features/routine_new/widgets/routine_new_main_info.dart';
import 'package:memoroutines/shared/helpers/spacing.dart';
import 'package:memoroutines/shared/theme.dart';
import 'package:styled_widget/styled_widget.dart';

class RoutineNewScreen extends HookWidget {
  const RoutineNewScreen({super.key, required this.goState});

  final GoRouterState goState;

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController(initialPage: 0);

    print('screen rebuild');

    return Scaffold(
      appBar: const RoutineNewAppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              itemCount: 3,
              itemBuilder: (context, index) {
                return switch (index) {
                  0 => const RoutineNewMainInfo(),
                  1 => const RoutineNewFrequency(),
                  _ => const SizedBox(width: 10),
                };
              },
            ).padding(horizontal: Spacing.md).expanded(),
            RoutineNewActions(pageController: pageController),
          ],
        ).backgroundColor(context.colors.background),
      ),
    );
  }
}
