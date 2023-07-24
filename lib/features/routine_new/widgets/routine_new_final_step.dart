import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoroutines/features/routine_new/data/routine_new_pod.dart';
import 'package:memoroutines/features/routine_new/data/routine_new_state.dart';
import 'package:memoroutines/services/i18n/locale_key.g.dart';
import 'package:memoroutines/shared/components/routine_info_card.dart';
import 'package:memoroutines/shared/helpers/spacing.dart';
import 'package:memoroutines/shared/theme/theme.dart';

class RoutineNewFinalStep extends ConsumerWidget {
  const RoutineNewFinalStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formPod = ref.watch(routineNewPod(null));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: Spacing.md),
        Text(
          LocaleKey.screensNewRoutineCreationCompleteTitle.tr(),
          style: context.texts.titleSmall,
        ),
        Text(
          LocaleKey.screensNewRoutineCreationCompleteDescription.tr(),
          style: context.texts.labelSmall!.copyWith(
            fontStyle: FontStyle.italic,
            color: context.colors.onBackground.withOpacity(0.5),
          ),
        ),
        const SizedBox(height: Spacing.md),
        RoutineInfoCard(routine: formPod.currentRoutine),
        const SizedBox(height: Spacing.md),
      ],
    );
  }
}
