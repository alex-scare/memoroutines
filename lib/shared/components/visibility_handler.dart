import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VisibleCheckWidget extends StatelessWidget {
  const VisibleCheckWidget({
    Key? key,
    required this.visibilityKey,
    required this.child,
    this.onVisible,
    this.onInvisible,
    this.percentage = 95,
  }) : super(key: key);
  final Widget child;
  final Key visibilityKey;
  final void Function()? onVisible;
  final void Function()? onInvisible;
  final int percentage;

  void _onVisibilityChanged(VisibilityInfo visibilityInfo) {
    var visiblePercentage = visibilityInfo.visibleFraction * 100;
    if (visiblePercentage > percentage) {
      onVisible?.call();
    } else {
      onInvisible?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: visibilityKey,
      onVisibilityChanged: _onVisibilityChanged,
      child: child,
    );
  }
}
