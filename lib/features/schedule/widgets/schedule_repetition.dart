import 'package:flutter/cupertino.dart';
import 'package:memoroutines/shared/models/repetition.dart';

class ScheduleRepetition extends StatelessWidget {
  const ScheduleRepetition({
    Key? key,
    required this.repetition,
    required this.onComplete,
    required this.onCompleteWithTimer,
  }) : super(key: key);

  final Repetition repetition;
  final VoidCallback onComplete;
  final VoidCallback onCompleteWithTimer;

  @override
  Widget build(BuildContext context) {
    return CupertinoContextMenu(
      actions: [
        CupertinoContextMenuAction(
          onPressed: onComplete,
          child: const Text('Complete'),
        ),
        CupertinoContextMenuAction(
          onPressed: onCompleteWithTimer,
          child: const Text('Complete with timer'),
        ),
      ],
      child: Container(
        decoration: BoxDecoration(
          color: switch (repetition.status) {
            RepetitionStatus.upcoming => const Color(0xFFE0E0E0),
            RepetitionStatus.missed => const Color(0xFFEF9A9A),
            RepetitionStatus.completed => const Color(0xFFA5D6A7),
            _ => const Color(0xFFE0E0E0),
          },
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            repetition.routine.value!.name,
            style: const TextStyle(
              color: Color(0xFFFAFAFA),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
