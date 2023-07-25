import 'package:flutter/material.dart';
import 'package:memoroutines/features/schedule/widgets/schedule_repetition.dart';
import 'package:memoroutines/shared/helpers/spacing.dart';
import 'package:memoroutines/shared/models/repetition.dart';

class RepetitionsList extends StatelessWidget {
  const RepetitionsList({
    Key? key,
    required this.repetitions,
    required this.completeRepetition,
  }) : super(key: key);

  final List<Repetition> repetitions;
  final Function(Repetition) completeRepetition;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: repetitions.expand((repetition) {
        return [
          ScheduleRepetition(
            repetition: repetition,
            onComplete: () => completeRepetition(repetition),
          ),
          const SizedBox(height: Spacing.sm)
        ];
      }).toList(),
    );
  }
}
