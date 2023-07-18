import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoroutines/features/routine_new/data/routine_new_pod.dart';
import 'package:memoroutines/shared/components/custom_app_bar.dart';

class RoutineNewAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const RoutineNewAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize {
    return const CustomAppBar().preferredSize;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formPod = ref.watch(routineNewPod(null));

    return CustomAppBar(
      titleWidget: Text(
        formPod.name.isEmpty ? 'New Routine' : formPod.name,
      ),
    );
  }
}
