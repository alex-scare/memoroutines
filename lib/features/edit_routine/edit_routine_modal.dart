import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoroutines/features/edit_routine/data/edit_routine_pod.dart';
import 'package:memoroutines/features/edit_routine/data/edit_routine_state.dart';
import 'package:memoroutines/shared/components/custom_text_input.dart';
import 'package:memoroutines/shared/helpers/spacing.dart';
import 'package:memoroutines/shared/navigation/navigation.dart';
import 'package:memoroutines/shared/theme.dart';
import 'package:styled_widget/styled_widget.dart';

class EditRoutineModal extends HookConsumerWidget {
  const EditRoutineModal({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formPod = ref.watch(editRoutinePod(null));
    final formPodNotifier = ref.read(editRoutinePod(null).notifier);

    final submit = useCallback(
      () {
        formPodNotifier.submitRoutine();
        AppNavigation().closeModal(context);
      },
      [],
    );

    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          const SizedBox(height: Spacing.xs),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 48),
              Text('New routine', style: context.texts.titleMedium),
              IconButton(
                onPressed: submit,
                icon: const Icon(Icons.check),
              )
            ],
          ),
          const SizedBox(height: Spacing.xs),
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
          const SizedBox(height: Spacing.xs),
          CustomTextInput(
            autofocus: true,
            initialValue: formPod.description,
            onChanged: (value) => formPodNotifier.setDescription(value),
            placeholder: 'description',
            textColor: context.colors.onBackground,
            textStyle: context.texts.bodyLarge!.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: Spacing.xs),
        ],
      )
          .padding(horizontal: Spacing.sm)
          .backgroundColor(context.colors.background),
    );
  }
}
