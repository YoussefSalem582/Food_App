import 'package:flutter/material.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';
import 'package:food_app/core/widgets/custom_svg_picture.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.label,
    required this.assetName,
    this.onTap,
    this.field,
    this.trailing = const Icon(Icons.arrow_forward_ios_sharp, size: 12),
  });

  final String label;
  final String? field;
  final String assetName;
  final void Function()? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: CustomSvgPicture(path: assetName, width: 12, height: 14),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: TextStyles.title),
            if (field != null)
              Text(
                field!,
                style: TextStyles.caption1.copyWith(
                  color: AppColors.lightGrayColor,
                ),
              ),
          ],
        ),
        trailing: trailing,
      ),
    );
  }
}
