import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../business_logic/home_cubit/home_page_cubit.dart';
import '../../../core/utils/my_colors.dart';
import '../../../data/models/photo_model.dart';

class DowenloadedButtonAndPhotoAvgColorWidgets extends StatelessWidget {
  const DowenloadedButtonAndPhotoAvgColorWidgets({
    super.key,
    required this.photo,
  });

  final PhotoModel photo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          photo.avgColor,
          style: TextStyle(
            fontSize: 16.sp,
            color: MyColor.greey,
          ),
        ),
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.sp)),
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w)),
          onPressed: () {
            BlocProvider.of<HomePageCubit>(context).downloadPhoto(photo);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Photo Downloaded to Gallery'),
              ),
            );
          },
          icon: const Icon(
            CupertinoIcons.cloud_download,
            color: Colors.black,
          ),
          label: Text(
            'Download ',
            style: GoogleFonts.lato(
              fontSize: 16.sp,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
