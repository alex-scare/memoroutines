import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoroutines/features/edit_routine/edit_routine_modal.dart';
import 'package:memoroutines/features/routines/widgets/routines_list.dart';
import 'package:memoroutines/services/i18n/locale_key.g.dart';
import 'package:memoroutines/shared/components/custom_app_bar.dart';
import 'package:memoroutines/shared/navigation/navigation.dart';
import 'package:memoroutines/shared/repositories/routines_repository.dart';
import 'package:memoroutines/shared/theme.dart';

class RoutinesScreen extends ConsumerWidget {
  const RoutinesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routines = ref.read(routinesPod);

    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKey.screensRoutinesTitle,
        actions: [
          IconButton(
            onPressed: () => AppNavigation().showFlexibleModal(
              context,
              initHeight: 0.92,
              maxHeight: 1,
              backgroundColor: context.colors.background,
              anchors: [0, 0.92, 1],
              builder: (_, scroll) => EditRoutineModal(
                scrollController: scroll,
              ),
            ),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: RoutinesList(
        listenRounines: routines.listenAll(),
      ),
    );
  }
}
