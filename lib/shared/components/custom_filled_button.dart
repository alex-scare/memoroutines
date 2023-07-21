import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return withDecoration(
      FilledButton(onPressed: onPressed, style: style, child: child),
    );
  }

  static Widget withDecoration(Widget widget) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CustomPaint(
        painter: HatchPainter(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 4,
              color: Colors.black,
            ), // Increase border width
          ),
          child: widget,
        ),
      ),
    );
  }

  static final style = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.transparent),
    foregroundColor: MaterialStateProperty.all(Colors.black),
    overlayColor: MaterialStateProperty.all(Colors.grey),
    padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
  );
}

class HatchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final hatchPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1.5; // Increase hatch line thickness

    int step = 10;

    for (int i = 0; i < size.width; i += step) {
      for (int j = 0; j < size.height; j += step) {
        canvas.drawLine(
          Offset(i.toDouble(), j.toDouble() + step),
          Offset(i.toDouble() + step, j.toDouble()),
          hatchPaint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
