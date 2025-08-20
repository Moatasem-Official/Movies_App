import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/controllers/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/widgets/See_All_Elements_List_Screen/custom_card.dart';
import 'package:movies_app/core/error/failure.dart';

class SeeAllElementsListScreen<
  C extends Cubit<MoviesModuleStates<List<ResultEntity>>>
>
    extends StatelessWidget {
  const SeeAllElementsListScreen({
    super.key,
    required this.title,
    required this.cubit,
  });

  final String title;
  final C cubit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
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
        child: BlocBuilder<C, MoviesModuleStates<List<ResultEntity>>>(
          bloc: cubit,
          builder: (context, state) {
            return state.when(
              idle: () => const Center(child: CircularProgressIndicator()),
              loading: () => SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 100,
                child: const Center(child: CircularProgressIndicator()),
              ),
              loaded: (List<ResultEntity> movies) => ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) =>
                    CustomCard(resultEntity: movies[index]),
              ),
              error: (Failure failure) {
                return Center(child: Text(failure.message));
              },
            );
          },
        ),
      ),
    );
  }
}
