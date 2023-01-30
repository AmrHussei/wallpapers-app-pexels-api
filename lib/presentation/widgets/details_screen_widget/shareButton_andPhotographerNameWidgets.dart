import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../business_logic/home_cubit/home_page_cubit.dart';
import '../../../core/utils/my_colors.dart';
import '../../../data/models/photo_model.dart';

class ShareButtonAndPhotographerNameWidgets extends StatelessWidget {
  const ShareButtonAndPhotographerNameWidgets({
    super.key,
    required this.photo,
  });

  final PhotoModel photo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                photo.photographer,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.lato(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                photo.alt,
                style: GoogleFonts.lato(
                  fontSize: 14.sp,
                  color: MyColor.greey,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const Spacer(),
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.sp)),
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 32.w)),
          onPressed: () async {
            BlocProvider.of<HomePageCubit>(context).sharePhoto(photo);
          },
          icon: const Icon(
            CupertinoIcons.share,
            color: Colors.black,
          ),
          label: Text(
            'Share ',
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
