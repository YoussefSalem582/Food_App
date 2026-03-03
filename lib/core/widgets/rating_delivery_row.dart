import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_images.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';
import 'package:food_app/core/widgets/custom_svg_picture.dart';

class RatingDeliveryRow extends StatelessWidget {
  const RatingDeliveryRow({
    super.key,
    required this.rating,
    required this.deliveryFee,
    required this.deliveryTime,
  });

  final double rating;
  final String deliveryFee;
  final String deliveryTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomSvgPicture(path: AppImages.starSvg, height: 16, width: 16),
        const SizedBox(width: 4),
        Text(
          rating.toStringAsFixed(1),
          style: TextStyles.caption1.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.blackColor,
          ),
        ),
        const SizedBox(width: 24),
        CustomSvgPicture(
          path: AppImages.deliverySvg,
          height: 16,
          width: 16,
          color: AppColors.primaryColor,
        ),
        const SizedBox(width: 4),
        Text(
          deliveryFee,
          style: TextStyles.caption1.copyWith(color: AppColors.blackColor),
        ),
        const SizedBox(width: 24),
        CustomSvgPicture(
          path: AppImages.clockSvg,
          height: 16,
          width: 16,
          color: AppColors.primaryColor,
        ),
        const SizedBox(width: 4),
        Text(
          deliveryTime,
          style: TextStyles.caption1.copyWith(color: AppColors.blackColor),
        ),
      ],
    );
  }
}
