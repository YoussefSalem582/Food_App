import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/core/constants/app_fonts.dart';
import 'package:food_app/core/constants/app_images.dart';
import 'package:food_app/core/functions/navigation.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';
import 'package:food_app/core/widgets/app_button.dart';
import 'package:food_app/core/widgets/app_password_form_field.dart';
import 'package:food_app/core/widgets/app_text_form_field.dart';
import 'package:food_app/features/auth/widgets/backgraound.dart';
import 'package:food_app/features/main/main_app_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.secondaryColor,
        body: Stack(
          children: [
            /// Top Background
            const AuthBackground(
              title: 'Sign Up',
              subtitle: 'Please sign up to get started',
              showBackButton: true,
              backgroundImage: AppImages.patternBackgroundSvg,
              title_for_email: '',
            ),

            /// Bottom Form Container
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: SingleChildScrollView(
                    reverse: true,
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
                        padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// NAME
                              Text(
                                'NAME',
                                style: TextStyles.body.copyWith(
                                  color: AppColors.ightColor,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.Sen,
                                ),
                              ),
                              const SizedBox(height: 8),
                              CustomTextFormField(
                                keyboardType: TextInputType.name,
                                hintText: 'John doe',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),

                              /// EMAIL
                              Text(
                                'EMAIL',
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
                              const SizedBox(height: 10),

                              /// PASSWORD
                              Text(
                                'PASSWORD',
                                style: TextStyles.body.copyWith(
                                  color: AppColors.ightColor,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.Sen,
                                ),
                              ),
                              const SizedBox(height: 8),
                              CustomPasswordFormField(
                                hintText: '* * * * * * * * * *',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  } else if (value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                              ),

                              const SizedBox(height: 10),

                              Text(
                                'RE-TYPE PASSWORD',
                                style: TextStyles.body.copyWith(
                                  color: AppColors.ightColor,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.Sen,
                                ),
                              ),
                              const SizedBox(height: 8),
                              CustomPasswordFormField(
                                hintText: '* * * * * * * * * *',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  } else if (value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                              ),

                              const SizedBox(height: 40),

                              Center(
                                child: MainButton(
                                  text: 'SIGN UP',
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      pushReplacement(
                                        context,
                                        const MainAppScreen(),
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
