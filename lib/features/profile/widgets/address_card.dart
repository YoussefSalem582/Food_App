import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/core/constants/app_images.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
    required this.assetName,
    required this.title,
    required this.address,
  });

  final String assetName;
  final String title;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.profileColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Align(
              alignment: Alignment(0, -1),
              child: Container(
                width: 50, 
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.backgroundColor,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    assetName,
                    width: 20, 
                    height: 20,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: TextStyles.caption1.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Spacer(),
                      SvgPicture.asset(AppImages.editIconSvg),
                      SizedBox(width: 20),
                      SvgPicture.asset(AppImages.deleteIconSvg),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    address,
                    style: TextStyles.caption1.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightGrayColor,
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
