import 'package:flutter/material.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';
import 'package:food_app/core/widgets/circle_icon_button.dart';
import 'package:food_app/core/widgets/custom_svg_picture.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
    required this.title,
    this.subtitle,
    this.label,
    this.showBackButton = false,
    this.cartCount = 0,
    this.onLeadingTap,
    this.onCartTap,
  });

  final String title;
  final String? label;
  final String? subtitle;
  final bool showBackButton;
  final int cartCount;
  final VoidCallback? onLeadingTap;
  final VoidCallback? onCartTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Leading button
        GestureDetector(
          onTap:
              onLeadingTap ??
              (showBackButton ? () => Navigator.pop(context) : null),
          child: CircleIconButton(
            bgColor: AppColors.textfiedColor,
            child: showBackButton
                ? const Icon(
                    Icons.chevron_left_rounded,
                    color: AppColors.blackColor,
                    size: 22,
                  )
                : CustomSvgPicture(
                    path: 'assets/icons/menu.svg',
                    color: AppColors.blackColor,
                  ),
          ),
        ),
        const SizedBox(width: 16),
        // Title section
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (label != null)
                Text(
                  label!,
                  style: TextStyles.caption2.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyles.caption1.copyWith(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: AppColors.blackColor,
                      size: 18,
                    ),
                  ],
                ],
              ),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: TextStyles.caption2.copyWith(
                    color: AppColors.lightGrayColor,
                  ),
                ),
            ],
          ),
        ),
        // Cart button with badge
        GestureDetector(
          onTap: onCartTap,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              CircleIconButton(
                bgColor: AppColors.blackColor,
                child: CustomSvgPicture(
                  path: 'assets/icons/cart.svg',
                  color: Colors.white,
                ),
              ),
              if (cartCount > 0)
                Positioned(
                  top: -4,
                  right: -4,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '$cartCount',
                        style: TextStyles.caption2.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
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
