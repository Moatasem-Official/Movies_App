import 'package:flutter/material.dart';
import 'skeletonizer_loading_widgets/custom_cast_skeletonizer_loading_widget.dart';
import 'skeletonizer_loading_widgets/custom_crew_skeletonizer_loading_widget.dart';
import 'skeletonizer_loading_widgets/custom_gallery_skeletonizer_loading_widget.dart';
import 'skeletonizer_loading_widgets/custom_genres_skeletonizer_loading_widget.dart';
import 'skeletonizer_loading_widgets/custom_over_view_skeletonizer_loading_widget.dart';
import 'skeletonizer_loading_widgets/custom_similar_skeletonizer_loading_widget.dart';
import 'skeletonizer_loading_widgets/custom_skeletonizer_bon.dart';
import 'skeletonizer_loading_widgets/custom_skeletonizer_sub_title_loading_widget.dart';
import 'skeletonizer_loading_widgets/custom_videos_skeletonizer_loading_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GeneralLoadingShapes {
  static Widget buildLoadingSection(int sectionIndex) {
    final loadingWidgets = <int, Widget>{
      1: const Column(
        children: [
          CustomSkeletonizerBon(width: double.infinity, height: 400),
          SizedBox(height: 20),
        ],
      ),
      2: const CustomSkeletonizerBon(
        width: 100,
        height: 20,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      3: const CustomSkeletonizerSubTitleLoadingWidget(),
      4: const CustomOverViewSkeletonizerLoadingWidget(),
      5: const CustomGenresSkeletonizerLoadingWidget(),
      6: const CustomCastSkeletonizerLoadingWidget(),
      7: const CustomCrewSkeletonizerLoadingWidget(),
      8: const CustomGallerySkeletonizerLoadingWidget(),
      9: const CustomSimilarSkeletonizerLoadingWidget(),
      10: const CustomVideosSkeletonizerLoadingWidget(),
    };

    return SliverToBoxAdapter(
      child: Skeletonizer(
        enabled: true,
        child: loadingWidgets[sectionIndex] ?? const SizedBox.shrink(),
      ),
    );
  }
}
