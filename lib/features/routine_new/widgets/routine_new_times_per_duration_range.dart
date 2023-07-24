import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoroutines/features/routine_new/data/routine_new_pod.dart';
import 'package:memoroutines/services/i18n/locale_key.g.dart';
import 'package:memoroutines/shared/models/routine.dart';
import 'package:memoroutines/shared/theme/theme.dart';
import 'package:styled_widget/styled_widget.dart';

class RoutineNewTimesPerDuration extends ConsumerWidget {
  const RoutineNewTimesPerDuration({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formPod = ref.watch(routineNewPod(null));
    final formPodNotifier = ref.read(routineNewPod(null).notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKey.screensNewRoutineDurationPerPeriodTitle.tr(),
          style: context.texts.titleSmall,
        ),
        Text(
          LocaleKey.screensNewRoutineDurationPerPeriodDescription.tr(),
          style: context.texts.labelSmall!.copyWith(
            fontStyle: FontStyle.italic,
            color: context.colors.onBackground.withOpacity(0.7),
          ),
        ),
        SliderTheme(
          data: context.theme.sliderTheme.copyWith(
            trackShape: CustomTrackShape(),
            trackHeight: 2,
            thumbShape: SliderComponentShape.noThumb,
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 15.0),
          ),
          child: Slider(
            value: formPod.repetitionsPerPeriod.toDouble(),
            max: switch (formPod.frequency) {
              RoutineFrequency.weekly => 7,
              RoutineFrequency.monthly => 31,
              _ => 365
            },
            min: 1,
            onChanged: (value) {
              formPodNotifier.setRepetitionsPerPeriod(value.toInt());
            },
          ),
        ),
        Text(
          LocaleKey.durationsTime.plural(formPod.repetitionsPerPeriod),
          textAlign: TextAlign.center,
          style: context.texts.labelSmall!.copyWith(
            height: 1,
            color: context.colors.onBackground.withOpacity(0.5),
          ),
        ).width(double.infinity),
      ],
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
