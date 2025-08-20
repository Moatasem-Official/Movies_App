import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/controllers/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/core/error/failure.dart';

class CustomHorizontalListView<
  C extends Cubit<MoviesModuleStates<List<ResultEntity>>>
>
    extends StatelessWidget {
  final C cubit;
  const CustomHorizontalListView({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<C, MoviesModuleStates<List<ResultEntity>>>(
      bloc: cubit,
      builder: (context, state) {
        return state.when(
          idle: () => const Center(child: CircularProgressIndicator()),
          loading: () {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: const Center(child: CircularProgressIndicator()),
            );
          },
          loaded: (List<ResultEntity> movies) {
            return SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 7,
                itemBuilder: (context, index) {
                  final String baseUrl = "https://image.tmdb.org/t/p/w500";
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      width: 150,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                            '$baseUrl${movies[index].posterPath}',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
          error: (Failure failure) {
            return Center(child: Text(failure.message));
          },
        );
      },
    );
  }
}
