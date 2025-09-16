import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/see_all_movies/presentation/controllers/cubit/see_all_movies_cubit.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/core/cubits/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/features/see_all_movies/presentation/widgets/See_All_Elements_List_Screen/custom_card.dart';

class SeeAllElementsListScreen extends StatefulWidget {
  const SeeAllElementsListScreen({
    super.key,
    required this.title,
    required this.movieType,
  });

  final String title;
  final String movieType;

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
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      if (!isLoading) {
        isLoading = true;
        context
            .read<SeeAllMoviesCubit>()
            .getSeeAllMovies(movieType: widget.movieType);
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
            return state.when(
              idle: () => const Center(child: CircularProgressIndicator()),
              loading: () => SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 100,
                child: const Center(child: CircularProgressIndicator()),
              ),
              paginated: (movies) =>
                  _buildMoviesList(movies, showLoading: true),
              loaded: (movies) => _buildMoviesList(movies, showLoading: false),
              error: (failure) => Center(child: Text(failure.message)),
            );
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
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
                child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Colors.white,
            )),
          );
        }
        return CustomCard(resultEntity: movies[index]);
      },
    );
  }
}
