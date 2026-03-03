import 'package:flutter/material.dart';
import 'package:food_app/features/home/data/restaurant_model.dart';
import 'package:food_app/features/search/data/popular_food_model.dart';
import 'package:food_app/features/search/data/search_dummy_data.dart';

import '../widgets/category_filter_chips.dart';
import '../widgets/restaurant_food_grid.dart';
import '../widgets/restaurant_image_section.dart';
import '../widgets/restaurant_info_section.dart';

class RestaurantDetailScreen extends StatefulWidget {
  const RestaurantDetailScreen({super.key, required this.model});

  final RestaurantModel model;

  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  int _selectedCategoryIndex = 0;

  String get _selectedCategory => widget.model.tags[_selectedCategoryIndex];

  List<PopularFoodModel> get _filteredFoods =>
      getRestaurantFoodsByCategory(widget.model.id, _selectedCategory);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image carousel with overlay buttons
              RestaurantImageSection(
                image: widget.model.image,
                heroTag: 'restaurant-image-${widget.model.id}',
                onBackTap: () => Navigator.pop(context),
              ),
              // Content area
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    // Rating row + name + description
                    RestaurantInfoSection(model: widget.model),
                    const SizedBox(height: 24),
                    // Category filter chips
                    CategoryFilterChips(
                      categories: widget.model.tags,
                      selectedIndex: _selectedCategoryIndex,
                      onSelected: (i) {
                        setState(() => _selectedCategoryIndex = i);
                      },
                    ),
                    const SizedBox(height: 24),
                    // Food items grid
                    RestaurantFoodGrid(
                      categoryName: _selectedCategory,
                      foods: _filteredFoods,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
