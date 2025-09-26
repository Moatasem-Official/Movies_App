import 'package:flutter/material.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/skeletonizer_loading_widgets/custom_skeletonizer_bon.dart';

class CustomGallerySkeletonizerLoadingWidget extends StatelessWidget {
  const CustomGallerySkeletonizerLoadingWidget({
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
        Padding(
          padding: EdgeInsets.only(
            right: 10.0,
            left: 10,
          ),
          child: CustomSkeletonizerBon(
            width: double.infinity,
            height: 300,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        )
      ],
    );
  }
}
