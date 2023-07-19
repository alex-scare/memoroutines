import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoroutines/features/routine_new/data/routine_new_pod.dart';
import 'package:memoroutines/services/i18n/locale_key.g.dart';
import 'package:memoroutines/shared/theme.dart';
import 'package:styled_widget/styled_widget.dart';

class RoutineNewFrequencyFlexible extends ConsumerWidget {
  const RoutineNewFrequencyFlexible({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formPod = ref.watch(routineNewPod(null));
    final formPodNotifier = ref.read(routineNewPod(null).notifier);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: formPod.isFlexible,
          onChanged: (_) => formPodNotifier.toggleFlexible(),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKey.screensNewRoutineFrequencyIsFlexible.tr(),
              style: context.texts.bodyMedium,
            ),
            Text(
              LocaleKey.screensNewRoutineFrequencyIsFlexibleDescription.tr(),
              style: context.texts.bodySmall!
                  .copyWith(fontStyle: FontStyle.italic),
            ),
          ],
        ).flexible()
      ],
    );
  }
}
