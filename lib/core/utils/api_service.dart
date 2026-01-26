import 'package:dio/dio.dart';

class ApiService {
  final Dio dio ;
  static const String baseUrl = 'https://fakestoreapi.com';

  ApiService({required  this.dio});
  Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await dio.get('$baseUrl/$endpoint');
    return response.data;
  }
}