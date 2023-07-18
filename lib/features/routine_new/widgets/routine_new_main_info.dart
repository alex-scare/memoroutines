import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoroutines/features/routine_new/data/routine_new_pod.dart';
import 'package:memoroutines/features/routine_new/data/routine_new_state.dart';
import 'package:memoroutines/shared/components/custom_text_input.dart';
import 'package:memoroutines/shared/helpers/spacing.dart';
import 'package:memoroutines/shared/theme.dart';

class RoutineNewMainInfo extends HookConsumerWidget {
  const RoutineNewMainInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formPod = ref.watch(routineNewPod(null));
    final formPodNotifier = ref.read(routineNewPod(null).notifier);

    final iconsController =
        usePageController(initialPage: 5, viewportFraction: 1 / 5);
    final currentIndex = useState<int>(5);

    useEffect(
      () {
        iconsController.addListener(() {
          currentIndex.value = iconsController.page!.round();
        });
        return iconsController.dispose;
      },
      const [],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 100,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Icon(
                    iconList[currentIndex.value],
                    size: 32.0,
                    color: context.colors.background,
                  ),
                ),
              ),
              PageView.builder(
                controller: iconsController,
                itemCount: iconList.length,
                pageSnapping: true,
                itemBuilder: (context, index) {
                  final isCurrent = currentIndex.value == index;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Center(
                      child: Icon(
                        iconList[index],
                        size: isCurrent ? 32.0 : 20.0,
                        color: isCurrent
                            ? context.colors.onPrimary
                            : context.colors.primary,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
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

final List<IconData> iconList = [
  Icons.abc,
  Icons.ac_unit_rounded,
  Icons.access_alarm_rounded,
  Icons.access_time_rounded,
  Icons.accessibility_rounded,
  Icons.accessible_rounded,
  Icons.account_balance_rounded,
  Icons.read_more,
  Icons.receipt_long_rounded,
  Icons.recent_actors_rounded,
  Icons.record_voice_over_rounded,
  Icons.redeem_rounded,
  Icons.redo_rounded,
  Icons.refresh_rounded,
  Icons.remove_circle_rounded,
];
