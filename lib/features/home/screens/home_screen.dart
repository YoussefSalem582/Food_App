import 'package:flutter/material.dart';

import '../../../core/functions/navigation.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../../core/widgets/app_text_form_field.dart';
import '../../../core/widgets/header_section.dart';
import '../../search/screens/search_screen.dart';
import '../widgets/all_categories_builder.dart';
import '../widgets/open_restaurants_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Fixed header
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: HeaderSection(
                label: 'DELIVER TO',
                title: 'Halal Lab office',
                cartCount: 2,
              ),
            ),
            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text('Hey Halal, ', style: TextStyles.title),
                        Text(
                          'Good Afternoon!',
                          style: TextStyles.title.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Search bar
                    GestureDetector(
                      onTap: () {
                        pushTo(context, SearchScreen());
                      },
                      // hero animation for search field
                      child: Hero(
                        tag: 'search',
                        child: Material(
                          child: CustomTextFormField(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Search dishes, restaurants',
                            enabled: false,
                            // onTap: () {
                            //   //pushTo(context, SearchScreen());
                            // },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // All categories section
                    const AllCategoriesBuilder(),
                    // Open restaurants section
                    const OpenRestaurantsBuilder(),
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
