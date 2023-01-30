import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../business_logic/favorite_cubit/favorite_cubit.dart';
import '../../../core/utils/my_colors.dart';
import '../../../data/models/photo_model.dart';

// ignore: must_be_immutable
class FavoriteButton extends StatefulWidget {
  FavoriteButton({
    super.key,
    required this.isfavorite,
    required this.photo,
  });

  bool isfavorite;
  final PhotoModel photo;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (() {
        BlocProvider.of<FavoriteCubit>(context)
            .manageFavoritePhoto(widget.photo);
        setState(() {
          widget.isfavorite = BlocProvider.of<FavoriteCubit>(context)
              .isFavPhoto(widget.photo.id);
        });
      }),
      icon: widget.isfavorite
          ? Icon(
              Icons.favorite_rounded,
              size: 24.sp,
              color: MyColor.pink,
            )
          : Icon(
              Icons.favorite_border_rounded,
              size: 24.sp,
              color: MyColor.greey,
            ),
    );
  }
}
