import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../business_logic/search_cubit/search_cubit.dart';
import '../../core/utils/constant.dart';
import '../../core/utils/my_colors.dart';
import '../../data/models/photo_model.dart';
import '../widgets/core_widgets/loading_widget.dart';
import '../widgets/core_widgets/photos_builder_widget.dart';
import '../widgets/search_widgets/serch_text_form.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(5.h, 10.h, 5.h, 2.h),
        child: Column(
          children: [
            SerchFormFiled(
              textInputType: TextInputType.text,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black45,
                size: 21.h,
              ),
              hintText: 'Search for photo ex.nature,..',
            ),
            SizedBox(
              height: 10.h,
            ),
            const BuildSearchedPhotosViewer(),
          ],
        ),
      ),
    );
  }
}

class BuildSearchedPhotosViewer extends StatelessWidget {
  const BuildSearchedPhotosViewer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    late List<PhotoModel> listOfSearchedPhoto;
    return BlocBuilder<SearchCubit, SearchState>(
      builder: ((context, state) {
        if (state is LoadedSearchePhotos) {
          listOfSearchedPhoto = (state).listOfSearchedPhoto;
          return Expanded(
            child: CustomScrollView(
              slivers: [PhotosBuilderWidget(listOfPhoto: listOfSearchedPhoto)],
            ),
          );
        } else if (state is LoadingePhotos) {
          return const Expanded(
            child: CustomScrollView(
              slivers: [BuildLoadingWiget()],
            ),
          );
        } else {
          return const NoSearchWidget();
        }
      }),
    );
  }
}

class NoSearchWidget extends StatelessWidget {
  const NoSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80.h,
            ),
            SizedBox(
              height: 200.h,
              width: 200.w,
              child: Image.asset(noSearch),
            ),
            SizedBox(
              height: 5.h,
            ),
            Shimmer.fromColors(
              baseColor: MyColor.blue,
              highlightColor: Colors.grey[100]!,
              child: Text(
                'Search for somthing ',
                style: TextStyle(fontSize: 20.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
