import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/core/constants/app_images.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/widgets/custom_svg_picture.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int currentIndex = 0;

  List<Widget> screens = [
    Center(child: Text("Home Page")),
    Center(child: Text("My-order Page")),
    Center(child: Text("Profile Page")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.ightColor,
        selectedLabelStyle: TextStyle(fontSize: 12),
        unselectedLabelStyle: TextStyle(fontSize: 12),
        items: [
          BottomNavigationBarItem(
            icon: CustomSvgPicture(
              path: AppImages.homeSvg,
              height: 24,
              width: 24,
              color: AppColors.blackColor,
            ),
            label: "Home",
            activeIcon: CustomSvgPicture(
              path: AppImages.homeSvg,
              color: AppColors.primaryColor,
              height: 24,
              width: 24,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.orderSvg, height: 24, width: 24),
            label: "My Orders",
            activeIcon: CustomSvgPicture(
              path: AppImages.orderSvg,
              color: AppColors.primaryColor,
              height: 24,
              width: 24,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.profileSvg, height: 24, width: 24),
            label: "Profile",
            activeIcon: CustomSvgPicture(
              path: AppImages.profileSvg,
              color: AppColors.primaryColor,
              height: 24,
              width: 24,
            ),
          ),
        ],
      ),
    );
  }
}
