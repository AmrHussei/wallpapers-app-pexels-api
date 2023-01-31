import 'package:dio/dio.dart';
import 'package:wallpaper_app/core/utils/constant.dart';

class PhotosServices {
  Dio dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    headers: {
      'Authorization':
          '6ToZy0xElfO6gIr1QVSEZ2OWdYU1vBSM3kbkFV40tG0D1r1CfygWEbLx'
    },
    receiveDataWhenStatusError: true,
    connectTimeout: 30 * 1000,
    receiveTimeout: 30 * 1000,
  ));

  Future<List<dynamic>> getAllPhoto({String page = '1'}) async {
    try {
      Response response = await dio.get('curated?page=$page&per_page=20');

      print(response.data['photos']);
      return response.data['photos'];
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<dynamic>> searchForPhoto({String query = ''}) async {
    try {
      Response response = await dio.get('search?query=$query&per_page=20');
      print(response.data['photos']);
      return response.data['photos'];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
