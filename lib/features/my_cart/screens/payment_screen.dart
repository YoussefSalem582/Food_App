import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/core/constants/app_images.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';
import 'package:food_app/core/widgets/app_button.dart';
import 'package:food_app/core/widgets/appbackButton.dart';
import 'package:food_app/features/my_cart/screens/payment_successfull_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 10),

              Row(
                children: [
                  const AppBackButton(backgroundColor: AppColors.textfiedColor),
                  const SizedBox(width: 16),
                  Text("Payment", style: TextStyles.appBarTitle),
                ],
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _paymentItem(AppImages.cashSvg, "Cash", 0),
                  _paymentItem(AppImages.visaSvg, "Visa", 1),
                  _paymentItem(AppImages.masterCardSvg, "Mastercard", 2),
                  _paymentItem(AppImages.paypaldSvg, "Pay pal", 3),
                ],
              ),

              const SizedBox(height: 30),

              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.textfiedColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    SvgPicture.asset(AppImages.masterCardSvg, height: 100),
                    const SizedBox(height: 20),
                    Text(
                      "No master card added",
                      style: TextStyles.title.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkblackColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "You can add a mastercard and\nsave it for later",
                      textAlign: TextAlign.center,
                      style: TextStyles.caption2.copyWith(
                        color: Color(0xff2D2D2D),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              SizedBox(height: 15),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  overlayColor: AppColors.primaryColor,
                  side: BorderSide(color: AppColors.primaryColor),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "+ ADD NEW",
                  style: TextStyles.caption1.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),

              const Spacer(),

              Row(
                children: [
                  Text(
                    'TOTAL : ',
                    style: TextStyles.caption1.copyWith(
                      color: const Color(0XffA0A5BA),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    '\$96',
                    style: TextStyles.caption1.copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              MainButton(
                text: "PAY & CONFIRM",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrderAcceptedScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _paymentItem(String svg, String title, int index) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.textfiedColor,
              borderRadius: BorderRadius.circular(14),
              border: isSelected
                  ? Border.all(color: AppColors.primaryColor, width: 2)
                  : null,
            ),
            child: SvgPicture.asset(svg, height: 30),
          ),
          const SizedBox(height: 8),
          Text(title, style: TextStyles.caption1),
        ],
      ),
    );
  }
}
