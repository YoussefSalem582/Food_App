import 'package:flutter/material.dart';
import 'package:food_app/features/home/widgets/info_chip.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_styles.dart';
import '../data/restaurant_model.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({super.key, required this.model});

  final RestaurantModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Restaurant image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              model.image,
              width: double.infinity,
              height: 160,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name
                Text(
                  model.name,
                  style: TextStyles.title.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.blackColor,
                  ),
                ),
                const SizedBox(height: 4),
                // Tags
                Text(
                  model.tags.join(' - '),
                  style: TextStyles.caption2.copyWith(
                    color: AppColors.lightGrayColor,
                  ),
                ),
                const SizedBox(height: 10),
                // Info row
                Row(
                  children: [
                    InfoChip(
                      svgPath: AppImages.starSvg,
                      iconColor: AppColors.primaryColor,
                      label: model.rating.toStringAsFixed(1),
                    ),
                    const SizedBox(width: 16),
                    InfoChip(
                      svgPath: AppImages.deliverySvg,
                      iconColor: AppColors.primaryColor,
                      label: model.deliveryFee,
                    ),
                    const SizedBox(width: 16),
                    InfoChip(
                      svgPath: AppImages.clockSvg,
                      iconColor: AppColors.primaryColor,
                      label: model.deliveryTime,
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
