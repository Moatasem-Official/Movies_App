import 'package:flutter/material.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/skeletonizer_loading_widgets/custom_skeletonizer_bon.dart';

class CustomOverViewSkeletonizerLoadingWidget extends StatelessWidget {
  const CustomOverViewSkeletonizerLoadingWidget({
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
        ),
        SizedBox(
          height: 10,
        ),
        CustomSkeletonizerBon(
          width: 100,
          height: 20,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ],
    );
  }
}
