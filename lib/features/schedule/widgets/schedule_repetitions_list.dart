import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoroutines/features/schedule/widgets/repetitions_list.dart';
import 'package:memoroutines/shared/models/repetition.dart';
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
      initialData: const [].cast<Repetition>(),
      builder: (_, snapshot) {
        return RepetitionsList(
          repetitions: snapshot.data ?? [],
          completeRepetition: repetitions.toggleCompletion,
        );
      },
    );
  }
}
