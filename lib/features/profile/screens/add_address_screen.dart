import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_images.dart';
import 'package:food_app/core/functions/navigation.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';
import 'package:food_app/core/widgets/app_button.dart';
import 'package:food_app/core/widgets/app_text_form_field.dart';
import 'package:food_app/features/profile/widgets/custom_chip.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  AppImages.map,
                  height: 290,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 40),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.patternColor,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 18,
                        color: AppColors.backgroundColor,
                      ),
                      onPressed: () {
                        pop(context);
                      },
                    ),
                  ),
                ),
                Positioned(
                  left: 170,
                  top: 90,
                  child: Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryColor,
                          spreadRadius: 2,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 25,
                bottom: 25,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("ADDRESS", style: TextStyles.caption1),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    prefixIcon: Icon(Icons.location_on),
                    hintText: '3235 Royal Ln. mesa, new jersy 34567',
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("STREET", style: TextStyles.caption1),
                            CustomTextFormField(hintText: 'Hasan Nagar'),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("POST CODE", style: TextStyles.caption1),
                            CustomTextFormField(hintText: '34567'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text("APPARTMENT", style: TextStyles.caption1),
                  CustomTextFormField(hintText: '345'),
                  SizedBox(height: 20),
                  Text("LABEL AS", style: TextStyles.caption1),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      CustomChip(
                        label: 'Home',
                        backgroundColor: AppColors.primaryColor,
                        labelColor: AppColors.backgroundColor
                        ),
                      SizedBox(width: 10),
                      CustomChip(
                        label: 'Work',
                        backgroundColor: AppColors.profileColor,
                        labelColor: AppColors.blackColor
                        ),
                      SizedBox(width: 10),
                      CustomChip(
                        label: 'Other',
                        backgroundColor: AppColors.profileColor,
                        labelColor: AppColors.blackColor
                        ),
                      SizedBox(width: 10),
                    ],
                  ),
                  SizedBox(height: 30),
                  MainButton(
                    text: "SAVE LOCATION",
                    textStyle: TextStyles.title.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.backgroundColor,
                    ),
                    onPressed: () {},
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
