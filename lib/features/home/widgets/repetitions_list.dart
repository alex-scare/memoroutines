import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoroutines/shared/repositories/repetitions_repository.dart';

class RepetitionsList extends ConsumerWidget {
  const RepetitionsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final repetitions = ref.watch(completionsPod);

    return StreamBuilder(
      stream: repetitions.listenAll(),
      initialData: const [],
      builder: (_, snapshot) {
        return Column(
          children: snapshot.data!
              .map((repetition) => Text(repetition.id.toString()))
              .toList(),
        );
      },
    );
  }
}
