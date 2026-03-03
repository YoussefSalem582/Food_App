import 'package:flutter/material.dart';
import 'package:food_app/core/styles/app_colors.dart';

Widget quantityButton(IconData icon) {
  return Container(
    width: 22,
    height: 22,
    decoration: BoxDecoration(
      color: AppColors.darkblackColor,
      shape: BoxShape.circle,
    ),
    child: Icon(
      icon,
      size: 16,
      color: Colors.white,
    ),
  );
}