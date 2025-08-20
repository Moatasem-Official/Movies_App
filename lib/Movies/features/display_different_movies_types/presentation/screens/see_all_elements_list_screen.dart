import 'package:flutter/material.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/widgets/See_All_Elements_List_Screen/custom_card.dart';

class SeeAllElementsListScreen extends StatelessWidget {
  const SeeAllElementsListScreen({
    super.key,
    required this.title,
    required this.movies,
  });

  final String title;
  final List<ResultEntity> movies;

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
        child: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) =>
              CustomCard(resultEntity: movies[index]),
        ),
      ),
    );
  }
}
