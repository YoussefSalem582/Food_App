import 'package:flutter/material.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';

import '../data/search_dummy_data.dart';
import 'suggested_restaurant_tile.dart';

class SuggestedRestaurantsBuilder extends StatelessWidget {
  const SuggestedRestaurantsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Suggested Restaurants',
          style: TextStyles.title.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.blackColor,
          ),
        ),
        const SizedBox(height: 12),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: suggestedRestaurants.length,
          separatorBuilder: (_, _) =>
              const Divider(height: 24, thickness: 1, color: Color(0xffF0F5FA)),
          itemBuilder: (_, i) =>
              SuggestedRestaurantTile(model: suggestedRestaurants[i]),
        ),
      ],
    );
  }
}
