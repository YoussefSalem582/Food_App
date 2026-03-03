import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/core/constants/app_fonts.dart';
import 'package:food_app/core/constants/app_images.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';
import 'package:food_app/core/widgets/app_button.dart';
import 'package:food_app/core/widgets/app_text_form_field.dart';
import 'package:food_app/features/auth/screens/verification_screen.dart';
import 'package:food_app/features/auth/widgets/backgraound.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
                title: 'Forgot Password',
                subtitle: 'Please sign in to your existing account',
                showBackButton: true,
                backgroundImage: AppImages.patternBackgroundorgSvg,
                title_for_email: '',
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
                          Text(
                            'Email',
                            style: TextStyles.body.copyWith(
                              color: AppColors.ightColor,
                              fontWeight: FontWeight.w400,
                              fontFamily: AppFonts.Sen,
                            ),
                          ),
                          const SizedBox(height: 8),
                          CustomTextFormField(
                            keyboardType: TextInputType.emailAddress,
                            hintText: 'example@gmail.com',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              } else if (!value.contains('@')) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 30),

                          Center(
                            child: MainButton(
                              text: 'SEND CODE',
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const verification_screen(),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),

                          const SizedBox(height: 335),
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