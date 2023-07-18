import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoroutines/features/routine_new/data/routine_new_pod.dart';
import 'package:memoroutines/features/routine_new/widgets/routine_new_frequency.dart';
import 'package:memoroutines/features/routine_new/widgets/routine_new_main_info.dart';
import 'package:memoroutines/shared/components/custom_app_bar.dart';
import 'package:memoroutines/shared/extensions/duration.dart';
import 'package:memoroutines/shared/helpers/spacing.dart';
import 'package:memoroutines/shared/navigation/navigation.dart';
import 'package:memoroutines/shared/theme.dart';
import 'package:styled_widget/styled_widget.dart';

class RoutineNewScreen extends HookConsumerWidget {
  const RoutineNewScreen({super.key, required this.goState});

  final GoRouterState goState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formPodNotifier = ref.read(routineNewPod(null).notifier);
    final pageController = usePageController(initialPage: 0);

    final submit = useCallback(
      () {
        formPodNotifier.submitRoutine();
        AppNavigation().closeModal(context);
      },
      [],
    );

    return Scaffold(
      appBar: const CustomAppBar(showBackButton: true),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              itemBuilder: (context, index) {
                return switch (index) {
                  0 => const RoutineNewMainInfo(),
                  1 => const RoutineNewFrequency(),
                  _ => const SizedBox(width: 10),
                };
              },
              itemCount: 3,
            ).padding(horizontal: Spacing.md).expanded(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilledButton(
                  onPressed: () => pageController.previousPage(
                    duration: 200.milliseconds,
                    curve: Curves.bounceInOut,
                  ),
                  child: const Text('prev'),
                ).padding(horizontal: Spacing.xs).expanded(),
                FilledButton(
                  onPressed: () => pageController.nextPage(
                    duration: 200.milliseconds,
                    curve: Curves.bounceInOut,
                  ),
                  child: const Text('next'),
                ).padding(horizontal: Spacing.xs).expanded(),
              ],
            ).padding(bottom: Spacing.xs)
          ],
        ).backgroundColor(context.colors.background),
      ),
    );
  }
}
