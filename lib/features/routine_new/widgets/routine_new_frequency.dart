import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoroutines/features/routine_new/data/routine_new_pod.dart';
import 'package:memoroutines/features/routine_new/data/routine_new_state.dart';
import 'package:memoroutines/features/routine_new/widgets/routine_new_frequency_monthly.dart';
import 'package:memoroutines/features/routine_new/widgets/routine_new_frequency_weekly.dart';
import 'package:memoroutines/services/i18n/locale_key.g.dart';
import 'package:memoroutines/shared/helpers/spacing.dart';
import 'package:memoroutines/shared/models/routine.dart';
import 'package:memoroutines/shared/theme/theme.dart';

class RoutineNewFrequency extends ConsumerWidget {
  const RoutineNewFrequency({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formPod = ref.watch(routineNewPod(null));
    final formPodNotifier = ref.read(routineNewPod(null).notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: Spacing.md),
        Text(
          LocaleKey.screensNewRoutineFrequencyTitle.tr(),
          style: context.texts.titleSmall,
        ),
        const SizedBox(height: Spacing.md),
        SizedBox(
          width: double.infinity,
          child: Theme(
            data: context.theme.copyWith(visualDensity: VisualDensity.compact),
            child: SegmentedButton(
              onSelectionChanged: formPodNotifier.setFrequency,
              selected: formPod.frequencySet,
              segments: RoutineFrequency.values.map(
                (frequency) {
                  return ButtonSegment(
                    value: frequency,
                    label: Text(
                      frequency.label.tr(),
                      style: context.texts.labelSmall!,
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ),
        const SizedBox(height: Spacing.md),
        switch (formPod.frequency) {
          RoutineFrequency.weekly => const RoutineNewFrequencyWeekly(),
          RoutineFrequency.monthly => const RoutineNewFrequencyMonthly(),
          _ => const SizedBox(),
        }
      ],
    );
  }
}
