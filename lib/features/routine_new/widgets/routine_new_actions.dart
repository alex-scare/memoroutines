import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoroutines/features/routine_new/data/routine_new_pod.dart';
import 'package:memoroutines/services/i18n/locale_key.g.dart';
import 'package:memoroutines/shared/components/custom_filled_button.dart';
import 'package:memoroutines/shared/extensions/duration.dart';
import 'package:memoroutines/shared/helpers/spacing.dart';
import 'package:memoroutines/shared/navigation/navigation.dart';
import 'package:styled_widget/styled_widget.dart';

class RoutineNewActions extends HookConsumerWidget {
  const RoutineNewActions({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = useState<int>(pageController.initialPage);
    final formPodNotifier = ref.read(routineNewPod(null).notifier);

    useEffect(
      () {
        void listener() {
          currentPage.value = pageController.page!.round();
        }

        pageController.addListener(listener);

        return () {
          pageController.removeListener(listener);
        };
      },
      [],
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        (currentPage.value == 0 ? _cancelButton() : _prevButton()).expanded(),
        const SizedBox(width: 12),
        (currentPage.value == 3
                ? _saveButton(formPodNotifier.submitRoutine)
                : _nextButton())
            .expanded(),
      ],
    ).padding(horizontal: Spacing.sm, bottom: Spacing.sm);
  }

  Widget _cancelButton() {
    return CustomFilledButton(
      onPressed: () => AppNavigation().router.pop(),
      child: Text(LocaleKey.screensNewRoutineActionsCancel.tr()),
    );
  }

  Widget _prevButton() {
    return CustomFilledButton(
      onPressed: () => pageController.previousPage(
        duration: 200.milliseconds,
        curve: Curves.bounceInOut,
      ),
      child: Text(LocaleKey.screensNewRoutineActionsPrevStep.tr()),
    );
  }

  Widget _nextButton() {
    return CustomFilledButton(
      isMainAction: true,
      onPressed: () => pageController.nextPage(
        duration: 200.milliseconds,
        curve: Curves.bounceInOut,
      ),
      child: Text(LocaleKey.screensNewRoutineActionsNextStep.tr()),
    );
  }

  Widget _saveButton(Function() saveCallback) {
    return CustomFilledButton(
      onPressed: () {
        saveCallback();
        AppNavigation().router.pop();
      },
      child: Text(LocaleKey.screensNewRoutineActionsSave.tr()),
    );
  }
}
