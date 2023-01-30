import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wallpaper_app/data/models/photo_model.dart';
import 'package:wallpaper_app/data/repositories/photos_repo.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());
  PhotoRepositores photoRepositores = PhotoRepositores();
  List<PhotoModel> listOfPhoto = [];
  List<PhotoModel> listOfFavoritePhoto = [];

  int page = 1;

  void getAllPhoto({String page = '1'}) {
    try {
      emit(PhotosLoadinge());
      photoRepositores.getAllPhoto(page: '3').then((photos) {
        if (photos == []) {
          emit(PhotosError());
        } else {
          listOfPhoto = photos;
          emit(PhotosLoaded(listOfPhoto));
        }
      });
    } catch (error) {
      emit(PhotosError());
      print(error.toString());
    }
  }

  void loadMorePhoto() {
    page += 1;
    try {
      photoRepositores.loadMorePhoto(page: page.toString()).then((photos) {
        listOfPhoto.addAll(photos);
        emit(PhotosLoaded(listOfPhoto));
      });
      print('loadMorePhoto+++++++++++++++++++++++++++++++1');
    } catch (error) {
      emit(PhotosError());
      print(error.toString());
    }
  }

  void searchForPhoto({String query = ''}) {
    try {
      emit(PhotosLoadinge());
      photoRepositores.searchForPhoto(query: query).then((photos) {
        listOfPhoto = photos;
        emit(PhotosLoaded(listOfPhoto));
      });
    } catch (error) {
      emit(PhotosError());
      print(error.toString());
    }
  }

  void downloadPhoto(PhotoModel photo) async {
    final tempDir = await getTemporaryDirectory();
    final path = '${tempDir.path}/myfile.jpg';
    await Dio().download(photo.large, path);
    await GallerySaver.saveImage(path, albumName: 'WallpaperApp');
  }

  void sharePhoto(PhotoModel photo) async {
    final url = Uri.parse(photo.large);
    final response = await http.get(url);
    final bytes = response.bodyBytes;
    final tempDir = await getTemporaryDirectory();
    final path = '${tempDir.path}/myfile.jpg';
    File(path).writeAsBytesSync(bytes);
    // ignore: deprecated_member_use
    await Share.shareFiles([path], text: 'this photo from wallpaper app');
  }
}
