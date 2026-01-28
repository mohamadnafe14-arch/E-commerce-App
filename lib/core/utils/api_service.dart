import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  static const String baseUrl = 'https://fakestoreapi.com';

  ApiService({required this.dio});
  Future<dynamic> get(String endpoint) async {
    final response = await dio.get('$baseUrl$endpoint');
    return response.data;
  }
  Future<dynamic> post(String endpoint, Map<String, dynamic> data) async {
    final response = await dio.post('$baseUrl$endpoint', data: data);
    return response.data;
  }
  Future<dynamic> put(String endpoint, Map<String, dynamic> data) async {
    final response = await dio.put('$baseUrl$endpoint', data: data);
    return response.data;
  }
  Future<dynamic> delete(String endpoint) async {
    final response = await dio.delete('$baseUrl$endpoint');
    return response.data;
  }
}
