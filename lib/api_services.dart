import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.options.baseUrl = 'https://api.example.com';
    _dio.options.connectTimeout = 5000 as Duration?; // Timeout koneksi dalam milidetik
  }

  Future<Response> fetchData(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      return response;
    } catch (error) {
      throw error;
    }
  }
}
