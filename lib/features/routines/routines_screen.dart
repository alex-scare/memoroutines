import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoroutines/features/routines/widgets/routines_list.dart';
import 'package:memoroutines/services/i18n/locale_key.g.dart';
import 'package:memoroutines/shared/components/custom_app_bar.dart';
import 'package:memoroutines/shared/navigation/navigation.dart';
import 'package:memoroutines/shared/repositories/routines_repository.dart';

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
            onPressed: () => context.goNamed(RouteName.newRoutine.name),
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
