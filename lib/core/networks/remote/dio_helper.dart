import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(baseUrl: 'https://ecommerce.routemisr.com'));
  }

  static void setToken(String token) {
    dio.options.headers = {'token': token};
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    Options? Options,
  }) async {
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
      options: Options,
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await dio.get(
      url,
      queryParameters: queryParameters,
      options: options,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    Options? Options,
  }) async {
    return await dio.delete(
      url,
      queryParameters: query,
      data: data,
      options: Options,
    );
  }
  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    Options? Options,
  }) async {
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
      options: Options,
    );
  }
}
