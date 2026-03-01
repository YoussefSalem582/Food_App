import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_images.dart';
import 'package:food_app/core/functions/navigation.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';
import 'package:food_app/core/widgets/app_button.dart';
import 'package:food_app/features/profile/screens/add_address_screen.dart';
import 'package:food_app/features/profile/widgets/address_card.dart';

class ProfileAddressScreen extends StatelessWidget {
  const ProfileAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFF7F9FC),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, size: 18),
              onPressed: () {
                pop(context);
              },
            ),
          ),
        ),
        title: Text("My Address", style: TextStyles.appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            AddressCard(
              assetName: AppImages.homeAddressSvg,
              title: "HOME",
              address: "2464 Royal Ln. Mesa, New Jersey 45463",
            ),
            SizedBox(height: 20),
            AddressCard(
              assetName: AppImages.workAddressSvg,
              title: "WORK",
              address: "3891 Ranchview Dr. Richardson, California 62639",
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: MainButton(
          text: "ADD NEW ADDRESS",
          textStyle: TextStyles.title.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.backgroundColor,
          ),
          onPressed: () {
            pushTo(context, AddAddressScreen());
          },
        ),
      ),
    );
  }
}
