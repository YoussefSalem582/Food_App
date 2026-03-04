import 'package:food_app/core/constants/app_images.dart';
import 'package:food_app/features/my_orders/data/order_model.dart';

List<OrderModel> orders = [
  
  OrderModel(
    id: '162432',
    restaurantName: 'Pizza Hut',
    image: AppImages.pizzaHut,
    price: 35.25,
    itemsCount: 03,
    date: DateTime(2024, 1, 29, 12, 30),
    type: 'Food',
    status: OrderStatus.ongoing,
  ),
  OrderModel(
    id: '242432',
    restaurantName: 'McDonald',
    image: AppImages.mcdonalds,
    price: 40.15,
    itemsCount: 02,
    date: DateTime(2024, 1, 30, 12, 30),
    type: 'Drink',
    status: OrderStatus.ongoing,
  ),
  OrderModel(
    id: '240112',
    restaurantName: 'Starbucks',
    image: AppImages.starbucks,
    price: 10.20,
    itemsCount: 01,
    date: DateTime(2024, 1, 30, 12, 30),
    type: 'Drink',
    status: OrderStatus.ongoing,
  ),
  
  OrderModel(
    id: '162432',
    restaurantName: 'Pizza Hut',
    image: AppImages.pizzaHut,
    price: 35.25,
    itemsCount: 03,
    date: DateTime(2024, 1, 29, 12, 30),
    type: 'Food',
    status: OrderStatus.completed,
  ),
  OrderModel(
    id: '242432',
    restaurantName: 'McDonald',
    image: AppImages.mcdonalds,
    price: 40.15,
    itemsCount: 02,
    date: DateTime(2024, 1, 30, 12, 30),
    type: 'Drink',
    status: OrderStatus.completed,
  ),
  OrderModel(
    id: '240112',
    restaurantName: 'Starbucks',
    image: AppImages.starbucks,
    price: 10.20,
    itemsCount: 01,
    date: DateTime(2024, 1, 30, 12, 30),
    type: 'Drink',
    status: OrderStatus.canceled,
  ),
];


List<OrderModel> getOrdersByStatuses(List<OrderStatus> statuses) {
  return orders
      .where((order) => statuses.contains(order.status))
      .toList();
}