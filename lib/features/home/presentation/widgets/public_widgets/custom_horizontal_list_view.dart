import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/entities/display_different_movies_types_entity.dart';
import '../../../../../core/cubits/Movies_Module_States/movies_module_states.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/utils/app_constants.dart';
import '../home_skeletonizer_loading_widgets/home_bone.dart';
import '../../../../watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomHorizontalListView<
        C extends Cubit<MoviesModuleStates<List<ResultEntity>>>>
    extends StatelessWidget {
  final C cubit;
  const CustomHorizontalListView({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<C, MoviesModuleStates<List<ResultEntity>>>(
      bloc: cubit,
      builder: (context, state) {
        return state.whenOrNull(
              idle: () => const Center(child: CircularProgressIndicator()),
              loading: () {
                return Skeletonizer(
                  enabled: true,
                  child: SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            // البوستر placeholder
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Bone(
                                width: 150,
                                height: 200,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            // الدايرة placeholder فوق البوستر
                            const Positioned(
                              top: 5,
                              left: 15,
                              child: HomeBone.circle(
                                size: 40,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                );
              },
              loaded: (List<ResultEntity> movies) {
                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      final watchlistCubit =
                          context.watch<AddMovieToWatchListAsLocalDataCubit>();
                      final isMovieInWatchList =
                          watchlistCubit.isMovieInWatchList(movies[index].id);
                      return GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          AppRouter.movieDetailsScreen,
                          arguments: {
                            "resultEntity": movies[index],
                            "id": movies[index].id,
                          },
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Container(
                                width: 150,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                      '${AppConstants.imagePathUrl}${movies[index].posterPath}',
                                      errorListener: (_) => const Icon(
                                        Icons.tv_rounded,
                                        size: 100,
                                        color: Color.fromARGB(255, 36, 43, 145),
                                      ),
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 5,
                              left: 15,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black54.withAlpha(150),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    context
                                        .read<
                                            AddMovieToWatchListAsLocalDataCubit>()
                                        .toggleMovieInWatchList(movies[index]);
                                  },
                                  icon: Icon(
                                    isMovieInWatchList
                                        ? Icons.bookmark_rounded
                                        : Icons.bookmark_border_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
              error: (Failure failure) {
                return Center(child: Text(failure.message));
              },
            ) ??
            const SizedBox.shrink();
      },
    );
  }
}
