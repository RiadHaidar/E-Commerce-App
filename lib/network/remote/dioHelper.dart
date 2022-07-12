import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static inti() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> postData({
    required String path,
    required Map<dynamic, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    return await dio.post(
      path,
      queryParameters: query,
      data: data,
    );

  } 
  

 static Future<Response> getData({
    required String path,
     Map<dynamic, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    return await dio.get(
      path,
      queryParameters: query,
    );
  }
}


