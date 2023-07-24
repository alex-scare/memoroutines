import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoroutines/features/routine_new/data/routine_new_pod.dart';
import 'package:memoroutines/features/routine_new/data/routine_new_state.dart';
import 'package:memoroutines/features/routine_new/widgets/routine_new_icon_selector.dart';
import 'package:memoroutines/services/i18n/locale_key.g.dart';
import 'package:memoroutines/shared/components/custom_text_input.dart';
import 'package:memoroutines/shared/components/visibility_handler.dart';
import 'package:memoroutines/shared/helpers/spacing.dart';
import 'package:memoroutines/shared/theme/theme.dart';

class RoutineNewMainInfo extends HookConsumerWidget {
  const RoutineNewMainInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formPod = ref.watch(routineNewPod(null));
    final formPodNotifier = ref.read(routineNewPod(null).notifier);
    final titleFocus = useFocusNode();
    final descriptionFocus = useFocusNode();

    return VisibleCheckWidget(
      visibilityKey: const Key('routine-new-main-info'),
      percentage: 30,
      onInvisible: () {
        titleFocus.unfocus();
        descriptionFocus.unfocus();
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: Spacing.md),
            const SizedBox(height: 150, child: RoutineNewIconSelector()),
            const SizedBox(height: Spacing.sm),
            Text(
              LocaleKey.screensNewRoutineMainInfoTitleLabel.tr(),
              style: context.texts.titleSmall,
            ),
            const SizedBox(height: Spacing.xxs),
            CustomTextInput(
              autofocus: true,
              focusNode: titleFocus,
              initialValue: formPod.name,
              onChanged: (value) => formPodNotifier.setName(value),
              placeholder: LocaleKey.screensNewRoutineMainInfoTitlePlaceholder
                  .tr()
                  .toUpperCase(),
              textColor: context.colors.onBackground,
              textStyle: context.texts.bodyLarge!,
              inputFormatters: formPod.nameFormatters,
            ),
            const SizedBox(height: Spacing.xl),
            Text(
              LocaleKey.screensNewRoutineMainInfoDescriptionLabel.tr(),
              style: context.texts.titleSmall,
            ),
            const SizedBox(height: Spacing.xxs),
            CustomTextInput(
              focusNode: descriptionFocus,
              minLines: 1,
              maxLines: 2,
              initialValue: formPod.description,
              onChanged: (value) => formPodNotifier.setDescription(value),
              placeholder: LocaleKey
                  .screensNewRoutineMainInfoDescriptionPlaceholder
                  .tr()
                  .toUpperCase(),
              textColor: context.colors.onBackground,
              textStyle: context.texts.bodyMedium!,
              inputFormatters: formPod.descriptionFormatters,
            ),
          ],
        ),
      ),
    );
  }
}
