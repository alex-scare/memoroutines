import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:memoroutines/services/i18n/locale_key.g.dart';
import 'package:memoroutines/shared/helpers/spacing.dart';
import 'package:memoroutines/shared/models/routine.dart';
import 'package:memoroutines/shared/theme.dart';
import 'package:styled_widget/styled_widget.dart';

class RoutineInfoCard extends StatelessWidget {
  const RoutineInfoCard({
    super.key,
    required this.routine,
  });

  final Routine routine;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          color: context.colors.onBackground,
          width: 3,
        ),
      ),
      color: context.colors.background,
      child: Container(
        padding: const EdgeInsets.all(Spacing.sm),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (routine.iconData != null)
                  Icon(routine.iconData, size: 50, color: Colors.black87)
                      .padding(right: Spacing.md), // Colored icons
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      routine.name,
                      style: context.texts.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colors.onBackground.withOpacity(0.9),
                      ),
                    ),
                    Text(
                      routine.description,
                      style: context.texts.bodySmall!.copyWith(
                        color: context.colors.onBackground.withOpacity(0.7),
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
                          .plural(routine.repetitionsNumberToComplete),
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
    return context.texts.bodyMedium!.copyWith(
      fontStyle: FontStyle.italic,
      color: context.colors.onBackground.withOpacity(0.7),
    );
  }

  TextStyle _routineParameterValueStyle(BuildContext context) {
    return context.texts.bodyMedium!.copyWith(
      color: context.colors.onBackground,
    );
  }
}
