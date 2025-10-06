import 'package:flutter/material.dart';
import 'custom_skeletonizer_bon.dart';

class CustomSimilarSkeletonizerLoadingWidget extends StatelessWidget {
  const CustomSimilarSkeletonizerLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 200,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                  2,
                  (index) => const Padding(
                        padding: EdgeInsets.only(
                          right: 10.0,
                        ),
                        child: CustomSkeletonizerBon(
                          width: 200,
                          height: 500,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      )),
            ),
          ),
        )
      ],
    );
  }
}
