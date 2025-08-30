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
    return BlocBuilder<AddMovieToWatchListAsLocalDataCubit,
        AddMovieToWatchListAsLocalDataState>(
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
                          color: Colors.blueGrey.withOpacity(0.8),
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
