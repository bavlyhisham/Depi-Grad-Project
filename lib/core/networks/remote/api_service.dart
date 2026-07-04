import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String _baseUrl = "https://ecommerce.routemisr.com";

  ApiService(this._dio);

  
  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    var response = await _dio.post(
      '$_baseUrl$endPoint',
      data: data,
    );
    return response.data;
  }
}