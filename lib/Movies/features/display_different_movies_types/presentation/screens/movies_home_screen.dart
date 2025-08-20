import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/controllers/movies_home_screen/cubits/popular_movies_cubit.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/controllers/movies_home_screen/cubits/top_rated_movies_cubit.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/widgets/movies_home_screen/custom_elements_row_title.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/widgets/public_widgets/custom_horizontal_list_view.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/widgets/movies_home_screen/custom_slider.dart';
import 'package:movies_app/app/app_router.dart';

class MoviesHomeScreen extends StatelessWidget {
  const MoviesHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: CustomSlider(title: "NOW PLAYING")),
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
          SliverToBoxAdapter(
            child: CustomHorizontalListView(
              cubit: context.read<PopularMoviesCubit>(),
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 30)),
          SliverToBoxAdapter(
            child: CustomTitleOfListOfElements(
              title: "Top Rated Movies",
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 10)),
          SliverToBoxAdapter(
            child: CustomHorizontalListView(
              cubit: context.read<TopRatedMoviesCubit>(),
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 30)),
        ],
      ),
    );
  }
}
