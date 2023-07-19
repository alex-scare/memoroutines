import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoroutines/features/routine_new/data/routine_new_pod.dart';
import 'package:memoroutines/features/routine_new/data/routine_new_state.dart';
import 'package:memoroutines/services/i18n/locale_key.g.dart';
import 'package:memoroutines/shared/helpers/spacing.dart';
import 'package:memoroutines/shared/models/weekday.dart';
import 'package:memoroutines/shared/theme.dart';

class RoutineNewFrequencyWeeklyFixed extends ConsumerWidget {
  const RoutineNewFrequencyWeeklyFixed({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formPod = ref.watch(routineNewPod(null));
    final formPodNotifier = ref.read(routineNewPod(null).notifier);

    return Column(
      children: [
        Text(
          LocaleKey.screensNewRoutineDurationWeeklyFixedTitle.tr(),
          style:
              context.texts.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: Spacing.md),
        SizedBox(
          width: double.infinity,
          child: Theme(
            data: context.theme.copyWith(visualDensity: VisualDensity.compact),
            child: SegmentedButton<Weekday>(
              showSelectedIcon: false,
              onSelectionChanged: formPodNotifier.setDaysOfWeek,
              multiSelectionEnabled: true,
              selected: formPod.daysOfWeekSet,
              segments: Weekday.values.map(
                (day) {
                  return ButtonSegment(
                    value: day,
                    label: Text(day.shortName.tr()),
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
