import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoroutines/features/routine_new/data/routine_new_pod.dart';
import 'package:memoroutines/features/routine_new/data/routine_new_state.dart';
import 'package:memoroutines/services/i18n/locale_key.g.dart';
import 'package:memoroutines/shared/helpers/spacing.dart';
import 'package:memoroutines/shared/theme/theme.dart';
import 'package:styled_widget/styled_widget.dart';

class RoutineNewFrequencyMonthlyFixed extends ConsumerWidget {
  const RoutineNewFrequencyMonthlyFixed({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formPod = ref.watch(routineNewPod(null));
    final formPodNotifier = ref.read(routineNewPod(null).notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKey.screensNewRoutineDurationMonthlyFixedTitle.tr(),
          style: context.texts.titleSmall,
        ),
        Text(
          LocaleKey.screensNewRoutineDurationMonthlyFixedDescription.tr(),
          style: context.texts.labelSmall!.copyWith(
            fontStyle: FontStyle.italic,
            color: context.colors.onBackground.withOpacity(0.5),
          ),
        ),
        const SizedBox(height: Spacing.md),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 31,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 8,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
          ),
          itemBuilder: (context, index) {
            final currentDayNum = index + 1;
            final isSelected = formPod.daysOfMonthSet.contains(currentDayNum);
            return GestureDetector(
              onTap: () => formPodNotifier.toggleDayOfMonth(currentDayNum),
              child: Container(
                decoration: BoxDecoration(
                  color: formPod.daysOfMonthSet.contains(currentDayNum)
                      ? context.colors.primaryContainer
                      : Colors.transparent,
                  border: Border.all(
                    color: context.colors.onBackground.withOpacity(0.3),
                  ),
                ),
                child: Center(
                  child: Text(
                    currentDayNum.toString(),
                    style: context.texts.bodySmall!.copyWith(
                      color: isSelected
                          ? context.colors.onPrimaryContainer
                          : context.colors.onBackground,
                    ),
                  ),
                ),
              ),
            );
          },
        ).height(250)
      ],
    );
  }
}
