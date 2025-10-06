import 'package:flutter/material.dart';

class CustomLoadingStateWidget extends StatelessWidget {
  const CustomLoadingStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 500,
      child: const Center(
          child: CircularProgressIndicator(
        strokeWidth: 2,
        color: Colors.white,
      )),
    );
  }
}
