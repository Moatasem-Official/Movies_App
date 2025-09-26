import 'package:flutter/material.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/skeletonizer_loading_widgets/custom_skeletonizer_bon.dart';

class CustomSkeletonizerSubTitleLoadingWidget extends StatelessWidget {
  const CustomSkeletonizerSubTitleLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          const Row(
            children: [
              CustomSkeletonizerBon(
                width: 100,
                height: 20,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              Spacer(),
              CustomSkeletonizerBon(
                width: 100,
                height: 20,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              Spacer(),
              CustomSkeletonizerBon(
                width: 100,
                height: 20,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              CustomSkeletonizerBon(
                width: 100,
                height: 20,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              Spacer(),
              CustomSkeletonizerBon(
                width: 100,
                height: 20,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ],
          ),
          const SizedBox(height: 20),
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 300,
                  height: 200,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        6,
                        (index) => const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: CustomSkeletonizerBon(
                            width: 100,
                            height: 20,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 200,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        6,
                        (index) => const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: CustomSkeletonizerBon(
                            width: 100,
                            height: 20,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomSkeletonizerBon(
            width: 100,
            height: 20,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          const SizedBox(
            height: 15,
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
                    padding: EdgeInsets.only(right: 10.0),
                    child: CustomSkeletonizerBon(
                      width: 200,
                      height: 120,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomSkeletonizerBon(
            width: 100,
            height: 20,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 60,
            width: 200,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  2,
                  (index) => const Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: CustomSkeletonizerBon(
                      height: 60,
                      width: 200,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomSkeletonizerBon(
            width: 100,
            height: 20,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 60,
            width: 200,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  2,
                  (index) => const Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: CustomSkeletonizerBon(
                      height: 60,
                      width: 200,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]);
  }
}
