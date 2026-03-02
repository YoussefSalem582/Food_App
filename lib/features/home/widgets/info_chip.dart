import 'package:flutter/material.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';
import 'package:food_app/core/widgets/custom_svg_picture.dart';

class InfoChip extends StatelessWidget {
  const InfoChip({
    super.key,
    required this.svgPath,
    required this.iconColor,
    required this.label,
  });

  final String svgPath;
  final Color iconColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomSvgPicture(
          path: svgPath,
          width: 18,
          height: 18,
          color: iconColor,
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyles.caption2.copyWith(
            color: AppColors.blackColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
