enum OrderStatus { ongoing, completed, canceled }

class OrderModel {
  final String id;
  final String restaurantName;
  final String image;
  final double price;
  final int itemsCount;
  final DateTime date;
  final String type;
  final OrderStatus status;

  OrderModel({
    required this.id,
    required this.restaurantName,
    required this.image,
    required this.price,
    required this.itemsCount,
    required this.date,
    required this.type,
    required this.status,
  });
}