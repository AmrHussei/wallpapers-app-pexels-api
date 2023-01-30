import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import 'package:wallpaper_app/data/models/photo_model.dart';

import 'package:wallpaper_app/presentation/widgets/loading_widget.dart';
import 'package:wallpaper_app/presentation/widgets/photos_builder_widget.dart';

import '../../../business_logic/home_cubit/home_page_cubit.dart';
import '../build_error_widget.dart';

// ignore: must_be_immutable
class BuildPhotosViewer extends StatelessWidget {
  BuildPhotosViewer({
    Key? key,
  }) : super(key: key);
  late List<PhotoModel> listOfPhoto;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: ((context, state) {
        if (state is PhotosLoaded) {
          listOfPhoto = (state).listOfPhoto;
          return PhotosBuilderWidget(listOfPhoto: listOfPhoto);
        } else if (state is PhotosLoadinge) {
          return const BuildLoadingWiget();
        } else {
          return const TryToRefreshWiget();
        }
      }),
    );
  }
}

class TryToRefreshWiget extends StatelessWidget {
  const TryToRefreshWiget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: [
          const QuiltedGridTile(2, 1),
          const QuiltedGridTile(1, 1),
        ],
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Shimmer.fromColors(
              baseColor: Colors.grey[350]!,
              highlightColor: Colors.grey[100]!,
              child: Text(
                'Try to refresh please',
                style: GoogleFonts.lato(fontSize: 16.sp),
              ));
        },
        childCount: 10,
      ),
    );
  }
}
