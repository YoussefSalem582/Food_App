import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final double iconSize;

  const AppBackButton({
    super.key,
    this.onTap,
    this.backgroundColor = Colors.white,
    this.iconColor = Colors.black,
    this.size = 44,
    this.iconSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(Icons.arrow_back_ios_new, size: iconSize),
        color: iconColor,
        onPressed: onTap ?? () => Navigator.pop(context),
      ),
    );
  }
}