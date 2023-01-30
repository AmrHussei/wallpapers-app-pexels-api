import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/photo_model.dart';
part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  List<PhotoModel> listOfFavoritePhoto = [];

  void manageFavoritePhoto(PhotoModel photo) {
    var index =
        listOfFavoritePhoto.indexWhere((element) => element.id == photo.id);
    if (index >= 0) {
      emit(PhotoRemovedFromFavoriteList());
      listOfFavoritePhoto.removeAt(index);
      // savePhotosToLocalStorage(listOfFavoritePhoto);
    } else {
      emit(PhotoAddToFavoriteList());
      listOfFavoritePhoto.add(photo);
      // savePhotosToLocalStorage(listOfFavoritePhoto);
      print('listOfFavoritePhoto*****************************');
      print(listOfFavoritePhoto);
    }
  }

  bool isFavPhoto(int idItem) {
    bool result = listOfFavoritePhoto.any((element) => element.id == idItem);

    return result;
  }
}
