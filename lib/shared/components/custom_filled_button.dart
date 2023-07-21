import 'package:flutter/material.dart';
import 'package:memoroutines/shared/theme.dart';

enum CustomFilledButtonType {
  bold,
  normal,
  ;
}

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.type = CustomFilledButtonType.normal,
    this.width = 150,
    this.height = 50,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Widget child;
  final CustomFilledButtonType type;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: FilledButton(
        onPressed: onPressed,
        style: _buildButtonStyle(context),
        child: _buildChild(context),
      ),
    );
  }

  Widget _buildChild(BuildContext context) {
    final bool isBold = type == CustomFilledButtonType.bold;

    return Center(
      child: DefaultTextStyle.merge(
        style: TextStyle(
          color: isBold
              ? context.colors.onBackground
              : context.colors.onBackground.withOpacity(0.8),
          height: 1,
          fontWeight: isBold ? FontWeight.w900 : FontWeight.w600,
          fontSize: 16,
        ),
        child: child,
      ),
    );
  }

  ButtonStyle _buildButtonStyle(BuildContext context) {
    final bool isBold = type == CustomFilledButtonType.bold;

    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(context.colors.background),
      overlayColor: MaterialStateProperty.all(
        context.colors.onBackground.withOpacity(0.05),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: context.colors.onBackground,
            width: isBold ? 4 : 2,
          ),
        ),
      ),
      padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
      foregroundColor: MaterialStateProperty.all(context.colors.background),
    );
  }
}
