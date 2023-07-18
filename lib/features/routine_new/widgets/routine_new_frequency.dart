import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoroutines/features/routine_new/data/routine_new_pod.dart';
import 'package:memoroutines/features/routine_new/data/routine_new_state.dart';
import 'package:memoroutines/shared/helpers/spacing.dart';
import 'package:memoroutines/shared/models/routine.dart';

class RoutineNewFrequency extends ConsumerWidget {
  const RoutineNewFrequency({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formPod = ref.watch(routineNewPod(null));
    final formPodNotifier = ref.read(routineNewPod(null).notifier);

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: SegmentedButton(
            onSelectionChanged: formPodNotifier.setFrequency,
            selected: formPod.frequencySet,
            segments: RoutineFrequency.values.map(
              (frequency) {
                return ButtonSegment(
                  value: frequency,
                  label: Text(frequency.label),
                );
              },
            ).toList(),
          ),
        ),
        const SizedBox(height: Spacing.sm),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              value: formPod.isFlexible,
              onChanged: (_) => formPodNotifier.toggleFlexible(),
            ),
            const Text('is flexible routine')
          ],
        ),
        const SizedBox(height: Spacing.md)
      ],
    );
  }
}
