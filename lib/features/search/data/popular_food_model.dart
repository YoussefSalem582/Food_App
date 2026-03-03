class PopularFoodModel {
  final String id;
  final String name;
  final String restaurantName;
  final String restaurantId;
  final String category;
  final String image;
  final String price;
  final double rating;
  final String deliveryFee;
  final String deliveryTime;
  final String description;

  PopularFoodModel({
    required this.id,
    required this.name,
    required this.restaurantName,
    required this.image,
    required this.price,
    this.restaurantId = '',
    this.category = '',
    this.rating = 4.7,
    this.deliveryFee = 'Free',
    this.deliveryTime = '20 min',
    this.description =
        'Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.',
  });
}
