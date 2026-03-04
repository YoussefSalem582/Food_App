import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/core/constants/app_fonts.dart';
import 'package:food_app/core/constants/app_images.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';
import 'package:food_app/core/widgets/app_button.dart';
import 'package:food_app/core/widgets/app_password_form_field.dart';
import 'package:food_app/core/widgets/app_text_form_field.dart';
import 'package:food_app/core/widgets/custom_svg_picture.dart';
import 'package:food_app/features/auth/screens/forget_password_screen.dart';
import 'package:food_app/features/auth/screens/signup_screen.dart';
import 'package:food_app/features/auth/widgets/backgraound.dart';
import 'package:food_app/features/main/main_app_screen.dart';

import 'verification_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                title: 'Log In',
                subtitle: 'Please sign in to your existing account',
                backgroundImage: AppImages.patternBackgroundSvg,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
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

                          const SizedBox(height: 20),

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

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    activeColor: AppColors.secondaryColor,
                                    value: rememberMe,
                                    onChanged: (value) {
                                      setState(() {
                                        rememberMe = value ?? false;
                                      });
                                    },
                                    side: const BorderSide(
                                      color: AppColors.lightGrayColor,
                                      width: 2,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  Text(
                                    'Remember me',
                                    style: TextStyles.body.copyWith(
                                      color: AppColors.lightGrayColor,
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgotPasswordPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Forgot Password',
                                  style: TextStyles.body.copyWith(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          Center(
                            child: MainButton(
                              text: 'LOG IN',
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const MainAppScreen(),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),

                          const SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account?',
                                style: TextStyles.title.copyWith(
                                  color: AppColors.sidetextColor,
                                ),
                              ),
                              SizedBox(width: 20),
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SignupScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'SIGN UP',
                                  style: TextStyles.caption1.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),
                          Center(
                            child: Text(
                              'Or',
                              style: TextStyles.title.copyWith(
                                color: AppColors.sidetextColor,
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _socialButton(
                                iconPath: AppImages.facebookSvg,
                                onTap: () {},
                              ),
                              _socialButton(
                                iconPath: AppImages.twitterSvg,
                                onTap: () {},
                              ),
                              _socialButton(
                                iconPath: AppImages.appleSvg,
                                onTap: () {},
                              ),
                            ],
                          ),
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

Widget _socialButton({required String iconPath, required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: CustomSvgPicture(path: iconPath, height: 64, width: 64),
  );
}
