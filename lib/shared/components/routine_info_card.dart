import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:memoroutines/services/i18n/locale_key.g.dart';
import 'package:memoroutines/shared/helpers/spacing.dart';
import 'package:memoroutines/shared/models/routine.dart';
import 'package:memoroutines/shared/theme/theme.dart';
import 'package:styled_widget/styled_widget.dart';

class RoutineInfoCard extends StatelessWidget {
  const RoutineInfoCard({
    super.key,
    required this.routine,
  });

  final Routine routine;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.background,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(Spacing.md),
        border: Border.all(
          color: context.colors.onBackground,
          width: 4,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(Spacing.sm),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  routine.icon.icon,
                  size: 52,
                  color: context.colors.onBackground,
                ).padding(right: Spacing.sm),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      routine.name,
                      style: context.texts.headlineSmall,
                    ),
                    if (routine.description.isNotEmpty)
                      Text(
                        routine.description,
                        style: context.texts.labelMedium!.copyWith(
                          fontStyle: FontStyle.italic,
                          color: context.colors.onBackground.withOpacity(0.8),
                          height: 1,
                        ),
                        softWrap: true,
                      ),
                  ],
                ).flexible()
              ],
            ),
            const SizedBox(height: Spacing.md),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKey.modelsRoutineFrequencyDisplayName.tr(),
                      style: _routineParameterNameStyle(context),
                    ),
                    Text(
                      LocaleKey.modelsRoutineRepetitionsToCompleteDisplayName
                          .tr(),
                      style: _routineParameterNameStyle(context),
                    ),
                    Text(
                      LocaleKey.modelsRoutineSingleRepetitionDurationDisplayName
                          .tr(),
                      style: _routineParameterNameStyle(context),
                    ),
                  ],
                ),
                const SizedBox(width: Spacing.xs),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      routine.frequency.label.tr(),
                      style: _routineParameterValueStyle(context),
                    ),
                    Text(
                      LocaleKey.durationsTime
                          .plural(routine.completionRepetitionCount),
                      style: _routineParameterValueStyle(context),
                    ),
                    Text(
                      routine.singleRepetitionDurationString(context),
                      style: _routineParameterValueStyle(context),
                    ),
                  ],
                ).flexible(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _routineParameterNameStyle(BuildContext context) {
    return context.texts.bodySmall!.copyWith(
      fontStyle: FontStyle.italic,
      color: context.colors.onBackground.withOpacity(0.8),
    );
  }

  TextStyle _routineParameterValueStyle(BuildContext context) {
    return context.texts.bodySmall!.copyWith(
      color: context.colors.onBackground,
    );
  }
}
