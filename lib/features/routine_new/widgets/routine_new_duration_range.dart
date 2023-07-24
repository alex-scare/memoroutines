import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoroutines/features/routine_new/data/routine_new_pod.dart';
import 'package:memoroutines/services/i18n/locale_key.g.dart';
import 'package:memoroutines/shared/helpers/spacing.dart';
import 'package:memoroutines/shared/theme/theme.dart';
import 'package:styled_widget/styled_widget.dart';

class RoutineNewDurationRange extends ConsumerWidget {
  const RoutineNewDurationRange({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formPod = ref.watch(routineNewPod(null));
    final formPodNotifier = ref.read(routineNewPod(null).notifier);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: Spacing.md),
          Text(
            LocaleKey.screensNewRoutineDurationTitle.tr(),
            style: context.texts.titleSmall,
          ),
          Text(
            LocaleKey.screensNewRoutineDurationDescription.tr(),
            style: context.texts.labelMedium!.copyWith(
              fontStyle: FontStyle.italic,
              color: context.colors.onBackground.withOpacity(0.7),
            ),
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
              value: formPod.repetitionsToComplete.toDouble(),
              max: 365,
              min: 1,
              onChanged: (value) {
                formPodNotifier.setRepetitionsToComplete(value.toInt());
              },
            ),
          ),
          Text(
            _getDurationString(context, formPod.repetitionsToComplete),
            textAlign: TextAlign.center,
            style: context.texts.labelSmall!.copyWith(
              height: 1,
              color: context.colors.onBackground.withOpacity(0.5),
            ),
          ).width(double.infinity),
        ],
      ),
    );
  }

  String _getDurationString(BuildContext context, int count) {
    final times = LocaleKey.durationsTime.plural(count);

    final humanReadable = switch (count) {
      < 30 => LocaleKey.durationsDay.plural(count),
      >= 30 && < 365 => LocaleKey.durationsMonth.plural((count / 30).round()),
      >= 365 => LocaleKey.durationsYear.plural((count / 365).round()),
      _ => ''
    };

    return '$times ($humanReadable)';
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
