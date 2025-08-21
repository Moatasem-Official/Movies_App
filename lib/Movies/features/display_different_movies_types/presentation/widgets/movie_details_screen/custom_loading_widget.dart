import 'package:flutter/material.dart';

class CustomLoadingStateWidget extends StatelessWidget {
  const CustomLoadingStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 500,
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
