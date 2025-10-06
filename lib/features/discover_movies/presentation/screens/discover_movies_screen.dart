import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/cubits/Movies_Module_States/movies_module_states.dart';
import '../../../../core/cubits/network/cubit/network_cubit.dart';
import '../../../../core/cubits/network/cubit/network_state.dart';
import '../../../../core/utils/app_constants.dart';
import '../controllers/cubit/discover_movies_cubit.dart';
import '../helpers/movies_categories_language_converter.dart';
import '../widgets/discover_skeletonizer_loading_widgets/skeleton_genre_card.dart';
import '../widgets/show_and_search_movies_of_category_screen/custom_discover_genre_card.dart';
import '../../../movie_details/presentation/widgets/movie_details_screen/custom_no_internet_widget.dart';
import '../../../../generated/l10n.dart';

class DiscoverMoviesScreen extends StatelessWidget {
  const DiscoverMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final networkState = context.watch<NetworkCubit>().state;
    final isDisconnected = networkState.maybeWhen(
      disconnected: () => true,
      orElse: () => false,
    );

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          S.of(context).discover,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocListener<NetworkCubit, NetworkState>(
        listener: (context, state) {
          if (state.maybeWhen(
            connected: (_) => true,
            orElse: () => false,
          )) {
            context.read<DiscoverMoviesCubit>().fetchDiscoverMovies();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<DiscoverMoviesCubit, MoviesModuleStates>(
            builder: (context, state) {
              return state.whenOrNull(
                    /// 🟡 الحالة الافتراضية (Idle)
                    idle: () => const SizedBox.shrink(),

                    /// 🟢 أثناء التحميل
                    loading: () => _buildLoadingState(isDisconnected),

                    /// 🔴 عند الخطأ
                    error: (failure) {
                      if (failure.message == "No Internet and No Cached Data") {
                        return const CustomNoInternetWidget();
                      }
                      return Center(
                          child: Text(failure.message,
                              style: const TextStyle(color: Colors.red)));
                    },

                    /// ✅ عند تحميل البيانات
                    loaded: (moviesCategories) =>
                        _buildGenresGrid(moviesCategories),
                  ) ??
                  const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }

  /// 🟢 ويدجت التحميل (Skeleton أو No Internet بعد تأخير)
  Widget _buildLoadingState(bool isDisconnected) {
    if (isDisconnected) {
      return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const CustomNoInternetWidget();
          }
          return _buildSkeletonGrid();
        },
      );
    }
    return _buildSkeletonGrid();
  }

  /// 🟢 ويدجت الشبكة السكلتونية أثناء التحميل
  Widget _buildSkeletonGrid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemCount: 8,
      itemBuilder: (context, index) => const SkeletonGenreCard(),
    );
  }

  /// ✅ ويدجت عرض التصنيفات بعد التحميل
  Widget _buildGenresGrid(dynamic moviesCategories) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemCount: moviesCategories.genres.length,
      itemBuilder: (context, index) {
        final genreFromApi = moviesCategories.genres[index];
        final style = AppConstants.genreDetails[genreFromApi.id];

        final color = style?['color'] as Color? ?? Colors.grey.shade800;
        final icon = style?['icon'] as IconData? ?? Icons.movie_rounded;

        return CustomDiscoverGenreCard(
          genreName: getGenreName(context, genreFromApi.name),
          genreId: genreFromApi.id,
          genreColor: color,
          genreIcon: icon,
        );
      },
    );
  }
}
