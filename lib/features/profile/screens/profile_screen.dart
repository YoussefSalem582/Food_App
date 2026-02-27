import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/core/constants/app_images.dart';
import 'package:food_app/core/functions/navigation.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';
import 'package:food_app/features/profile/screens/profile_info_screen.dart';
import 'package:food_app/features/profile/widgets/profile_section_container.dart';
import 'package:food_app/features/profile/widgets/custom_list_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: TextStyles.appBarTitle),
        actions: [
          IconButton.filled(
            onPressed: () {},
            icon: Icon(Icons.more_horiz, size: 17),
            style: IconButton.styleFrom(
              backgroundColor: AppColors.profileColor,
            ),
          ),
          SizedBox(width: 10),
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
                height: 130,
                children: [
                  CustomListTile(
                    label: 'Personal Info',
                    assetName: AppImages.personInfoSvg,
                    onTap: () {
                      pushTo(context, ProfileInfoScreen());
                    },
                  ),
                  CustomListTile(
                    label: "Addresses",
                    assetName: AppImages.addressSvg,
                  ),
                ],
              ),
              SizedBox(height: 20),
              ProfileSectionContainer(height: 240, children: [
                CustomListTile(
                    label: "Cart",
                    assetName: AppImages.profilecartSvg,
                  ),
                  CustomListTile(
                    label: "Favourite",
                    assetName: AppImages.favSvg,
                  ),
                  CustomListTile(
                    label: "Notification",
                    assetName: AppImages.notificationSvg,
                  ),
                  CustomListTile(
                    label: "Payment Method",
                    assetName: AppImages.paymentSvg,
                  ),    
              ]),
              SizedBox(height: 20),
              ProfileSectionContainer(height: 190, children: [
                CustomListTile(
                    label: "FAQs",
                    assetName: AppImages.faqsSvg,
                  ),
                  CustomListTile(
                    label: "User Reviews",
                    assetName: AppImages.userReviewSvg,
                  ),
                  CustomListTile(
                    label: "Settings",
                    assetName: AppImages.settingsSvg,
                  ), 
              ]),
              SizedBox(height: 20),
              ProfileSectionContainer(height: 80, children: [
                CustomListTile(
                    label: "Log Out",
                    assetName: AppImages.logoutSvg,
                  ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
