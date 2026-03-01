import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/core/constants/app_fonts.dart';
import 'package:food_app/core/constants/app_images.dart';
import 'package:food_app/core/functions/navigation.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';
import 'package:food_app/features/profile/screens/profile_edit_screen.dart';
import 'package:food_app/features/profile/widgets/profile_section_container.dart';
import 'package:food_app/features/profile/widgets/custom_list_tile.dart';

class ProfileInfoScreen extends StatelessWidget {
  const ProfileInfoScreen({super.key});

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
        title: Text("Personal Info", style: TextStyles.appBarTitle),
        actions: [
          TextButton(
            onPressed: () {
              pushTo(context, ProfileEditScreen());
            },
            style: TextButton.styleFrom(
              textStyle: TextStyle(
                decoration: TextDecoration.underline, 
              ),
            ),
            child: Text(
              "EDIT",
              style: TextStyles.caption1.copyWith(
                decoration: TextDecoration.underline,
                color: AppColors.primaryColor,
                fontFamily: AppFonts.Sen
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  ClipOval(
                    child: SvgPicture.asset(
                      AppImages.profilePicSvg,
                      width: 100,
                      height: 100,
                    ),
                  ),
                  SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Vishal Khadok",
                        style: TextStyles.headline.copyWith(fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "I love fast food",
                        style: TextStyles.caption1.copyWith(
                          color: AppColors.lightGrayColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              ProfileSectionContainer(
                height: 190,
                children: [
                  CustomListTile(
                    label: "FULL NAME",
                    field: "Vishal Khadok",
                    assetName: AppImages.faqsSvg,
                    trailing: SizedBox(),
                  ),
                  CustomListTile(
                    label: "EMAIL",
                    field: "hello@halallab.com",
                    assetName: AppImages.emailSvg,
                    trailing: SizedBox()
                  ),
                  CustomListTile(
                    label: "PHONE NUMBER",
                    field: "408-841-0926",
                    assetName: AppImages.callSvg,
                    trailing: SizedBox()
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
