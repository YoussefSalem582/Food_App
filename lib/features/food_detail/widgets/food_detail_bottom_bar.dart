import 'package:flutter/material.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';
import 'package:food_app/core/widgets/app_button.dart';

class FoodDetailBottomBar extends StatelessWidget {
  const FoodDetailBottomBar({
    super.key,
    required this.totalPrice,
    required this.quantity,
    required this.onDecrease,
    required this.onIncrease,
    required this.onAddToCart,
  });

  final String totalPrice;
  final int quantity;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;
  final VoidCallback onAddToCart;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Price + quantity row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                totalPrice,
                style: TextStyles.headline.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blackColor,
                ),
              ),
              // Quantity selector
              Container(
                decoration: BoxDecoration(
                  color: AppColors.blackColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: onDecrease,
                      child: const Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        '$quantity',
                        style: TextStyles.caption1.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onIncrease,
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          MainButton(text: 'ADD TO CART', onPressed: onAddToCart),
        ],
      ),
    );
  }
}
