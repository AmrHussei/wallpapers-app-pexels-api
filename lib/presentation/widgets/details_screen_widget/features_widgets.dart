import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_app/presentation/widgets/details_screen_widget/share_button_widget.dart';
import '../../../data/models/photo_model.dart';
import 'dowenloadedButton_andPhoto_avgColor_widgets.dart';
import 'shareButton_andPhotographerNameWidgets.dart';

class BuildFeaturesWidget extends StatelessWidget {
  const BuildFeaturesWidget({
    Key? key,
    required this.photo,
  }) : super(key: key);

  final PhotoModel photo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: Column(
        children: [
          ShareButtonAndPhotographerNameWidgets(photo: photo),
          SizedBox(
            height: 10.h,
          ),
          DowenloadedButtonAndPhotoAvgColorWidgets(photo: photo),
        ],
      ),
    );
  }
}
