import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.isMainAction = false,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Widget child;
  final bool isMainAction;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
          Container(
            width: 150, // width of button
            height: 50, // height of button
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black,
                width: isMainAction ? 4 : 2,
              ),
            ),
          ),
          CustomPaint(
            painter: DottedPatternPainter(),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onPressed,
                child: Container(
                  width: 150,
                  height: 50,
                  alignment: Alignment.center,
                  child: DefaultTextStyle.merge(
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    child: child,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// The rest of your code remains the same.

class DottedPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const dotRadius = 1.0;
    const offset = 2 * dotRadius + 4;
    final dotPaint = Paint()..color = Colors.black;

    for (double y = 0; y < size.height; y += offset) {
      for (double x = 0; x < size.width; x += offset) {
        canvas.drawCircle(Offset(x, y), dotRadius, dotPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
