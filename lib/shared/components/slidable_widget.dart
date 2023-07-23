import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:memoroutines/shared/extensions/list.dart';
import 'package:memoroutines/shared/theme.dart';

class SlidableWidgetAction {
  final Icon icon;
  final void Function(BuildContext) onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final bool isDismissable;

  const SlidableWidgetAction({
    required this.icon,
    required this.onPressed,
    required this.backgroundColor,
    required this.foregroundColor,
    this.isDismissable = false,
  });
}

// TODO add watching current action for background color customization
// TODO dismissable works badly. research other libraries
class SlidableWidget extends StatelessWidget {
  const SlidableWidget({
    super.key,
    required this.child,
    this.endActions,
    this.startActions,
    this.borderRadius = 0,
  });

  final Widget child;
  final List<SlidableWidgetAction>? endActions;
  final List<SlidableWidgetAction>? startActions;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: context.colors.error,
      ),
      child: Slidable(
        endActionPane:
            endActions == null ? null : _buildActionPane(context, endActions!),
        startActionPane: startActions == null
            ? null
            : _buildActionPane(context, startActions!),
        child: child,
      ),
    );
  }

  ActionPane _buildActionPane(
    BuildContext context,
    List<SlidableWidgetAction> actions,
  ) {
    final dismissableAction =
        actions.firstWhereOrNull((action) => action.isDismissable);

    return ActionPane(
      extentRatio: 0.3,
      dismissible: dismissableAction == null
          ? null
          : SlidableAction(
              onPressed: dismissableAction.onPressed,
              backgroundColor: dismissableAction.backgroundColor,
              foregroundColor: dismissableAction.foregroundColor,
              icon: dismissableAction.icon.icon,
            ),
      motion: const StretchMotion(),
      children: endActions!.map((action) {
        return SlidableAction(
          onPressed: action.onPressed,
          backgroundColor: action.backgroundColor,
          foregroundColor: action.foregroundColor,
          icon: action.icon.icon,
        );
      }).toList(),
    );
  }
}
