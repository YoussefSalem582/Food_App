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

/// Popular fast food items
List<PopularFoodModel> popularFoods = [
  PopularFoodModel(
    id: '1',
    name: 'European Pizza',
    restaurantName: 'Uttora Coffee House',
    image:
        'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400&q=80',
  ),
  PopularFoodModel(
    id: '2',
    name: 'Buffalo Pizza.',
    restaurantName: 'Cafenio Coffee Club',
    image:
        'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=400&q=80',
  ),
  PopularFoodModel(
    id: '3',
    name: 'Crispy Burger',
    restaurantName: 'Rose Garden Restaurant',
    image:
        'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400&q=80',
  ),
  PopularFoodModel(
    id: '4',
    name: 'Spicy Noodles',
    restaurantName: 'Noodle House',
    image:
        'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=400&q=80',
  ),
];
