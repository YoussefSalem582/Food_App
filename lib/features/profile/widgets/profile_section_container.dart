import 'package:flutter/material.dart';
import 'package:food_app/core/styles/app_colors.dart';

class ProfileSectionContainer extends StatelessWidget {
  const ProfileSectionContainer({
    super.key, required this.height, required this.children,
  });

  final double height;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.profileColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: children
        ),
      ),
    );
  }
}
