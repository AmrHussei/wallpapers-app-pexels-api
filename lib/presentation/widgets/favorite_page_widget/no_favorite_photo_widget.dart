import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utils/constant.dart';
import '../../../core/utils/my_colors.dart';

class NoFavoritePhotoAddWidget extends StatelessWidget {
  const NoFavoritePhotoAddWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200.h,
              width: 200.w,
              child: Image.asset(notFound),
            ),
            SizedBox(
              height: 5.h,
            ),
            Shimmer.fromColors(
              baseColor: MyColor.blue,
              highlightColor: Colors.grey[100]!,
              child: Text(
                'No favorite item added',
                style: TextStyle(fontSize: 20.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
