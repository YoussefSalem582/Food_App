import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key,
    required this.bgColor,
    required this.child,
    this.onTap,
  });

  final Color bgColor;
  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
        child: Center(child: child),
      ),
    );
  }
}
