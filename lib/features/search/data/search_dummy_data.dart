import 'package:food_app/features/home/data/restaurant_model.dart';

import '../../home/data/dummy_data.dart';
import 'popular_food_model.dart';

/// Recent search keyword chips
const List<String> recentKeywords = [
  'Burger',
  'Sandwich',
  'Pizza',
  'Noodles',
  'Chicken',
  'Sushi',
];

/// Suggested restaurants reuses home dummy data
List<RestaurantModel> suggestedRestaurants = restaurants;

/// All searchable food items (combines popularFoods + burgerResults deduplicated)
List<PopularFoodModel> allFoodItems = [
  PopularFoodModel(
    id: '1',
    name: 'European Pizza',
    restaurantName: 'Uttora Coffee House',
    price: '\$35',
    image:
        'https://static.vecteezy.com/system/resources/thumbnails/045/383/391/small/a-cheesy-delicious-pizza-with-tasty-pepperoni-on-a-transparent-background-png.png',
  ),
  PopularFoodModel(
    id: '2',
    name: 'Buffalo Pizza',
    restaurantName: 'Cafenio Coffee Club',
    price: '\$28',
    image:
        'https://static.vecteezy.com/system/resources/previews/058/697/566/non_2x/delicious-buffalo-chicken-pizza-on-transparent-background-free-png.png',
  ),
  PopularFoodModel(
    id: '3',
    name: 'Crispy Burger',
    restaurantName: 'Rose Garden Restaurant',
    price: '\$45',
    image:
        'https://static.vecteezy.com/system/resources/thumbnails/070/466/459/small/double-patty-chicken-burger-topped-with-ketchup-cheese-and-lettuce-on-transparent-background-png.png',
  ),
  PopularFoodModel(
    id: '4',
    name: 'Spicy Noodles',
    restaurantName: 'Noodle House',
    price: '\$22',
    image:
        'https://static.vecteezy.com/system/resources/previews/055/793/634/non_2x/bowl-of-hot-spicy-noodles-on-transparent-background-free-png.png',
  ),
  PopularFoodModel(
    id: 'b1',
    name: 'Burger Bistro',
    restaurantName: 'Rose Garden',
    price: '\$40',
    image:
        'https://static.vecteezy.com/system/resources/thumbnails/070/466/459/small/double-patty-chicken-burger-topped-with-ketchup-cheese-and-lettuce-on-transparent-background-png.png',
  ),
  PopularFoodModel(
    id: 'b2',
    name: "Smokin' Burger",
    restaurantName: 'Cafenio Restaurant',
    price: '\$60',
    image:
        'https://static.vecteezy.com/system/resources/thumbnails/070/466/459/small/double-patty-chicken-burger-topped-with-ketchup-cheese-and-lettuce-on-transparent-background-png.png',
  ),
  PopularFoodModel(
    id: 'b3',
    name: 'Buffalo Burgers',
    restaurantName: 'Kaji Firm Kitchen',
    price: '\$75',
    image:
        'https://static.vecteezy.com/system/resources/thumbnails/070/466/459/small/double-patty-chicken-burger-topped-with-ketchup-cheese-and-lettuce-on-transparent-background-png.png',
  ),
  PopularFoodModel(
    id: 'b4',
    name: 'Bullseye Burgers',
    restaurantName: 'Kabab Restaurant',
    price: '\$94',
    image:
        'https://static.vecteezy.com/system/resources/thumbnails/070/466/459/small/double-patty-chicken-burger-topped-with-ketchup-cheese-and-lettuce-on-transparent-background-png.png',
  ),
  PopularFoodModel(
    id: 'c1',
    name: 'Grilled Chicken',
    restaurantName: 'Golden Chicken',
    price: '\$30',
    image:
        'https://static.vecteezy.com/system/resources/thumbnails/027/555/095/small/grilled-chicken-on-a-transparent-background-free-png.png',
  ),
  PopularFoodModel(
    id: 'c2',
    name: 'Chicken Shawarma',
    restaurantName: 'Golden Chicken',
    price: '\$18',
    image:
        'https://static.vecteezy.com/system/resources/thumbnails/027/555/095/small/grilled-chicken-on-a-transparent-background-free-png.png',
  ),
];

/// Popular fast food items (first 4 shown on search screen)
List<PopularFoodModel> get popularFoods => allFoodItems.take(4).toList();

/// Search foods by query (name or restaurant name)
List<PopularFoodModel> searchFoods(String query) {
  final q = query.toLowerCase().trim();
  if (q.isEmpty) return [];
  return allFoodItems.where((f) {
    return f.name.toLowerCase().contains(q) ||
        f.restaurantName.toLowerCase().contains(q);
  }).toList();
}

/// Search restaurants by query (name or tags)
List<RestaurantModel> searchRestaurants(String query) {
  final q = query.toLowerCase().trim();
  if (q.isEmpty) return [];
  return restaurants.where((r) {
    return r.name.toLowerCase().contains(q) ||
        r.tags.any((tag) => tag.toLowerCase().contains(q));
  }).toList();
}
