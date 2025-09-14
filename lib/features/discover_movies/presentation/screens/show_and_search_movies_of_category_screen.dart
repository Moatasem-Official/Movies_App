import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movies_app/features/discover_movies/presentation/widgets/show_and_search_movies_of_category_screen/custom_category_app_bar.dart';
import 'package:movies_app/features/movies_search/presentation/widgets/custom_initial_search_widget.dart';
import 'package:movies_app/features/movies_search/presentation/widgets/custom_search_movies_grid_result.dart';

class ShowAndSearchMoviesOfCategoryScreen extends StatefulWidget {
  const ShowAndSearchMoviesOfCategoryScreen(
      {super.key, required this.moviesCategoryName});

  final String moviesCategoryName;

  @override
  State<ShowAndSearchMoviesOfCategoryScreen> createState() =>
      _ShowAndSearchMoviesOfCategoryScreenState();
}

class _ShowAndSearchMoviesOfCategoryScreenState
    extends State<ShowAndSearchMoviesOfCategoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _animationController.forward();

    _searchController.addListener(() {
      setState(() {
        _isSearching = _searchController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(200),
          child: CustomCategoryAppBar(
            moviesCategoryName: widget.moviesCategoryName,
            onSearchChanged: (value) {},
            fadeAnimation: _fadeAnimation,
            isSearching: _isSearching,
            searchController: _searchController,
          ),
        ),
        backgroundColor: const Color(0xFF141218),
        body: _isSearching
            ? CustomSearchMoviesGridResult(
                movies: const [],
                animationController: _animationController,
              )
            : const CustomInitialSearchWidget());
  }
}
