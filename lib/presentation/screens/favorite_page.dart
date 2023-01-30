import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/favorite_cubit/favorite_cubit.dart';
import '../../business_logic/home_cubit/home_page_cubit.dart';
import '../../data/models/photo_model.dart';
import '../widgets/favorite_page_widget/favorite_photo_viewer_widget.dart';
import '../widgets/favorite_page_widget/no_favorite_photo_widget.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    List<PhotoModel> listOfFavoritPhoto =
        BlocProvider.of<FavoriteCubit>(context).listOfFavoritePhoto;
    if (listOfFavoritPhoto.isNotEmpty) {
      return const FavoritPhotoWidget();
    } else {
      return const NoFavoritePhotoAddWidget();
    }
  }
}
