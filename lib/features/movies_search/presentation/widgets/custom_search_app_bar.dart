import 'package:flutter/material.dart';
import 'package:movies_app/features/movies_search/presentation/widgets/custom_search_bar.dart';

class CustomSearchAppBar extends StatelessWidget {
  const CustomSearchAppBar({
    super.key,
    required Animation<double> fadeAnimation,
    required bool isSearching,
    required TextEditingController searchController,
    required this.onSearchChanged,
  }) : _fadeAnimation = fadeAnimation,
       _isSearching = isSearching,
       _searchController = searchController;

  final Animation<double> _fadeAnimation;
  final bool _isSearching;
  final TextEditingController _searchController;
  final ValueChanged<String> onSearchChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 70),
          FadeTransition(
            opacity: _fadeAnimation,
            child: const Text(
              'Find Your Movie',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          const SizedBox(height: 20),

          CustomSearchBar(
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
              child: const Text(
                'Search Results',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
