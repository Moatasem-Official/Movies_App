import 'package:flutter/material.dart';

class MoviesHomeScreen extends StatelessWidget {
  const MoviesHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(child: Center(child: Text('Movies Home Screen'))),
    );
  }
}
