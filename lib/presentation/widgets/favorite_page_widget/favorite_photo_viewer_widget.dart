import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_app/presentation/widgets/core_widgets/photos_builder_widget.dart';
import '../../../business_logic/favorite_cubit/favorite_cubit.dart';
import '../../../data/models/photo_model.dart';
import 'no_favorite_photo_widget.dart';

class FavoritPhotoWidget extends StatelessWidget {
  const FavoritPhotoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<PhotoModel> listOfFavoritPhoto =
        BlocProvider.of<FavoriteCubit>(context).listOfFavoritePhoto;
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (listOfFavoritPhoto.isEmpty) {
          return const NoFavoritePhotoAddWidget();
        } else if (state is PhotoAddToFavoriteList) {
          //to refresh the page if the user delete iteme from the favorite oage
          return CustomScrollViewWidgetBuilder(
              listOfFavoritPhoto: listOfFavoritPhoto);
        } else {
          return CustomScrollViewWidgetBuilder(
              listOfFavoritPhoto: listOfFavoritPhoto);
        }
      },
    );
  }
}

class CustomScrollViewWidgetBuilder extends StatelessWidget {
  const CustomScrollViewWidgetBuilder({
    super.key,
    required this.listOfFavoritPhoto,
  });

  final List<PhotoModel> listOfFavoritPhoto;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10.h, 0, 2.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'favorit photo',
                  style: GoogleFonts.lato(
                      fontSize: 18.sp,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  PhotosBuilderWidget(listOfPhoto: listOfFavoritPhoto),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
