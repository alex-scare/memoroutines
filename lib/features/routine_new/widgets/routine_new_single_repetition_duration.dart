import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoroutines/features/routine_new/data/routine_new_pod.dart';
import 'package:memoroutines/services/i18n/locale_key.g.dart';
import 'package:memoroutines/shared/helpers/spacing.dart';
import 'package:memoroutines/shared/models/single_repetition_duration.dart';
import 'package:memoroutines/shared/theme/theme.dart';
import 'package:styled_widget/styled_widget.dart';

class RoutineNewSingleRepetitionDuration extends ConsumerWidget {
  const RoutineNewSingleRepetitionDuration({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formPod = ref.watch(routineNewPod(null));
    final formPodNotifier = ref.watch(routineNewPod(null).notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: Spacing.md),
        Text(
          LocaleKey.screensNewRoutineSingleRepetitionDurationTitle.tr(),
          style: context.texts.titleSmall,
        ),
        const SizedBox(height: Spacing.sm),
        SliderTheme(
          data: context.theme.sliderTheme.copyWith(
            trackShape: CustomTrackShape(),
            trackHeight: 2,
            thumbShape: SliderComponentShape.noThumb,
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 15.0),
          ),
          child: Slider(
            value: SingleRepetitionDuration.durationFromMinutes(
              formPod.singleRepetititionDuration,
            ).indexInList.toDouble(),
            min: 0,
            max: SingleRepetitionDuration.values.length.toDouble() - 1,
            divisions: SingleRepetitionDuration.values.length - 1,
            onChanged: (value) {
              final current = SingleRepetitionDuration.values[value.toInt()];
              formPodNotifier.setSingleRepetitionDuration(current.minutes);
            },
          ),
        ),
        Text(
          _getDurationString(context, formPod.singleRepetititionDuration),
          textAlign: TextAlign.center,
          style: context.texts.labelSmall!.copyWith(
            height: 1,
            color: context.colors.onBackground.withOpacity(0.5),
          ),
        ).width(double.infinity),
      ],
    );
  }

  String _getDurationString(BuildContext context, int durationInMinutes) {
    final restMinutes = durationInMinutes % 60;
    final hours = (durationInMinutes / 60).floor();

    String minutesString(int count) => LocaleKey.durationsMinute.plural(count);
    String hoursString(int count) => LocaleKey.durationsHour.plural(count);
    String restMinutesString(int count) =>
        count != 0 ? ' ${minutesString(count)}' : '';

    return switch (durationInMinutes) {
      < 60 => minutesString(durationInMinutes),
      _ => hoursString(hours) + restMinutesString(restMinutes),
    };
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
