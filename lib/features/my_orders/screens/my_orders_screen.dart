import 'package:flutter/material.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';
import 'package:food_app/features/my_orders/data/dummy_data.dart';
import 'package:food_app/features/my_orders/data/order_model.dart';
import 'package:food_app/features/my_orders/widgets/history_card.dart';
import 'package:food_app/features/my_orders/widgets/ongoing_card.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ongoingOrders = getOrdersByStatuses([OrderStatus.ongoing]);
    
    final historyOrders = getOrdersByStatuses([OrderStatus.completed, OrderStatus.canceled]);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Orders", style: TextStyles.appBarTitle),
          actions: [
            IconButton.filled(
              onPressed: () {},
              icon: Icon(Icons.more_horiz, size: 17),
              style: IconButton.styleFrom(
                backgroundColor: AppColors.profileColor,
              ),
            ),
            SizedBox(width: 10),
          ],
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: AppColors.primaryColor,
            indicatorColor: AppColors.primaryColor,
            unselectedLabelColor: AppColors.inactiveTextColor,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 25),
            tabs: [
              Tab(
                child: Text(
                  "Ongoing",
                  style: TextStyles.caption1.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "History",
                  style: TextStyles.caption1.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: ongoingOrders.length,
              itemBuilder: (context, index) {
                return OngoingCard(model: ongoingOrders[index]);
              },
            ),
            ListView.builder(
              itemCount: historyOrders.length,
              itemBuilder: (context, index) {
                return HistoryCard(model: historyOrders[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
