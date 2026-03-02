class RestaurantModel {
  final String id;
  final String name;
  final String image;
  final List<String> tags;
  final double rating;
  final String deliveryFee;
  final String deliveryTime;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.image,
    required this.tags,
    required this.rating,
    required this.deliveryFee,
    required this.deliveryTime,
  });
}
