import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/core/constants/app_images.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';

class IngredientsSection extends StatelessWidget {
  const IngredientsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'INGRIDENTS',
          style: TextStyles.caption1.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: SvgPicture.asset(AppImages.ingridentsSvg, fit: BoxFit.contain),
        ),
      ],
    );
  }
}
