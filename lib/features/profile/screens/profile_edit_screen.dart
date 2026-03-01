import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/constants/app_images.dart';
import 'package:food_app/core/functions/navigation.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';
import 'package:food_app/core/widgets/app_button.dart';
import 'package:food_app/core/widgets/app_text_form_field.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

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
        title: Text("Edit Profile", style: TextStyles.appBarTitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    ClipOval(
                      child: SvgPicture.asset(
                        AppImages.profilePicSvg,
                        height: 130,
                        width: 130,
                      ),
                    ),
                    Positioned(
                      left: 90,
                      top: 90,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(AppImages.pencilSvg),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text("FULL NAME"),
              SizedBox(height: 10),
              CustomTextFormField(hintText: "Vishal Khadok"),
              SizedBox(height: 20),
              Text("EMAIL"),
              SizedBox(height: 10),
              CustomTextFormField(hintText: "hello@halallab.com"),
              SizedBox(height: 20),
              Text("PHONE NUMBER"),
              SizedBox(height: 10),
              CustomTextFormField(hintText: "408-841-0926"),
              SizedBox(height: 20),
              Text("BIO"),
              SizedBox(height: 10),
              CustomTextFormField(
                hintText: "I love fast food",
                maxLines: 4,
                keyboardType: TextInputType.multiline,
              ),
              SizedBox(height: 20),
              MainButton(
                text: "Save",
                textStyle: TextStyles.title.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.backgroundColor,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
