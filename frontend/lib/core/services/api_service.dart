import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService() : dio = Dio(
    BaseOptions(
      baseUrl: 'https://localhost:5000',
    )
  );

  Future<Response> get(String endpoint) async {
    return await dio.get(endpoint);
  }

  Future<Response> post(String endpoint, Map<String, dynamic> data) async {
    return await dio.post(
      endpoint,
      data: data
    );
  }

  Future<Response> patch(String endpoint, Map<String, dynamic> data) async {
    return await dio.patch(
      endpoint,
      data: data
    );
  }

  Future<Response> delete(String endpoint) async {
    return await dio.delete(endpoint);
  }
}