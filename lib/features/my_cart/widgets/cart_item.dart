import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_images.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';
import 'package:food_app/features/my_cart/widgets/quantitybutton.dart';

Widget cartItem({required String price, required int quantity}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: 136,
        height: 117,
        decoration: BoxDecoration(
          color: AppColors.darkblackColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.asset(AppImages.pizza, fit: BoxFit.cover),
        ),
      ),

      const SizedBox(width: 16),

      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Pizza Calzone\nEuropean",
                    style: TextStyles.caption1.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  width: 27,
                  height: 27,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.close, size: 16, color: Colors.white),
                ),
              ],
            ),

            const SizedBox(height: 8),

            Text(
              price,
              style: TextStyles.caption1.copyWith(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Row(
              children: [
                Text(
                  '14"',
                  style: TextStyles.caption1.copyWith(color: Colors.white70),
                ),
                const Spacer(),
                quantityButton(Icons.remove),
                const SizedBox(width: 10),
                Text(
                  quantity.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(width: 10),
                quantityButton(Icons.add),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
