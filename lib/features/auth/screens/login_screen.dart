import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/features/auth/widgets/LoginBackground.dart';
import 'package:food_app/features/auth/widgets/logincard.dart';

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
              const LoginBackground(),
              Align(
                alignment: Alignment.bottomCenter,
                child: LoginCard(
                  formKey: formKey,
                  rememberMe: rememberMe,
                  onRememberChanged: (value) {
                    setState(() {
                      rememberMe = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}