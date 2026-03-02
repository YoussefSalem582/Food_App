import 'package:flutter/material.dart';
import 'package:food_app/core/functions/navigation.dart';
import 'package:food_app/core/widgets/app_text_form_field.dart';
import 'package:food_app/core/widgets/header_section.dart';

import '../widgets/popular_fast_food_builder.dart';
import '../widgets/recent_keywords_builder.dart';
import '../widgets/suggested_restaurants_builder.dart';
import 'search_results_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchKey = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: HeaderSection(
                title: 'Search',
                showBackButton: true,
                cartCount: 2,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: 'search',
                      child: Material(
                        color: Colors.transparent,
                        child: CustomTextFormField(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search dishes, restaurants',
                          onChanged: (value) {
                            setState(() {
                              searchKey = value;
                            });
                          },
                          onFieldSubmitted: (value) {
                            if (value.trim().isNotEmpty) {
                              pushTo(
                                context,
                                SearchResultsScreen(query: value.trim()),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    RecentKeywordsBuilder(
                      onKeywordTap: (keyword) =>
                          pushTo(context, SearchResultsScreen(query: keyword)),
                    ),
                    const SizedBox(height: 24),
                    const SuggestedRestaurantsBuilder(),
                    const SizedBox(height: 24),
                    const PopularFastFoodBuilder(),
                    const SizedBox(height: 20),
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
