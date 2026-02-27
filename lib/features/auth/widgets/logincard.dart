import 'package:flutter/material.dart';
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

class LoginCard extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final bool rememberMe;
  final ValueChanged<bool> onRememberChanged;

  const LoginCard({
    required this.formKey,
    required this.rememberMe,
    required this.onRememberChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              /// Email
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

              const SizedBox(height: 20),

              /// Password
              Text(
                'Password',
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

              /// Remember + Forgot
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        activeColor: AppColors.secondaryColor,
                        value: rememberMe,
                        onChanged: (value) {
                          onRememberChanged(value ?? false);
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPasswordPage(),
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

              /// Login Button
              Center(
                child: MainButton(
                  text: 'Login',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // Login logic
                    }
                  },
                ),
              ),

              const SizedBox(height: 20),

              /// Sign Up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyles.title.copyWith(
                      color: AppColors.sidetextColor,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyles.caption1.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
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
                  _socialButton(iconPath: AppImages.facebookSvg, onTap: () {}),
                  _socialButton(iconPath: AppImages.twitterSvg, onTap: () {}),
                  _socialButton(iconPath: AppImages.appleSvg, onTap: () {}),
                ],
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
