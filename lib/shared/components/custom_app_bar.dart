import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:memoroutines/shared/extensions/list.dart';
import 'package:memoroutines/shared/navigation/navigation.dart';
import 'package:styled_widget/styled_widget.dart';

class CustomAppBar extends HookWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.titleWidget,
    this.showBackButton = false,
    this.actions,
    this.centerTitle = true,
  }) : super(key: key);

  static const additionHeight = 8.0;

  @override
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight + additionHeight);
  }

  final String? title;
  final Widget? titleWidget;
  final bool showBackButton;
  final List<Widget>? actions;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    final actionWidgets = useRef<List<Widget>?>(
      actions?.mapWithIndex((element, i) {
        if (i == actions!.length - 1) {
          return element.padding(right: 8);
        }
        return element;
      }).toList(),
    );

    return Padding(
      padding: const EdgeInsets.only(top: additionHeight),
      child: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: centerTitle,
        leading: showBackButton
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                iconSize: 24,
                onPressed: () => context.navigateBack(),
              ).decorated().padding(left: 16)
            : null,
        scrolledUnderElevation: 0.0,
        actions: actionWidgets.value,
        automaticallyImplyLeading: false,
        title: titleWidget ?? (title != null ? Text(context.tr(title!)) : null),
      ),
    );
  }
}
