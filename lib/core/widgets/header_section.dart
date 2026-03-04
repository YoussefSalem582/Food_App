import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_images.dart';
import 'package:food_app/core/functions/navigation.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';
import 'package:food_app/core/widgets/circle_icon_button.dart';
import 'package:food_app/core/widgets/custom_svg_picture.dart';
import 'package:food_app/features/my_cart/screens/my_cart_screen.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
    required this.title,
    this.subtitle,
    this.label,
    this.showBackButton = false,
    this.showDropdown = false,
    this.cartCount = 0,
    this.onLeadingTap,
    this.onCartTap,
    this.trailing,
  });

  final String title;
  final String? label;
  final String? subtitle;
  final bool showBackButton;

  /// Shows a dropdown arrow next to the title (independent of subtitle)
  final bool showDropdown;
  final int cartCount;
  final VoidCallback? onLeadingTap;
  final VoidCallback? onCartTap;

  /// When provided, replaces the cart button entirely
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Leading button
        GestureDetector(
          onTap: onLeadingTap ?? (showBackButton ? () => pop(context) : null),
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
              if (showDropdown)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: AppColors.lightGrayColor.withOpacity(0.25),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: TextStyles.caption1.copyWith(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 2),
                      const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColors.blackColor,
                        size: 18,
                      ),
                    ],
                  ),
                )
              else
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
        // Trailing: custom widget or default cart button
        if (trailing != null)
          trailing!
        else
          CircleIconButton(
            onTap: onCartTap ?? () => pushTo(context, const CartScreen()),
            bgColor: AppColors.blackColor,
            child: CustomSvgPicture(
              path: AppImages.cartSvg,
              color: Colors.white,
            ),
          ),
      ],
    );
  }
}
