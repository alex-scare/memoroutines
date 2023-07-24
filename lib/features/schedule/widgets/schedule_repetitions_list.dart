import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoroutines/features/schedule/widgets/schedule_repetition.dart';
import 'package:memoroutines/shared/helpers/spacing.dart';
import 'package:memoroutines/shared/repositories/repetitions_repository.dart';

class ScheduleRepetitionsList extends ConsumerWidget {
  const ScheduleRepetitionsList({Key? key, required this.date})
      : super(key: key);

  final DateTime date;

  @override
  Widget build(BuildContext context, ref) {
    final repetitions = ref.watch(repetitionsPod);

    return StreamBuilder(
      stream: repetitions.listenRepetitionsForDate(date),
      initialData: const [],
      builder: (_, snapshot) {
        return Column(
          children: snapshot.data?.expand((repetition) {
                return [
                  ScheduleRepetition(
                    repetition: repetition,
                    onComplete: () => repetitions.toggleCompletion(repetition),
                  ),
                  const SizedBox(height: Spacing.sm)
                ];
              }).toList() ??
              [],
        );
      },
    );
  }
}
