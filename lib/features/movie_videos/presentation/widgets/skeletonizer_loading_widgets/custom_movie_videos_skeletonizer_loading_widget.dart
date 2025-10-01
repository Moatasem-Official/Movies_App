import 'package:flutter/material.dart';
import 'package:movies_app/features/movie_videos/presentation/widgets/skeletonizer_loading_widgets/custom_skeletonizer_videos_bon.dart';

class CustomMovieVideosSkeletonizerLoadingWidget extends StatelessWidget {
  const CustomMovieVideosSkeletonizerLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          height: 140,
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            children: [
              // صورة الفيديو
              Container(
                margin: const EdgeInsets.all(10),
                width: 120,
                height: 120,
                child: CustomSkeletonizerVideosBon(
                  width: double.infinity,
                  height: double.infinity,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              // تفاصيل الفيديو
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // العنوان
                      CustomSkeletonizerVideosBon(
                        width: 150,
                        height: 16,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      const Spacer(),

                      // النوع
                      Row(
                        children: [
                          CustomSkeletonizerVideosBon(
                              width: 15,
                              height: 15,
                              borderRadius: BorderRadius.circular(4)),
                          const SizedBox(width: 8),
                          CustomSkeletonizerVideosBon(
                            width: 60,
                            height: 14,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // التاريخ + الانديكاتور
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CustomSkeletonizerVideosBon(
                                  width: 15,
                                  height: 15,
                                  borderRadius: BorderRadius.circular(4)),
                              const SizedBox(width: 8),
                              CustomSkeletonizerVideosBon(
                                width: 80,
                                height: 14,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ],
                          ),
                          // مكان الانديكاتور (ال gif الحقيقي)
                          CustomSkeletonizerVideosBon(
                            width: 50,
                            height: 20,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
