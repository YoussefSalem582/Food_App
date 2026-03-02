import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_images.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';
import 'package:food_app/core/widgets/custom_svg_picture.dart';
import 'package:food_app/features/search/data/popular_food_model.dart';

class FoodDetailInfoSection extends StatelessWidget {
  const FoodDetailInfoSection({super.key, required this.model});

  final PopularFoodModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          model.name,
          style: TextStyles.headline.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.blackColor,
          ),
        ),
        const SizedBox(height: 8),
        // Restaurant row
        Row(
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.storefront_rounded,
                color: AppColors.primaryColor,
                size: 16,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              model.restaurantName,
              style: TextStyles.caption1.copyWith(
                color: AppColors.lightGrayColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Rating / Delivery / Time row
        Row(
          children: [
            CustomSvgPicture(path: AppImages.starSvg, height: 16, width: 16),
            const SizedBox(width: 4),
            Text(
              '${model.rating}',
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
              model.deliveryFee,
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
              model.deliveryTime,
              style: TextStyles.caption1.copyWith(color: AppColors.blackColor),
            ),
          ],
        ),
        const SizedBox(height: 20),
        // Description
        Text(
          model.description,
          style: TextStyles.body.copyWith(
            color: AppColors.lightGrayColor,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}
