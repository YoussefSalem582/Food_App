import 'package:flutter/material.dart';

import '../../../core/styles/app_text_styles.dart';
import '../data/dummy_data.dart';
import 'category_card.dart';

class AllCategoriesBuilder extends StatelessWidget {
  const AllCategoriesBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('All Categories', style: TextStyles.title),
            Spacer(),
            TextButton(
              onPressed: () {},
              child: Text('See all', style: TextStyles.caption1),
            ),
          ],
        ),
        SizedBox(
          height: 170,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return CategoryCard(model: categories[index]);
            },
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: categories.length,
          ),
        ),
      ],
    );
  }
}
