import 'package:flutter/material.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';
import 'package:food_app/core/widgets/circle_icon_button.dart';
import 'package:food_app/core/widgets/header_section.dart';
import 'package:food_app/features/home/data/restaurant_model.dart';
import 'package:food_app/features/home/widgets/restaurant_card.dart';
import 'package:food_app/features/search/data/popular_food_model.dart';
import 'package:food_app/features/search/data/search_dummy_data.dart';
import 'package:food_app/features/search/widgets/popular_food_card.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({super.key, required this.query});

  final String query;

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  late String _query;
  late List<PopularFoodModel> _foodResults;
  late List<RestaurantModel> _restaurantResults;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _query = widget.query;
    _controller = TextEditingController(text: widget.query);
    _runSearch(_query);
  }

  void _runSearch(String q) {
    setState(() {
      _query = q;
      _foodResults = searchFoods(q);
      _restaurantResults = searchRestaurants(q);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _capitalize(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1).toLowerCase();

  @override
  Widget build(BuildContext context) {
    final bool noResults = _foodResults.isEmpty && _restaurantResults.isEmpty;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Fixed header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: HeaderSection(
                showBackButton: true,
                title: _capitalize(_query),
                showDropdown: true,
                trailing: Row(
                  children: [
                    CircleIconButton(
                      bgColor: AppColors.blackColor,
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    CircleIconButton(
                      bgColor: AppColors.textfiedColor,
                      child: const Icon(
                        Icons.tune_rounded,
                        color: AppColors.blackColor,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Results
            Expanded(
              child: noResults
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.search_off,
                            size: 64,
                            color: AppColors.lightGrayColor,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'No results for "$_query"',
                            style: TextStyles.title.copyWith(
                              color: AppColors.lightGrayColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  : SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Food results
                          if (_foodResults.isNotEmpty) ...[
                            Text(
                              'Foods (${_foodResults.length})',
                              style: TextStyles.title.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.blackColor,
                              ),
                            ),
                            const SizedBox(height: 16),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 14,
                                    mainAxisSpacing: 16,
                                    mainAxisExtent: 190,
                                  ),
                              itemCount: _foodResults.length,
                              itemBuilder: (_, i) =>
                                  PopularFoodCard(model: _foodResults[i]),
                            ),
                            const SizedBox(height: 24),
                          ],
                          // Restaurant results
                          if (_restaurantResults.isNotEmpty) ...[
                            Text(
                              'Restaurants (${_restaurantResults.length})',
                              style: TextStyles.title.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.blackColor,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: _restaurantResults.length,
                              separatorBuilder: (_, _) =>
                                  const SizedBox(height: 16),
                              itemBuilder: (_, i) =>
                                  RestaurantCard(model: _restaurantResults[i]),
                            ),
                          ],
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
