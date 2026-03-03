import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_images.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';
import 'package:food_app/core/widgets/app_button.dart';
import 'package:food_app/core/widgets/custom_svg_picture.dart';
import 'package:food_app/features/main/main_app_screen.dart';

class OrderAcceptedScreen extends StatelessWidget {
  const OrderAcceptedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 50),

            CustomSvgPicture(path: AppImages.orderacceptedSvg, height: 250),

            const Spacer(),

            Text(
              'Congratulation!',
              textAlign: TextAlign.center,
              style: TextStyles.appBarTitle.copyWith(
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'You successfully maked a payment,\nenjoy our service!',
              textAlign: TextAlign.center,
              style: TextStyles.body.copyWith(color: AppColors.sidetextColor),
            ),
            const SizedBox(height: 150),

            MainButton(
              text: 'TRACK ORDER',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainAppScreen(),
                  ),
                );
              },
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
