import 'package:flutter/material.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';
import 'package:food_app/core/widgets/rating_delivery_row.dart';
import 'package:food_app/features/home/data/restaurant_model.dart';

class RestaurantInfoSection extends StatelessWidget {
  const RestaurantInfoSection({super.key, required this.model});

  final RestaurantModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Rating / Delivery / Time row
        RatingDeliveryRow(
          rating: model.rating,
          deliveryFee: model.deliveryFee,
          deliveryTime: model.deliveryTime,
        ),
        const SizedBox(height: 16),
        // Restaurant name
        Text(
          model.name,
          style: TextStyles.headline.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.blackColor,
          ),
        ),
        const SizedBox(height: 12),
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
