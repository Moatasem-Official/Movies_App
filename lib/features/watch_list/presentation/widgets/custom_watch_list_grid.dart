import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_cubit.dart';
import 'package:movies_app/features/watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_state.dart';
import 'package:movies_app/features/watch_list/presentation/widgets/custom_empty_watch_list_widget.dart';
import 'package:movies_app/features/watch_list/presentation/widgets/custom_watch_list_card.dart';

class CustomWatchListGrid extends StatelessWidget {
  const CustomWatchListGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddMovieToWatchListAsLocalDataCubit,
        AddMovieToWatchListAsLocalDataState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Color.fromARGB(255, 45, 119, 48),
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.all(20),
                duration: Duration(seconds: 2),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                content: Text('Movie Removed From Watch List',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            );
            context
                .read<AddMovieToWatchListAsLocalDataCubit>()
                .getAllWatchListMovies();
          },
          error: (failure) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.all(20),
              duration: const Duration(seconds: 2),
              elevation: 2,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              content: Text(failure.message,
                  style: const TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
        );
      },
      builder: (context, state) {
        final widget = state.whenOrNull(
          initial: () => const SliverToBoxAdapter(
            child: Center(child: CustomEmptyWatchListWidget()),
          ),
          getListLoading: () => const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          ),
          getListSuccess: (result) {
            if (result.isEmpty) {
              return const SliverToBoxAdapter(
                  child: Center(child: CustomEmptyWatchListWidget()));
            } else {
              return SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.65,
                  ),
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return Dismissible(
                      key: Key(result[index].id.toString()),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) => context
                          .read<AddMovieToWatchListAsLocalDataCubit>()
                          .removeMovieFromWatchList(movieId: result[index].id),
                      background: Container(
                        decoration: BoxDecoration(
                          color: Colors.redAccent.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20),
                        child: const Icon(
                          Icons.delete_sweep_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      child: CustomWatchListCard(movie: result[index]),
                    );
                  }, childCount: result.length),
                ),
              );
            }
          },
          getListError: (failure) =>
              SliverToBoxAdapter(child: Center(child: Text(failure.message))),
        );
        return widget ?? const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
