part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class LoadingePhotos extends SearchState {}

class NoSearchedPhotos extends SearchState {}

class ErrorPhotosSearche extends SearchState {}

class LoadedSearchePhotos extends SearchState {
  final List<PhotoModel> listOfSearchedPhoto;

  LoadedSearchePhotos(this.listOfSearchedPhoto);
}
