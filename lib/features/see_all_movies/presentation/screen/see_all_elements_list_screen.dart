import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/cubits/network/cubit/network_cubit.dart';
import '../../../../core/cubits/network/cubit/network_state.dart';
import '../../../movie_details/presentation/widgets/movie_details_screen/custom_no_internet_widget.dart';
import '../controllers/cubit/see_all_movies_cubit.dart';
import '../../../../core/entities/display_different_movies_types_entity.dart';
import '../../../../core/cubits/Movies_Module_States/movies_module_states.dart';
import '../widgets/See_All_Elements_List_Screen/custom_card.dart';
import '../widgets/skeletonizer_loading_widgets/skeleton_custom_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SeeAllElementsListScreen extends StatefulWidget {
  const SeeAllElementsListScreen({
    super.key,
    required this.title,
    this.movieType,
    this.movieId,
  });

  final String title;
  final String? movieType;
  final int? movieId;

  @override
  State<SeeAllElementsListScreen> createState() =>
      _SeeAllElementsListScreenState();
}

class _SeeAllElementsListScreenState extends State<SeeAllElementsListScreen> {
  late final ScrollController _scrollController;
  int nextPage = 2;
  bool isLoading = false;
  bool _waitingForNetwork = false;
  bool _showNoInternetWidget = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);

    final cubit = context.read<SeeAllMoviesCubit>();
    final hasInternet = context.read<NetworkCubit>().state.maybeWhen(
          connected: (_) => true,
          orElse: () => false,
        );

    if (widget.movieType != null) {
      if (hasInternet) {
        cubit.getSeeAllMovies(movieType: widget.movieType!, reset: true);
      } else {
        cubit.getCachedSeeAllMovies(movieType: widget.movieType!);
      }
    } else if (widget.movieId != null) {
      if (hasInternet) {
        cubit.getSimilarMovies(movieId: widget.movieId!, reset: true);
      }
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      if (!isLoading) {
        isLoading = true;

        final cubit = context.read<SeeAllMoviesCubit>();

        if (widget.movieType != null) {
          cubit.getSeeAllMovies(movieType: widget.movieType!);
        } else if (widget.movieId != null) {
          cubit.getSimilarMovies(movieId: widget.movieId!);
        }
      }
    }
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black.withAlpha(180),
        surfaceTintColor: Colors.black.withAlpha(180),
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: BlocConsumer<NetworkCubit, NetworkState>(
        listener: (context, state) {
          seeAllElementsChecker(
            state,
            context.read<SeeAllMoviesCubit>(),
            context.read<SeeAllMoviesCubit>().state,
          );
        },
        builder: (context, networkState) {
          final moviesCubit = context.watch<SeeAllMoviesCubit>();
          final isDisconnected = networkState.maybeWhen(
            disconnected: () => true,
            orElse: () => false,
          );

          final internetWidget =
              checkInternetConnectionBuilder(networkState, moviesCubit.state);

          if (internetWidget is! SizedBox) {
            return internetWidget;
          }

          return Padding(
            padding: const EdgeInsets.only(top: 15),
            child: BlocConsumer<SeeAllMoviesCubit,
                MoviesModuleStates<List<ResultEntity>>>(
              listener: (context, state) {
                state.whenOrNull(
                  loaded: (_) => isLoading = false,
                  error: (_) => isLoading = false,
                );
              },
              builder: (context, state) {
                return state.whenOrNull(
                      idle: () =>
                          const Center(child: CircularProgressIndicator()),
                      // 🟡 لو النت قطع أثناء التحميل
                      loading: () {
                        if (isDisconnected) {
                          if (!_waitingForNetwork) {
                            _waitingForNetwork = true;
                            Future.delayed(const Duration(seconds: 3), () {
                              if (mounted) {
                                setState(() {
                                  _showNoInternetWidget = true;
                                });
                              }
                            });
                          }

                          if (_showNoInternetWidget) {
                            return const CustomNoInternetWidget();
                          }

                          return Skeletonizer(
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return const SkeletonCustomCard();
                              },
                            ),
                          );
                        }

                        // 🟢 لودنج طبيعي
                        return Skeletonizer(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return const SkeletonCustomCard();
                            },
                          ),
                        );
                      },
                      paginated: (movies) =>
                          _buildMoviesList(movies, showLoading: true),
                      loaded: (movies) =>
                          _buildMoviesList(movies, showLoading: false),
                      error: (failure) => Center(child: Text(failure.message)),
                    ) ??
                    const SizedBox.shrink();
              },
            ),
          );
        },
      ),
    );
  }

  void seeAllElementsChecker(NetworkState networkState, SeeAllMoviesCubit cubit,
      MoviesModuleStates state) {
    if (networkState is Connected) {
      if (state is Idle || cubit.state is Error) {
        if (widget.movieType != null) {
          cubit.getSeeAllMovies(movieType: widget.movieType!, reset: true);
        } else if (widget.movieId != null) {
          cubit.getSimilarMovies(movieId: widget.movieId!, reset: true);
        }
      }
    }
  }

  Widget checkInternetConnectionBuilder(NetworkState networkState,
      MoviesModuleStates<List<ResultEntity>> categoryMoviesState) {
    final isDisconnected = networkState.maybeWhen(
      disconnected: () => true,
      orElse: () => false,
    );

    if (isDisconnected) {
      if (categoryMoviesState is Paginated || categoryMoviesState is Loaded) {
        final movies = categoryMoviesState.whenOrNull(
          paginated: (movies) => movies,
          loaded: (movies) => movies,
        );

        if (movies != null && movies.isNotEmpty) {
          return _buildMoviesList(movies, showLoading: false);
        } else {
          return const CustomNoInternetWidget();
        }
      }

      return const CustomNoInternetWidget();
    }

    return const SizedBox.shrink();
  }

  Widget _buildMoviesList(List<ResultEntity> movies,
      {bool showLoading = false}) {
    return ListView.builder(
      key: PageStorageKey(widget.title),
      controller: _scrollController,
      itemCount: movies.length + (showLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == movies.length) {
          return Skeletonizer(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) {
                return const SkeletonCustomCard();
              },
            ),
          );
        }
        return CustomCard(resultEntity: movies[index]);
      },
    );
  }
}
