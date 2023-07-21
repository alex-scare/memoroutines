import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:memoroutines/features/routine_new/widgets/routine_new_actions.dart';
import 'package:memoroutines/features/routine_new/widgets/routine_new_app_bar.dart';
import 'package:memoroutines/features/routine_new/widgets/routine_new_duration_range.dart';
import 'package:memoroutines/features/routine_new/widgets/routine_new_final_step.dart';
import 'package:memoroutines/features/routine_new/widgets/routine_new_frequency.dart';
import 'package:memoroutines/features/routine_new/widgets/routine_new_main_info.dart';
import 'package:memoroutines/features/routine_new/widgets/routine_new_single_repetition_duration.dart';
import 'package:memoroutines/shared/extensions/duration.dart';
import 'package:memoroutines/shared/helpers/spacing.dart';
import 'package:memoroutines/shared/theme.dart';
import 'package:styled_widget/styled_widget.dart';

class RoutineNewScreen extends HookWidget {
  const RoutineNewScreen({super.key, required this.goState});

  final GoRouterState goState;

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController(initialPage: 0);
    final currentPage = useState(pageController.initialPage);

    useEffect(
      () {
        void listener() {
          currentPage.value = pageController.page?.round() ?? 0;
        }

        pageController.addListener(listener);
        return () => pageController.removeListener(listener);
      },
      [],
    );

    return Scaffold(
      appBar: const RoutineNewAppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              itemCount: 4,
              itemBuilder: (context, index) {
                return switch (index) {
                  0 => const RoutineNewMainInfo(),
                  1 => Column(
                      children: [
                        const RoutineNewDurationRange(),
                        const Divider().padding(vertical: Spacing.sm),
                        const RoutineNewSingleRepetitionDuration()
                      ],
                    ),
                  2 => const RoutineNewFrequency(),
                  _ => const RoutineNewFinalStep(),
                };
              },
            ).padding(horizontal: Spacing.md).expanded(),
            RoutineNewActions(
              currentSection: currentPage.value,
              nextSection: () => pageController.nextPage(
                duration: 200.milliseconds,
                curve: Curves.bounceInOut,
              ),
              prevSection: () => pageController.previousPage(
                duration: 200.milliseconds,
                curve: Curves.bounceInOut,
              ),
            ),
          ],
        ).backgroundColor(context.colors.background),
      ),
    );
  }
}
