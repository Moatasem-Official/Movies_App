import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/see_all_movies/presentation/controllers/cubit/see_all_movies_cubit.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/core/cubits/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/features/see_all_movies/presentation/widgets/See_All_Elements_List_Screen/custom_card.dart';
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
  final int? movieId; // عشان similar movies

  @override
  State<SeeAllElementsListScreen> createState() =>
      _SeeAllElementsListScreenState();
}

class _SeeAllElementsListScreenState extends State<SeeAllElementsListScreen> {
  late final ScrollController _scrollController;
  int nextPage = 2;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);

    final cubit = context.read<SeeAllMoviesCubit>();
    if (widget.movieType != null) {
      cubit.getSeeAllMovies(movieType: widget.movieType!, reset: true);
    } else if (widget.movieId != null) {
      cubit.getSimilarMovies(movieId: widget.movieId!, reset: true);
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
      body: Padding(
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
                  idle: () => const Center(child: CircularProgressIndicator()),
                  loading: () {
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
      ),
    );
  }

  Widget _buildMoviesList(List<ResultEntity> movies,
      {bool showLoading = false}) {
    return ListView.builder(
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

class SkeletonCustomCard extends StatelessWidget {
  const SkeletonCustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      padding: const EdgeInsets.only(left: 10, right: 10),
      width: double.infinity,
      height: 220,
      child: const Row(
        children: [
          // صورة placeholder + زر المفضلة
          Stack(children: [
            SeeAllBone(
              width: 150,
              height: 200,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            Positioned(
              top: 5,
              left: 5,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                // ignore: prefer_const_constructors
                child: SeeAllBone.circle(size: 24),
              ),
            ),
          ]),
          // النصوص placeholders
          // ignore: prefer_const_constructors
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16, top: 20, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // title
                  SeeAllBone(
                      width: 100,
                      height: 16,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  SizedBox(height: 15),

                  // سنة الإصدار + تقييم
                  Row(
                    children: [
                      SeeAllBone(
                          width: 40,
                          height: 16,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      SizedBox(width: 30),
                      Row(
                        children: [
                          SeeAllBone.circle(
                              size: 16,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          SizedBox(width: 4),
                          SeeAllBone(
                              width: 24,
                              height: 16,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  // overview
                  SeeAllBone(
                      width: double.infinity,
                      height: 12,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  SizedBox(height: 4),
                  SeeAllBone(
                      width: double.infinity,
                      height: 12,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  SizedBox(height: 4),
                  SeeAllBone(
                      width: 200,
                      height: 12,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SeeAllBone extends StatelessWidget {
  final double? width;
  final double? height;
  final ShapeBorder shape;
  final BorderRadius? borderRadius;

  const SeeAllBone({
    super.key,
    this.width,
    this.height,
    this.borderRadius = BorderRadius.zero,
  }) : shape = const StadiumBorder();

  const SeeAllBone.circle({
    super.key,
    required double size,
    this.borderRadius = BorderRadius.zero,
  })  : width = size,
        height = size,
        shape = const CircleBorder();

  @override
  Widget build(BuildContext context) {
    return Bone(
      width: width,
      height: height,
      borderRadius: borderRadius,
    );
  }
}
