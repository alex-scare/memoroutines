import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoroutines/shared/components/routine_info_card.dart';
import 'package:memoroutines/shared/helpers/spacing.dart';
import 'package:memoroutines/shared/models/routine.dart';
import 'package:memoroutines/shared/repositories/routines_repository.dart';

class RoutinesList extends ConsumerWidget {
  const RoutinesList({Key? key}) : super(key: key);

  @override
  StreamBuilder<List<Routine>> build(BuildContext context, WidgetRef ref) {
    final routines = ref.watch(routinesPod);

    return StreamBuilder(
      stream: routines.listenAll(),
      builder: (_, snapshot) => ListView.separated(
        itemCount: snapshot.data?.length ?? 0,
        separatorBuilder: (_, __) {
          return const SizedBox(height: Spacing.xs);
        },
        itemBuilder: (context, index) {
          final routine = snapshot.data?[index];

          if (routine == null) return null;
          return RoutineInfoCard(routine: routine);
        },
      ),
    );
  }
}
