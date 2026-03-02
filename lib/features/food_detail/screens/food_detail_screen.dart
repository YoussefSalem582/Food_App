import 'package:flutter/material.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/features/search/data/popular_food_model.dart';

import '../widgets/food_detail_bottom_bar.dart';
import '../widgets/food_detail_image_section.dart';
import '../widgets/food_detail_info_section.dart';
import '../widgets/ingredients_section.dart';
import '../widgets/size_selector.dart';

class FoodDetailScreen extends StatefulWidget {
  const FoodDetailScreen({super.key, required this.model});

  final PopularFoodModel model;

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  int _quantity = 1;
  int _selectedSizeIndex = 1;
  bool _isFavorite = false;

  final List<String> _sizes = ['10"', '14"', '16"'];

  double get _priceValue {
    final cleaned = widget.model.price.replaceAll('\$', '').replaceAll(',', '');
    return double.tryParse(cleaned) ?? 0;
  }

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
              // Image with back/fav buttons
              FoodDetailImageSection(
                model: widget.model,
                isFavorite: _isFavorite,
                onBackTap: () => Navigator.pop(context),
                onFavoriteTap: () {
                  setState(() => _isFavorite = !_isFavorite);
                },
              ),
              // Content area
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    // Title + restaurant + rating row + description
                    FoodDetailInfoSection(model: widget.model),
                    const SizedBox(height: 24),
                    // Size selector
                    SizeSelector(
                      sizes: _sizes,
                      selectedIndex: _selectedSizeIndex,
                      onSizeSelected: (i) {
                        setState(() => _selectedSizeIndex = i);
                      },
                    ),
                    const SizedBox(height: 24),
                    // Ingredients
                    const IngredientsSection(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: FoodDetailBottomBar(
          totalPrice: '\$${(_priceValue * _quantity).toStringAsFixed(0)}',
          quantity: _quantity,
          onDecrease: () {
            if (_quantity > 1) setState(() => _quantity--);
          },
          onIncrease: () => setState(() => _quantity++),
          onAddToCart: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${widget.model.name} x$_quantity added to cart'),
                backgroundColor: AppColors.primaryColor,
                duration: const Duration(seconds: 2),
              ),
            );
          },
        ),
      ),
    );
  }
}
