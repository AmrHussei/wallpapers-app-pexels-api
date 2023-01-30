part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class PhotoAddToFavoriteList extends FavoriteState {}

class PhotoRemovedFromFavoriteList extends FavoriteState {}

class IsFavoritePhoto extends FavoriteState {}

class NotFavoritePhoto extends FavoriteState {}
