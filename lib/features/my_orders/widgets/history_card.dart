import 'package:flutter/material.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';
import 'package:food_app/core/widgets/app_button.dart';
import 'package:food_app/features/my_orders/data/order_model.dart';
import 'package:intl/intl.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key, required this.model});

  final OrderModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      width: double.infinity,
      height: 240,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: [
                  Text(model.type),
                  SizedBox(width: 30),
                  Text(
                    model.status == OrderStatus.completed
                        ? "Complete"
                        : model.status == OrderStatus.canceled
                        ? "Cancel"
                        : "ongoing",
                    style: TextStyle(
                      color: model.status == OrderStatus.completed
                          ? AppColors.green
                          : model.status == OrderStatus.canceled
                          ? AppColors.red
                          : AppColors.inactiveTextColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(indent: 10, endIndent: 10, color: AppColors.dividerGrey),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 8),
              child: Row(
                children: [
                  Transform.translate(
                    offset: Offset(0, -5),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(model.image, fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            model.restaurantName,
                            style: TextStyles.caption1.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 120),
                          Text(
                            "#${model.id}",
                            style: TextStyle(
                              color: AppColors.lightGrayColor,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.lightGrayColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "\$${model.price}",
                            style: TextStyles.caption1.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "|",
                            style: TextStyle(color: AppColors.lightGrayColor),
                          ),
                          SizedBox(width: 10),
                          Text(
                            DateFormat("d MMM, HH:mm").format(model.date),
                            style: TextStyle(
                              color: AppColors.lightGrayColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "•",
                            style: TextStyle(color: AppColors.lightGrayColor),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "0${model.itemsCount} Items",
                            style: TextStyle(color: AppColors.lightGrayColor),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  MainButton(
                    text: "Rate",
                    textStyle: TextStyles.caption2.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                    width: 140,
                    height: 40,
                    bgColor: AppColors.backgroundColor,
                    borderColor: AppColors.primaryColor,
                    onPressed: () {},
                  ),
                  Spacer(),
                  MainButton(
                    text: "Re-Order",
                    textStyle: TextStyles.caption2.copyWith(
                      color: AppColors.backgroundColor,
                      fontWeight: FontWeight.w700,
                    ),
                    width: 140,
                    height: 40,
                    bgColor: AppColors.primaryColor,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
