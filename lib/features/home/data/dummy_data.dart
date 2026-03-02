import 'package:food_app/core/constants/app_images.dart';
import 'package:food_app/features/home/data/category_model.dart';
import 'package:food_app/features/home/data/restaurant_model.dart';

// categoryId: '1'=Pizza  '2'=Burger  '3'=Chicken  '4'=Noodles  '5'=Bakery  '6'=Beverages

List<CategoryModel> categories = [
  CategoryModel(id: '1', name: 'Pizza', image: AppImages.pizza),
  CategoryModel(id: '2', name: 'Burger', image: AppImages.burger),
  CategoryModel(id: '3', name: 'Chicken', image: AppImages.chicken),
  CategoryModel(id: '4', name: 'Noodles', image: AppImages.noodles),
  CategoryModel(id: '5', name: 'Bakery', image: AppImages.bakery),
  CategoryModel(id: '6', name: 'Beverages', image: AppImages.beverages),
];

List<RestaurantModel> restaurants = [
  RestaurantModel(
    id: '1',
    name: 'Rose Garden Restaurant',
    image:
        'https://play-lh.googleusercontent.com/50g2mUrN-__umAATBvL473oqUuie4GgeQp4f4RnqcKYVtKLPsu1zRbdcJKPRbxU3Jxo',
    tags: ['Burger', 'Chicken', 'Riche', 'Wings'],
    rating: 4.7,
    deliveryFee: 'Free',
    deliveryTime: '20 min',
  ),
  RestaurantModel(
    id: '2',
    name: 'Pizza Palace',
    image:
        'https://www.logomoose.com/wp-content/uploads/gravity_forms/1-ccb3a626c22b416a31686ab909937935/2015/02/logo-01.jpg',
    tags: ['Pizza', 'Pasta', 'Italian'],
    rating: 4.5,
    deliveryFee: '\$2.00',
    deliveryTime: '30 min',
  ),
  RestaurantModel(
    id: '3',
    name: 'Golden Chicken',
    image:
        'https://img.freepik.com/premium-vector/golden-chicken-flat-minimalist-logo-design_904722-1537.jpg?semt=ais_user_personalization&w=740&q=80',
    tags: ['Chicken', 'Grilled', 'Shawarma'],
    rating: 4.3,
    deliveryFee: 'Free',
    deliveryTime: '25 min',
  ),
  RestaurantModel(
    id: '4',
    name: 'Noodle House',
    image:
        'https://dcassetcdn.com/design_img/3645862/733394/733394_20605799_3645862_7d7ccec4_image.jpg',
    tags: ['Noodles', 'Ramen', 'Asian'],
    rating: 4.6,
    deliveryFee: '\$1.50',
    deliveryTime: '35 min',
  ),
];
