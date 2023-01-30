import 'package:wallpaper_app/data/models/photo_model.dart';
import 'package:wallpaper_app/data/services/photos_services.dart';

class PhotoRepositores {
  PhotosServices photosServices = PhotosServices();

  Future<List<PhotoModel>> getAllPhoto({String page = '1'}) async {
    try {
      List photos = await photosServices.getAllPhoto();
      return photos.map((photo) => PhotoModel.fromJson(photo)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<PhotoModel>> loadMorePhoto({String page = '1'}) async {
    try {
      List photos = await photosServices.getAllPhoto(page: page);
      return photos.map((photo) => PhotoModel.fromJson(photo)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<PhotoModel>> searchForPhoto({String query = ''}) async {
    try {
      List photos = await photosServices.searchForPhoto(query: query);
      return photos.map((photo) => PhotoModel.fromJson(photo)).toList();
    } catch (e) {
      return [];
    }
  }
}
