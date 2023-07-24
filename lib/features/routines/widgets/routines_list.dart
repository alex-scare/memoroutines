import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:memoroutines/shared/components/routine_info_card.dart';
import 'package:memoroutines/shared/components/slidable_widget.dart';
import 'package:memoroutines/shared/helpers/spacing.dart';
import 'package:memoroutines/shared/models/routine.dart';
import 'package:memoroutines/shared/repositories/routines_repository.dart';
import 'package:memoroutines/shared/theme/theme.dart';

class RoutinesList extends ConsumerWidget {
  const RoutinesList({Key? key}) : super(key: key);

  @override
  StreamBuilder<List<Routine>> build(BuildContext context, WidgetRef ref) {
    final routines = ref.watch(routinesPod);

    return StreamBuilder(
      stream: routines.listenAll(),
      builder: (_, snapshot) => ListView.separated(
        itemCount: snapshot.data?.length ?? 0,
        separatorBuilder: (_, __) => const SizedBox(height: Spacing.xs),
        itemBuilder: (context, index) {
          final routine = snapshot.data?[index];
          final isLastRoutine = index == snapshot.data!.length - 1;

          if (routine == null) return null;
          return Padding(
            padding: EdgeInsets.only(bottom: isLastRoutine ? Spacing.sm : 0),
            child: SlidableWidget(
              borderRadius: Spacing.md,
              endActions: [
                SlidableWidgetAction(
                  icon: const Icon(LineIcons.trash),
                  onPressed: (_) => routines.deleteWithRepetitions(routine.id),
                  backgroundColor: context.colors.error,
                  foregroundColor: context.colors.onError,
                )
              ],
              child: RoutineInfoCard(routine: routine),
            ),
          );
        },
      ),
    );
  }
}
