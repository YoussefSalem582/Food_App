import 'package:flutter/material.dart';
import 'package:food_app/features/home/widgets/restaurant_card.dart';

import '../../../core/styles/app_text_styles.dart';
import '../data/dummy_data.dart';

class OpenRestaurantsBuilder extends StatelessWidget {
  const OpenRestaurantsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Open Restaurants', style: TextStyles.title),
            Spacer(),
            TextButton(
              onPressed: () {},
              child: Text('See all', style: TextStyles.caption1),
            ),
          ],
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return RestaurantCard(model: restaurants[index]);
          },
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemCount: restaurants.length,
        ),
      ],
    );
  }
}
