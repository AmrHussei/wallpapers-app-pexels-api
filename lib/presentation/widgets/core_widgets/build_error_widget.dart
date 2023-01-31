import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/constant.dart';

class BuildErrorWidget extends StatelessWidget {
  const BuildErrorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 300.h,
          width: 300.h,
          child: Image.asset(errorPhoto),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          'something has been wrong try in another time',
          style: GoogleFonts.lato(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
