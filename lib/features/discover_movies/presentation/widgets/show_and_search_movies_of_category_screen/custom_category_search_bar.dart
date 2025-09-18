import 'dart:ui';

import 'package:flutter/material.dart';

class CustomCategorySearchBar extends StatelessWidget {
  const CustomCategorySearchBar({
    super.key,
    required this.searchController,
    required this.isSearching,
    required this.onChanged,
    required this.moviesCategoryName,
  });

  final TextEditingController searchController;
  final bool isSearching;
  final ValueChanged<String> onChanged;
  final String moviesCategoryName;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'search-bar',
      child: Material(
        color: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: TextField(
                controller: searchController,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                decoration: InputDecoration(
                  hintText: 'Search For $moviesCategoryName Movies...',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.4)),
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: Colors.white.withOpacity(0.6),
                  ),
                  suffixIcon: isSearching
                      ? IconButton(
                          icon: Icon(
                            Icons.clear_rounded,
                            color: Colors.white.withOpacity(0.6),
                          ),
                          onPressed: () {
                            searchController.clear();
                            onChanged('');
                          },
                        )
                      : null,
                ),
                onChanged: onChanged,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
