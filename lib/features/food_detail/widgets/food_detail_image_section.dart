import 'package:flutter/material.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/widgets/circle_icon_button.dart';
import 'package:food_app/features/search/data/popular_food_model.dart';

class FoodDetailImageSection extends StatelessWidget {
  const FoodDetailImageSection({
    super.key,
    required this.model,
    required this.isFavorite,
    required this.onBackTap,
    required this.onFavoriteTap,
  });

  final PopularFoodModel model;
  final bool isFavorite;
  final VoidCallback onBackTap;
  final VoidCallback onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Hero-wrapped food image
        Hero(
          tag: 'food-image-${model.id}',
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
            child: Image.network(
              model.image,
              width: double.infinity,
              height: 280,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Container(
                width: double.infinity,
                height: 280,
                decoration: const BoxDecoration(
                  color: AppColors.textfiedColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: const Icon(
                  Icons.fastfood_rounded,
                  size: 64,
                  color: AppColors.lightGrayColor,
                ),
              ),
            ),
          ),
        ),
        // Overlay buttons
        Positioned(
          top: 16,
          left: 20,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onBackTap,
                child: const CircleIconButton(
                  bgColor: Colors.white,
                  child: Icon(
                    Icons.chevron_left_rounded,
                    color: AppColors.blackColor,
                    size: 22,
                  ),
                ),
              ),
              GestureDetector(
                onTap: onFavoriteTap,
                child: CircleIconButton(
                  bgColor: Colors.white,
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: AppColors.primaryColor,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
