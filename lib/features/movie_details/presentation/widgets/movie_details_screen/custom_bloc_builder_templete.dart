import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/cubits/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/general_loading_shapes.dart';

class CustomMovieDetailsBlocBuilderTemplete<
    C extends Cubit<MoviesModuleStates<T>>, T> extends StatelessWidget {
  const CustomMovieDetailsBlocBuilderTemplete({
    super.key,
    required this.builder,
    required this.cubit,
    required this.sectionIndex,
  });

  final C cubit;
  final Widget Function(T data) builder;
  final int sectionIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<C, MoviesModuleStates<T>>(
      builder: (context, state) {
        return state.whenOrNull(
              idle: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
              loading: () =>
                  GeneralLoadingShapes.buildLoadingSection(sectionIndex),
              loaded: (T data) {
                return builder(data);
              },
              error: (Failure failure) {
                return SliverToBoxAdapter(
                  child: Center(child: Text(failure.message)),
                );
              },
            ) ??
            const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
