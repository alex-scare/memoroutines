import 'package:flutter/cupertino.dart';
import 'package:memoroutines/shared/components/routine_info_card.dart';
import 'package:memoroutines/shared/helpers/spacing.dart';
import 'package:memoroutines/shared/models/routine.dart';

class RoutinesList extends StatelessWidget {
  const RoutinesList({Key? key, required this.listenRounines})
      : super(key: key);

  final Stream<List<Routine>> listenRounines;

  @override
  StreamBuilder<List<Routine>> build(BuildContext context) {
    return StreamBuilder(
      stream: listenRounines,
      builder: (_, snapshot) => ListView.separated(
        itemCount: snapshot.data?.length ?? 0,
        separatorBuilder: (_, __) {
          return const SizedBox(height: Spacing.sm);
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
