import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:memoroutines/shared/components/custom_app_bar.dart';
import 'package:memoroutines/shared/theme.dart';

class ScheduleAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const ScheduleAppBar({
    Key? key,
    required this.currentDate,
    required this.goToNextPage,
    required this.goToPrevPage,
    required this.goToToday,
  }) : super(key: key);

  final String currentDate;
  final VoidCallback goToPrevPage;
  final VoidCallback goToNextPage;
  final VoidCallback goToToday;

  @override
  Size get preferredSize {
    return const CustomAppBar().preferredSize;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomAppBar(
      titleWidget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Row(
            children: [
              IconButton(
                icon: const Icon(LineIcons.caretLeft),
                onPressed: goToPrevPage,
              ),
              GestureDetector(
                onLongPress: () {
                  HapticFeedback.lightImpact();
                  goToToday();
                },
                child: SizedBox(
                  width: 100,
                  child: Text(
                    currentDate,
                    style: context.texts.titleLarge!
                        .copyWith(fontFamily: context.alterFont.fontFamily),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(LineIcons.caretRight),
                onPressed: goToNextPage,
              ),
            ],
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
