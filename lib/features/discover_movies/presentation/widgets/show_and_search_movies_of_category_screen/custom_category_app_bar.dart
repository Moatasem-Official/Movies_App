import 'package:flutter/material.dart';
import 'package:movies_app/features/discover_movies/presentation/widgets/show_and_search_movies_of_category_screen/custom_category_search_bar.dart';
import 'package:movies_app/generated/l10n.dart';

class CustomCategoryAppBar extends StatelessWidget {
  const CustomCategoryAppBar({
    super.key,
    required Animation<double> fadeAnimation,
    required bool isSearching,
    required TextEditingController searchController,
    required this.onSearchChanged,
    required this.moviesCategoryName,
  })  : _fadeAnimation = fadeAnimation,
        _isSearching = isSearching,
        _searchController = searchController;

  final Animation<double> _fadeAnimation;
  final bool _isSearching;
  final TextEditingController _searchController;
  final ValueChanged<String> onSearchChanged;
  final String moviesCategoryName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 70),
          // تم استخدام Row لوضع زر الرجوع والعنوان في سطر واحد
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(width: 10),
              FadeTransition(
                opacity: _fadeAnimation,
                child: Text(
                  moviesCategoryName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomCategorySearchBar(
            moviesCategoryName: moviesCategoryName,
            isSearching: _isSearching,
            searchController: _searchController,
            onChanged: onSearchChanged,
          ),
          const SizedBox(height: 30),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _isSearching ? 1.0 : 0.0,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Text(
                S.of(context).searchResult,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
