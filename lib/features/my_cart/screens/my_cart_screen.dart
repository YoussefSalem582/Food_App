import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/core/constants/app_fonts.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';
import 'package:food_app/core/widgets/app_button.dart';
import 'package:food_app/core/widgets/app_text_form_field.dart';
import 'package:food_app/core/widgets/appbackButton.dart';
import 'package:food_app/features/my_cart/screens/payment_screen.dart';
import 'package:food_app/features/my_cart/widgets/cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.secondaryColor,
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            AppBackButton(
                              backgroundColor: AppColors.darkblackColor,
                              iconColor: AppColors.backgroundColor,
                            ), // زرار الرجوع بتاعك
                            const SizedBox(width: 12),
                            Text(
                              "Cart",
                              style: TextStyles.appBarTitle.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "DONE",
                          style: TextStyles.caption1.copyWith(
                            color: AppColors.doneColor,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.doneColor,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    cartItem(price: "\$64", quantity: 2),

                    const SizedBox(height: 20),

                    cartItem(price: "\$32", quantity: 1),
                  ],
                ),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(32, 32, 32, 20),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'DELIVERY ADDRESS',
                                style: TextStyles.caption1.copyWith(
                                  color: Color(0XffA0A5BA),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.Sen,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'EDIT',
                                  style: TextStyles.caption1.copyWith(
                                    color: AppColors.primaryColor,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          CustomTextFormField(
                            enabled: false,
                            keyboardType: TextInputType.emailAddress,
                            hintText: '2118 Thornridge Cir. Syracuse',
                          ),
                          SizedBox(height: 36),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
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
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Breakdown >',
                                  style: TextStyles.caption1.copyWith(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 30),

                          Center(
                            child: MainButton(
                              text: 'PLACE ORDER',
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const PaymentScreen(),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
