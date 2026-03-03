import 'package:flutter/material.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/widgets/circle_icon_button.dart';
import 'package:food_app/core/widgets/header_section.dart';

class RestaurantImageSection extends StatelessWidget {
  const RestaurantImageSection({
    super.key,
    required this.image,
    required this.onBackTap,
    this.onMoreTap,
    this.heroTag,
  });

  final String image;
  final VoidCallback onBackTap;
  final VoidCallback? onMoreTap;
  final String? heroTag;

  @override
  Widget build(BuildContext context) {
    final imageWidget = ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(24),
        bottomRight: Radius.circular(24),
      ),
      child: Image.network(
        image,
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
            Icons.restaurant,
            size: 64,
            color: AppColors.lightGrayColor,
          ),
        ),
      ),
    );

    return SizedBox(
      height: 280,
      child: Stack(
        children: [
          heroTag != null
              ? Hero(tag: heroTag!, child: imageWidget)
              : imageWidget,
          // Overlay header row (back + more buttons)
          Positioned(
            top: 16,
            left: 20,
            right: 20,
            child: HeaderSection(
              title: '',
              showBackButton: true,
              onLeadingTap: onBackTap,
              trailing: GestureDetector(
                onTap: onMoreTap,
                child: const CircleIconButton(
                  bgColor: AppColors.textfiedColor,
                  child: Icon(
                    Icons.more_horiz,
                    color: AppColors.blackColor,
                    size: 22,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
