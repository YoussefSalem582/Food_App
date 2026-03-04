import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';
import 'package:food_app/core/widgets/appbackButton.dart';

class AuthBackground extends StatelessWidget {
  final String title;
  final String subtitle;
  final String title_for_email;
  final bool showBackButton;
  final String backgroundImage;
  final VoidCallback? onBackPressed;

  const AuthBackground({
    super.key,
    required this.title,
    required this.subtitle,
    required this.title_for_email,
    this.showBackButton = false,
    required this.backgroundImage,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.secondaryColor,
        child: Stack(
          children: [
            SvgPicture.asset(
              backgroundImage,
              fit: BoxFit.contain,
              width: double.infinity,
              alignment: Alignment.topCenter,
            ),

            if (showBackButton)
              Positioned(
                top: MediaQuery.of(context).padding.top + 16,
                left: 20,
                child: AppBackButton(
                  onTap:
                      onBackPressed ?? () => Navigator.of(context).maybePop(),
                ),
              ),

            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyles.headline.copyWith(
                      color: AppColors.backgroundColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyles.title.copyWith(
                      color: AppColors.backgroundColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    title_for_email,
                    textAlign: TextAlign.center,
                    style: TextStyles.title.copyWith(
                      color: AppColors.backgroundColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
