import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_app/features/my_cart/screens/my_cart_screen.dart';
import 'package:food_app/features/splash/splash_screen.dart';

import 'core/styles/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.light,
      // SafeArea widget is used to set the safe area of the app
      builder: (context, child) {
        return SafeArea(
          bottom: Platform.isAndroid ? true : false,
          top: false,
          child: child ?? Container(),
        );
      },
      home: SplashScreen(),
    );
  }
}
