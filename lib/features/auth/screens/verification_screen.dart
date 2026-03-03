import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/core/constants/app_images.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/widgets/app_button.dart';
import 'package:food_app/features/auth/screens/login_screen.dart';
import 'package:food_app/features/auth/widgets/backgraound.dart';
import 'package:food_app/features/auth/widgets/otbbox.dart';

class verification_screen extends StatefulWidget {
  const verification_screen({super.key});

  @override
  State<verification_screen> createState() => _verification_screenState();
}

class _verification_screenState extends State<verification_screen> {
  final formKey = GlobalKey<FormState>();
  bool rememberMe = false;

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
              const AuthBackground(
                title: 'Verification',
                subtitle: 'We have sent a code to your email',
                title_for_email: ' example@gmail.com ',
                showBackButton: true,
                backgroundImage: AppImages.patternBackgroundorgSvg,
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
                          OtpSection(),

                          const SizedBox(height: 30),

                          Center(
                            child: MainButton(
                              text: 'VERIFY',
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),

                          const SizedBox(height: 300),
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