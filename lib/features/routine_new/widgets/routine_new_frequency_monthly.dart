import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoroutines/features/routine_new/data/routine_new_pod.dart';
import 'package:memoroutines/features/routine_new/widgets/routine_new_frequency_flexible.dart';
import 'package:memoroutines/features/routine_new/widgets/routine_new_frequency_monthly_fixed.dart';
import 'package:memoroutines/features/routine_new/widgets/routine_new_times_per_duration_range.dart';
import 'package:memoroutines/shared/helpers/spacing.dart';
import 'package:styled_widget/styled_widget.dart';

class RoutineNewFrequencyMonthly extends ConsumerWidget {
  const RoutineNewFrequencyMonthly({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formPod = ref.watch(routineNewPod(null));

    return Column(
      children: [
        const RoutineNewFrequencyFlexible(),
        const Divider().padding(vertical: Spacing.sm),
        formPod.isFlexible
            ? const RoutineNewTimesPerDuration()
            : const RoutineNewFrequencyMonthlyFixed(),
      ],
    );
  }
}
