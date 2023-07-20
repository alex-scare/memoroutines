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
      elevation: 0.1,
      color: context.colors.surface,
      child: Container(
        padding: const EdgeInsets.all(Spacing.sm),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (routine.iconData != null)
                  Icon(routine.iconData, size: 50).padding(right: Spacing.md),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      routine.name,
                      style: context.texts.titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      routine.description,
                      style: context.texts.bodySmall,
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
                      style: context.texts.bodyMedium!
                          .copyWith(fontStyle: FontStyle.italic),
                    ),
                    Text(
                      LocaleKey.modelsRoutineRepetitionsToCompleteDisplayName
                          .tr(),
                      style: context.texts.bodyMedium!
                          .copyWith(fontStyle: FontStyle.italic),
                    ),
                    Text(
                      LocaleKey.modelsRoutineSingleRepetitionDurationDisplayName
                          .tr(),
                      style: context.texts.bodyMedium!
                          .copyWith(fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
                const SizedBox(width: Spacing.xs),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(routine.frequency.label.tr()),
                    Text(
                      LocaleKey.durationsTime
                          .plural(routine.repetitionsNumberToComplete),
                    ),
                    Text(routine.singleRepetitionDurationString(context)),
                  ],
                ).flexible(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
