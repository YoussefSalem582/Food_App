import 'package:flutter/material.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';
import 'package:food_app/core/widgets/rating_delivery_row.dart';
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
        RatingDeliveryRow(
          rating: model.rating,
          deliveryFee: model.deliveryFee,
          deliveryTime: model.deliveryTime,
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
