import 'package:flutter/material.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_styles.dart';
import '../data/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.model});

  final CategoryModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      // Card with image and name
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Card
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.07),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            // Image inside the card
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Image.asset(model.image, fit: BoxFit.contain),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Name below the card
          Text(
            model.name,
            textAlign: TextAlign.center,
            style: TextStyles.caption1.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
