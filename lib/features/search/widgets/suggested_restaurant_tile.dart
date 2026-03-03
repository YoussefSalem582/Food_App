import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_images.dart';
import 'package:food_app/core/functions/navigation.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';
import 'package:food_app/core/widgets/custom_svg_picture.dart';
import 'package:food_app/features/home/data/restaurant_model.dart';
import 'package:food_app/features/restaurant_detail/screens/restaurant_detail_screen.dart';

class SuggestedRestaurantTile extends StatelessWidget {
  const SuggestedRestaurantTile({super.key, required this.model});

  final RestaurantModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => pushTo(context, RestaurantDetailScreen(model: model)),
      child: Row(
        children: [
          // Small square image
          Hero(
            tag: 'restaurant-image-${model.id}',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                model.image,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: AppColors.textfiedColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          // Name + rating
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name,
                  style: TextStyles.caption1.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.blackColor,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    CustomSvgPicture(
                      path: AppImages.starSvg,
                      width: 14,
                      height: 14,
                      color: AppColors.primaryColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      model.rating.toStringAsFixed(1),
                      style: TextStyles.caption2.copyWith(
                        color: AppColors.lightGrayColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
