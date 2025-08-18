import 'package:flutter/material.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/widgets/See_All_Elements_List_Screen/custom_card.dart';

class SeeAllElementsListScreen extends StatelessWidget {
  const SeeAllElementsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "Popular Movies",
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
          itemCount: 15,
          itemBuilder: (context, index) => const CustomCard(),
        ),
      ),
    );
  }
}
