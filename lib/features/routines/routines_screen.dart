import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:memoroutines/features/routines/widgets/routines_list.dart';
import 'package:memoroutines/services/i18n/locale_key.g.dart';
import 'package:memoroutines/shared/components/custom_app_bar.dart';
import 'package:memoroutines/shared/helpers/spacing.dart';
import 'package:memoroutines/shared/navigation/navigation.dart';
import 'package:styled_widget/styled_widget.dart';

// TODO add search bar, add sorting options, add filtering options,
// end of TODO redesign card (remove base info, add streaks info and last completed date)
class RoutinesScreen extends StatelessWidget {
  const RoutinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKey.screensRoutinesTitle,
        actions: [
          IconButton(
            onPressed: () => context.pushNamed(RouteName.newRoutine.name),
            icon: const Icon(Icons.add_circle_outline_rounded),
            iconSize: 32,
          )
        ],
      ),
      body: const RoutinesList().padding(horizontal: Spacing.sm),
    );
  }
}
