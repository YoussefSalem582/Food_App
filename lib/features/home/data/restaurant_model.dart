class RestaurantModel {
  final String id;
  final String name;
  final String image;
  final List<String> tags;
  final double rating;
  final String deliveryFee;
  final String deliveryTime;
  final String description;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.image,
    required this.tags,
    required this.rating,
    required this.deliveryFee,
    required this.deliveryTime,
    this.description =
        'Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.',
  });
}
