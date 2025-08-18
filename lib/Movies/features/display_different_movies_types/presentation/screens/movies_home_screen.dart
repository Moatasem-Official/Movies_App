import 'package:flutter/material.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/widgets/movies_home_screen/custom_elements_row_title.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/widgets/movies_home_screen/custom_horizontal_list_view.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/widgets/movies_home_screen/custom_slider.dart';
import 'package:movies_app/app/app_router.dart';

class MoviesHomeScreen extends StatelessWidget {
  const MoviesHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomSlider(
              title: "NOW PLAYING",
              subtitle: "The Dark Knight",
              imageUrl: "assets/images/1852.jpg",
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 50)),
          SliverToBoxAdapter(
            child: CustomTitleOfListOfElements(
              title: "Popular Movies",
              onTap: () => Navigator.pushNamed(
                context,
                AppRouter.seeAllElementsListScreen,
              ),
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 10)),
          SliverToBoxAdapter(child: CustomHorizontalListView()),
          SliverToBoxAdapter(child: const SizedBox(height: 30)),
          SliverToBoxAdapter(
            child: CustomTitleOfListOfElements(
              title: "Top Rated Movies",
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 10)),
          SliverToBoxAdapter(child: CustomHorizontalListView()),
          SliverToBoxAdapter(child: const SizedBox(height: 30)),
        ],
      ),
    );
  }
}
