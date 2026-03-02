import 'package:flutter/material.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';

import '../data/search_dummy_data.dart';
import 'popular_food_card.dart';

class PopularFastFoodBuilder extends StatelessWidget {
  const PopularFastFoodBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Popular Fast Food',
          style: TextStyles.title.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.blackColor,
          ),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 0.85,
          ),
          itemCount: popularFoods.length,
          itemBuilder: (_, i) => PopularFoodCard(model: popularFoods[i]),
        ),
      ],
    );
  }
}
