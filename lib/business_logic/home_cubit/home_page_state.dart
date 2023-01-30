part of 'home_page_cubit.dart';

abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class PhotosLoadinge extends HomePageState {}

class PhotosError extends HomePageState {}

class PhotosLoaded extends HomePageState {
  final List<PhotoModel> listOfPhoto;

  PhotosLoaded(this.listOfPhoto);
}
