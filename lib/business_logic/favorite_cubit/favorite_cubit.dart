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
      listOfFavoritePhoto.removeAt(index);
      emit(PhotoRemovedFromFavoriteList());
      // savePhotosToLocalStorage(listOfFavoritePhoto);
    } else {
      listOfFavoritePhoto.add(photo);
      emit(PhotoAddToFavoriteList());
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
