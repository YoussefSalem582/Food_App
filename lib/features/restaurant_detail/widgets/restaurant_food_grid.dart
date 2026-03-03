import 'package:flutter/material.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';
import 'package:food_app/features/search/data/popular_food_model.dart';
import 'package:food_app/features/search/widgets/popular_food_card.dart';

class RestaurantFoodGrid extends StatelessWidget {
  const RestaurantFoodGrid({
    super.key,
    required this.categoryName,
    required this.foods,
  });

  final String categoryName;
  final List<PopularFoodModel> foods;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$categoryName (${foods.length})',
          style: TextStyles.title.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.blackColor,
          ),
        ),
        const SizedBox(height: 16),
        if (foods.isEmpty)
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Text(
                'No items in this category',
                style: TextStyles.body.copyWith(
                  color: AppColors.lightGrayColor,
                ),
              ),
            ),
          )
        else
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 16,
              mainAxisExtent: PopularFoodCard.cardHeight,
            ),
            itemCount: foods.length,
            itemBuilder: (context, index) =>
                PopularFoodCard(model: foods[index]),
          ),
      ],
    );
  }
}
