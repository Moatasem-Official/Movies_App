import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/cubits/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/Movies/features/movie_details/presentation/widgets/movie_details_screen/custom_loading_widget.dart';
import 'package:movies_app/core/errors/failure.dart';

class CustomMovieDetailsBlocBuilderTemplete<
  C extends Cubit<MoviesModuleStates<T>>,
  T
>
    extends StatelessWidget {
  const CustomMovieDetailsBlocBuilderTemplete({
    super.key,
    required this.builder,
    required this.cubit,
  });

  final C cubit;
  final Widget Function(T data) builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<C, MoviesModuleStates<T>>(
      builder: (context, state) {
        return state.when(
          idle: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
          loading: () => const CustomLoadingStateWidget(),
          loaded: (T data) {
            return builder(data);
          },
          error: (Failure failure) {
            return SliverToBoxAdapter(
              child: Center(child: Text(failure.message)),
            );
          },
        );
      },
    );
  }
}
