import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/photo_model.dart';
import '../../data/repositories/photos_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  PhotoRepositores photoRepositores = PhotoRepositores();
  List<PhotoModel> listOfSearchedPhoto = [];

  void searchForPhoto({String query = ''}) {
    try {
      if (query == '') {
        emit(NoSearchedPhotos());
      } else if (query != '') {
        emit(LoadingePhotos());
        photoRepositores.searchForPhoto(query: query).then((photos) {
          listOfSearchedPhoto = photos;
          emit(LoadedSearchePhotos(listOfSearchedPhoto));
        });
      }
    } catch (error) {
      emit(ErrorPhotosSearche());
      print(error.toString());
    }
  }
}
