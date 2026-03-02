import 'package:flutter/material.dart';
import 'package:food_app/core/functions/navigation.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';
import 'package:food_app/features/food_detail/screens/food_detail_screen.dart';

import '../data/popular_food_model.dart';

class PopularFoodCard extends StatelessWidget {
  const PopularFoodCard({super.key, required this.model, this.onAddTap});

  final PopularFoodModel model;
  final VoidCallback? onAddTap;

  static const double cardHeight = 190;
  static const double imageSize = 100;
  static const double overlapTop = 48;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => pushTo(context, FoodDetailScreen(model: model)),
      child: SizedBox(
        height: cardHeight,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Card body that occupies the lower portion of the cell
            Positioned(
              top: overlapTop,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
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
                padding: const EdgeInsets.fromLTRB(10, 58, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      model.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.caption1.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.blackColor,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      model.restaurantName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.caption2.copyWith(
                        color: AppColors.lightGrayColor,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          model.price,
                          style: TextStyles.caption1.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.blackColor,
                          ),
                        ),
                        GestureDetector(
                          onTap: onAddTap,
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: const BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Food image sits at top of cell, overlaps the card edge
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: imageSize,
              child: Center(
                child: Hero(
                  tag: 'food-image-${model.id}',
                  child: Image.network(
                    model.image,
                    width: imageSize,
                    height: imageSize,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: imageSize,
                      height: imageSize,
                      decoration: BoxDecoration(
                        color: AppColors.textfiedColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
