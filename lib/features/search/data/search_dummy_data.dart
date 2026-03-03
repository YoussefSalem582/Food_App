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

// ── Image URL constants (reused across food items) ──────────────────────
const _pizzaImg =
    'https://static.vecteezy.com/system/resources/thumbnails/045/383/391/small/a-cheesy-delicious-pizza-with-tasty-pepperoni-on-a-transparent-background-png.png';
const _pizza2Img =
    'https://static.vecteezy.com/system/resources/previews/058/697/566/non_2x/delicious-buffalo-chicken-pizza-on-transparent-background-free-png.png';
const _burgerImg =
    'https://static.vecteezy.com/system/resources/thumbnails/070/466/459/small/double-patty-chicken-burger-topped-with-ketchup-cheese-and-lettuce-on-transparent-background-png.png';
const _noodlesImg =
    'https://static.vecteezy.com/system/resources/previews/055/793/634/non_2x/bowl-of-hot-spicy-noodles-on-transparent-background-free-png.png';
const _chickenImg =
    'https://static.vecteezy.com/system/resources/thumbnails/027/555/095/small/grilled-chicken-on-a-transparent-background-free-png.png';

/// All searchable food items
List<PopularFoodModel> allFoodItems = [
  // ── General / Search items ──────────────────────────────────────────
  PopularFoodModel(
    id: '1',
    name: 'European Pizza',
    restaurantName: 'Pizza Palace',
    restaurantId: '2',
    category: 'Pizza',
    price: '\$35',
    rating: 4.5,
    deliveryFee: '\$2.00',
    deliveryTime: '30 min',
    image: _pizzaImg,
  ),
  PopularFoodModel(
    id: '2',
    name: 'Buffalo Pizza',
    restaurantName: 'Pizza Palace',
    restaurantId: '2',
    category: 'Pizza',
    price: '\$28',
    rating: 4.5,
    deliveryFee: '\$2.00',
    deliveryTime: '30 min',
    image: _pizza2Img,
  ),
  PopularFoodModel(
    id: '3',
    name: 'Crispy Burger',
    restaurantName: 'Rose Garden Restaurant',
    restaurantId: '1',
    category: 'Burger',
    price: '\$45',
    rating: 4.7,
    deliveryFee: 'Free',
    deliveryTime: '20 min',
    image: _burgerImg,
  ),
  PopularFoodModel(
    id: '4',
    name: 'Spicy Noodles',
    restaurantName: 'Noodle House',
    restaurantId: '4',
    category: 'Noodles',
    price: '\$22',
    rating: 4.6,
    deliveryFee: '\$1.50',
    deliveryTime: '35 min',
    image: _noodlesImg,
  ),
  PopularFoodModel(
    id: 'b1',
    name: 'Burger Bistro',
    restaurantName: 'Rose Garden Restaurant',
    restaurantId: '1',
    category: 'Burger',
    price: '\$40',
    rating: 4.7,
    deliveryFee: 'Free',
    deliveryTime: '20 min',
    image: _burgerImg,
  ),
  PopularFoodModel(
    id: 'b2',
    name: "Smokin' Burger",
    restaurantName: 'Rose Garden Restaurant',
    restaurantId: '1',
    category: 'Burger',
    price: '\$60',
    rating: 4.3,
    deliveryFee: 'Free',
    deliveryTime: '25 min',
    image: _burgerImg,
  ),
  PopularFoodModel(
    id: 'b3',
    name: 'Buffalo Burgers',
    restaurantName: 'Rose Garden Restaurant',
    restaurantId: '1',
    category: 'Burger',
    price: '\$75',
    rating: 4.4,
    deliveryFee: 'Free',
    deliveryTime: '20 min',
    image: _burgerImg,
  ),
  PopularFoodModel(
    id: 'b4',
    name: 'Bullseye Burgers',
    restaurantName: 'Rose Garden Restaurant',
    restaurantId: '1',
    category: 'Burger',
    price: '\$94',
    rating: 4.8,
    deliveryFee: 'Free',
    deliveryTime: '15 min',
    image: _burgerImg,
  ),
  PopularFoodModel(
    id: 'c1',
    name: 'Grilled Chicken',
    restaurantName: 'Golden Chicken',
    restaurantId: '3',
    category: 'Chicken',
    price: '\$30',
    rating: 4.3,
    deliveryFee: 'Free',
    deliveryTime: '25 min',
    image: _chickenImg,
  ),
  PopularFoodModel(
    id: 'c2',
    name: 'Chicken Shawarma',
    restaurantName: 'Golden Chicken',
    restaurantId: '3',
    category: 'Shawarma',
    price: '\$18',
    rating: 4.3,
    deliveryFee: 'Free',
    deliveryTime: '25 min',
    image: _chickenImg,
  ),

  // ── Rose Garden Restaurant (id: 1) — extra items ───────────────────
  PopularFoodModel(
    id: 'r1-1',
    name: 'Burger Ferguson',
    restaurantName: 'Rose Garden Restaurant',
    restaurantId: '1',
    category: 'Burger',
    price: '\$40',
    rating: 4.6,
    deliveryFee: 'Free',
    deliveryTime: '20 min',
    image: _burgerImg,
  ),
  PopularFoodModel(
    id: 'r1-2',
    name: 'Classic Wings',
    restaurantName: 'Rose Garden Restaurant',
    restaurantId: '1',
    category: 'Wings',
    price: '\$25',
    rating: 4.5,
    deliveryFee: 'Free',
    deliveryTime: '20 min',
    image: _chickenImg,
  ),
  PopularFoodModel(
    id: 'r1-3',
    name: 'BBQ Wings',
    restaurantName: 'Rose Garden Restaurant',
    restaurantId: '1',
    category: 'Wings',
    price: '\$28',
    rating: 4.7,
    deliveryFee: 'Free',
    deliveryTime: '20 min',
    image: _chickenImg,
  ),
  PopularFoodModel(
    id: 'r1-4',
    name: 'Chicken Strips',
    restaurantName: 'Rose Garden Restaurant',
    restaurantId: '1',
    category: 'Chicken',
    price: '\$22',
    rating: 4.4,
    deliveryFee: 'Free',
    deliveryTime: '20 min',
    image: _chickenImg,
  ),
  PopularFoodModel(
    id: 'r1-5',
    name: 'Cheese Burger',
    restaurantName: 'Rose Garden Restaurant',
    restaurantId: '1',
    category: 'Burger',
    price: '\$38',
    rating: 4.5,
    deliveryFee: 'Free',
    deliveryTime: '20 min',
    image: _burgerImg,
  ),

  // ── Pizza Palace (id: 2) — extra items ─────────────────────────────
  PopularFoodModel(
    id: 'r2-1',
    name: 'Margherita Pizza',
    restaurantName: 'Pizza Palace',
    restaurantId: '2',
    category: 'Pizza',
    price: '\$30',
    rating: 4.6,
    deliveryFee: '\$2.00',
    deliveryTime: '30 min',
    image: _pizzaImg,
  ),
  PopularFoodModel(
    id: 'r2-2',
    name: 'Pepperoni Pizza',
    restaurantName: 'Pizza Palace',
    restaurantId: '2',
    category: 'Pizza',
    price: '\$35',
    rating: 4.7,
    deliveryFee: '\$2.00',
    deliveryTime: '30 min',
    image: _pizza2Img,
  ),
  PopularFoodModel(
    id: 'r2-3',
    name: 'Pasta Carbonara',
    restaurantName: 'Pizza Palace',
    restaurantId: '2',
    category: 'Pasta',
    price: '\$28',
    rating: 4.4,
    deliveryFee: '\$2.00',
    deliveryTime: '30 min',
    image: _pizzaImg,
  ),
  PopularFoodModel(
    id: 'r2-4',
    name: 'Cheese Pizza',
    restaurantName: 'Pizza Palace',
    restaurantId: '2',
    category: 'Pizza',
    price: '\$25',
    rating: 4.3,
    deliveryFee: '\$2.00',
    deliveryTime: '30 min',
    image: _pizzaImg,
  ),

  // ── Golden Chicken (id: 3) — extra items ───────────────────────────
  PopularFoodModel(
    id: 'r3-1',
    name: 'Crispy Fried Chicken',
    restaurantName: 'Golden Chicken',
    restaurantId: '3',
    category: 'Chicken',
    price: '\$28',
    rating: 4.5,
    deliveryFee: 'Free',
    deliveryTime: '25 min',
    image: _chickenImg,
  ),
  PopularFoodModel(
    id: 'r3-2',
    name: 'BBQ Grilled Chicken',
    restaurantName: 'Golden Chicken',
    restaurantId: '3',
    category: 'Grilled',
    price: '\$32',
    rating: 4.4,
    deliveryFee: 'Free',
    deliveryTime: '25 min',
    image: _chickenImg,
  ),
  PopularFoodModel(
    id: 'r3-3',
    name: 'Spicy Shawarma',
    restaurantName: 'Golden Chicken',
    restaurantId: '3',
    category: 'Shawarma',
    price: '\$20',
    rating: 4.6,
    deliveryFee: 'Free',
    deliveryTime: '25 min',
    image: _chickenImg,
  ),
  PopularFoodModel(
    id: 'r3-4',
    name: 'Chicken Grill Plate',
    restaurantName: 'Golden Chicken',
    restaurantId: '3',
    category: 'Grilled',
    price: '\$35',
    rating: 4.5,
    deliveryFee: 'Free',
    deliveryTime: '25 min',
    image: _chickenImg,
  ),

  // ── Noodle House (id: 4) — extra items ─────────────────────────────
  PopularFoodModel(
    id: 'r4-1',
    name: 'Ramen Bowl',
    restaurantName: 'Noodle House',
    restaurantId: '4',
    category: 'Ramen',
    price: '\$26',
    rating: 4.7,
    deliveryFee: '\$1.50',
    deliveryTime: '35 min',
    image: _noodlesImg,
  ),
  PopularFoodModel(
    id: 'r4-2',
    name: 'Pad Thai Noodles',
    restaurantName: 'Noodle House',
    restaurantId: '4',
    category: 'Noodles',
    price: '\$24',
    rating: 4.5,
    deliveryFee: '\$1.50',
    deliveryTime: '35 min',
    image: _noodlesImg,
  ),
  PopularFoodModel(
    id: 'r4-3',
    name: 'Asian Stir Fry',
    restaurantName: 'Noodle House',
    restaurantId: '4',
    category: 'Asian',
    price: '\$22',
    rating: 4.4,
    deliveryFee: '\$1.50',
    deliveryTime: '35 min',
    image: _noodlesImg,
  ),
  PopularFoodModel(
    id: 'r4-4',
    name: 'Tonkotsu Ramen',
    restaurantName: 'Noodle House',
    restaurantId: '4',
    category: 'Ramen',
    price: '\$30',
    rating: 4.8,
    deliveryFee: '\$1.50',
    deliveryTime: '35 min',
    image: _noodlesImg,
  ),
];

/// Popular fast food items (first 4 shown on search screen)
List<PopularFoodModel> get popularFoods => allFoodItems.take(4).toList();

/// Get all food items for a specific restaurant
List<PopularFoodModel> getRestaurantFoods(String restaurantId) {
  return allFoodItems.where((f) => f.restaurantId == restaurantId).toList();
}

/// Get food items for a restaurant filtered by category tag
List<PopularFoodModel> getRestaurantFoodsByCategory(
  String restaurantId,
  String category,
) {
  return allFoodItems
      .where(
        (f) =>
            f.restaurantId == restaurantId &&
            f.category.toLowerCase() == category.toLowerCase(),
      )
      .toList();
}

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
