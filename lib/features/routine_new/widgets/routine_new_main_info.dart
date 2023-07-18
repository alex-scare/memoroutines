import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoroutines/features/routine_new/data/routine_new_pod.dart';
import 'package:memoroutines/features/routine_new/data/routine_new_state.dart';
import 'package:memoroutines/features/routine_new/widgets/routine_new_icon_selector.dart';
import 'package:memoroutines/shared/components/custom_text_input.dart';
import 'package:memoroutines/shared/helpers/spacing.dart';
import 'package:memoroutines/shared/theme.dart';

class RoutineNewMainInfo extends HookConsumerWidget {
  const RoutineNewMainInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formPod = ref.watch(routineNewPod(null));
    final formPodNotifier = ref.read(routineNewPod(null).notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: Spacing.xl),
        const SizedBox(height: 150, child: RoutineNewIconSelector()),
        const SizedBox(height: Spacing.sm),
        Text(
          'Give a name for your new routine'.toUpperCase(),
          style: context.texts.titleMedium,
        ),
        const SizedBox(height: Spacing.xxs),
        CustomTextInput(
          autofocus: true,
          initialValue: formPod.name,
          onChanged: (value) => formPodNotifier.setName(value),
          placeholder: 'name',
          textColor: context.colors.onBackground,
          textStyle: context.texts.titleLarge!.copyWith(
            fontWeight: FontWeight.w700,
          ),
          validator: formPod.nameValidator,
          inputFormatters: formPod.nameFormatters,
        ),
        const SizedBox(height: Spacing.xl),
        Text(
          'And add a description (optional)'.toUpperCase(),
          style: context.texts.titleSmall,
        ),
        const SizedBox(height: Spacing.xxs),
        CustomTextInput(
          autofocus: true,
          initialValue: formPod.description,
          onChanged: (value) => formPodNotifier.setDescription(value),
          placeholder: 'description'.toUpperCase(),
          textColor: context.colors.onBackground,
          textStyle: context.texts.bodyLarge!.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
