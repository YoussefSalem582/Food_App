import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_fonts.dart';
import 'package:food_app/features/main/main_app_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        splashFactory: NoSplash.splashFactory, 
        fontFamily: AppFonts.Sen
        ),
      debugShowCheckedModeBanner: false,
      home: MainAppScreen(),
    );
  }
}
