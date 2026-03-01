import 'package:flutter/material.dart';
import 'package:food_app/core/styles/app_colors.dart';

class CustomChip extends StatefulWidget {
  const CustomChip({
    super.key, required this.label, required this.backgroundColor, required this.labelColor,
  });

  final String label;
  final Color backgroundColor;
  final Color labelColor;

  @override
  State<CustomChip> createState() => _CustomChipState();
}

class _CustomChipState extends State<CustomChip> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.profileColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          widget.label,
          style: TextStyle(color: isSelected ? AppColors.backgroundColor : AppColors.blackColor),
        ),
      ),
    );
  }
}
