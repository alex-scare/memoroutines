import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:memoroutines/shared/helpers/spacing.dart';
import 'package:memoroutines/shared/models/repetition.dart';
import 'package:memoroutines/shared/models/routine.dart';
import 'package:memoroutines/shared/theme.dart';

class ScheduleRepetition extends StatelessWidget {
  const ScheduleRepetition({
    Key? key,
    required this.repetition,
    required this.onComplete,
  }) : super(key: key);

  final Repetition repetition;
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    var routine = repetition.routine.value!;
    var frequencyLabel = routine.frequency.label.tr();
    var durationLabel = routine.singleRepetitionDurationString(context);
    var subtitle = '$frequencyLabel - $durationLabel';

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: Spacing.md),
      leading: Icon(routine.icon.icon, color: Colors.black),
      title: Text(
        routine.name,
        style: context.texts.titleMedium!
            .copyWith(fontFamily: context.alterFont.fontFamily),
      ),
      onTap: onComplete,
      subtitle: Text(subtitle),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: Icon(
              switch (repetition.status) {
                RepetitionStatus.completed => LineIcons.checkSquareAlt,
                _ => LineIcons.square,
              },
              color: Colors.black,
            ),
            onPressed: onComplete,
          ),
          IconButton(
            icon: const Icon(LineIcons.history, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
