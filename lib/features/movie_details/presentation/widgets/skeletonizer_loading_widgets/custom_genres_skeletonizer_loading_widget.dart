import 'package:flutter/material.dart';
import 'custom_skeletonizer_bon.dart';

class CustomGenresSkeletonizerLoadingWidget extends StatelessWidget {
  const CustomGenresSkeletonizerLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        CustomSkeletonizerBon(
          width: 100,
          height: 20,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        )
      ],
    );
  }
}
