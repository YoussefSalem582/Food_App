import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/constants/app_images.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground();

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
              AppImages.patternBackgroundSvg,
              fit: BoxFit.contain,
              width: double.infinity,
              alignment: Alignment.topCenter,
            ),
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(
                    'Log In',
                    textAlign: TextAlign.center,
                    style: TextStyles.headline.copyWith(
                      color: AppColors.backgroundColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Please sign in to your existing account',
                    textAlign: TextAlign.center,
                    style: TextStyles.title.copyWith(
                      color: AppColors.backgroundColor,
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
