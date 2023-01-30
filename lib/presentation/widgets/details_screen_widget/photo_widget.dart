import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/photo_model.dart';

class BuildPhotoWidget extends StatelessWidget {
  const BuildPhotoWidget({
    Key? key,
    required this.photo,
  }) : super(key: key);
  final PhotoModel photo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450.h,
      width: double.infinity,
      child: Image(
        image: NetworkImage(photo.portrait), //todo: add portrait image
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) {
          return Center(
            child: Icon(
              Icons.broken_image_sharp,
              color: Colors.blueGrey,
              size: 40.sp,
            ),
          );
        },
      ),
    );
  }
}
