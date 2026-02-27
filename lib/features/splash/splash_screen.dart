import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/core/constants/app_images.dart';
import 'package:food_app/core/functions/navigation.dart';
import 'package:food_app/features/auth/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      pushReplacement(context, LoginPage());
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
  
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppImages.patternOrangeSvg,),
          ),
           Align(
            alignment: Alignment.topLeft,
            child: SvgPicture.asset(AppImages.patterngraySvg,),
          ),

          Center(child: SvgPicture.asset(AppImages.logoSvg,)),
        ],
      ),
    );
  }
}