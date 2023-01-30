import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_app/core/utils/my_colors.dart';
import 'package:wallpaper_app/data/models/photo_model.dart';
import '../../business_logic/favorite_cubit/favorite_cubit.dart';
import '../widgets/details_screen_widget/favorite_button.dart';
import '../widgets/details_screen_widget/features_widgets.dart';
import '../widgets/details_screen_widget/photo_widget.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatefulWidget {
  DetailsScreen({super.key, required this.photo});
  final PhotoModel photo;
  bool isfavorite = false;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();
    widget.isfavorite =
        BlocProvider.of<FavoriteCubit>(context).isFavPhoto(widget.photo.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(
          context,
          widget.isfavorite,
          widget.photo,
        ),
        body: Column(
          children: [
            BuildPhotoWidget(photo: widget.photo),
            BuildFeaturesWidget(
              photo: widget.photo,
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    bool isfavorite,
    PhotoModel photo,
  ) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        Padding(
          padding: EdgeInsets.all(6.h),
          child: FavoriteButton(
            isfavorite: isfavorite,
            photo: photo,
          ),
        )
      ],
      title: Padding(
        padding: EdgeInsets.all(6.h),
        child: Text(
          'Photo Details',
          style: GoogleFonts.lato(color: Colors.black, fontSize: 18.sp),
        ),
      ),
      leading: Padding(
        padding: EdgeInsets.only(top: 2.h, left: 6.sp),
        child: IconButton(
          onPressed: (() {
            Navigator.pop(context);
          }),
          icon: Icon(
            Icons.arrow_back_ios,
            color: MyColor.greey,
            size: 24.sp,
          ),
        ),
      ),
    );
  }
}
