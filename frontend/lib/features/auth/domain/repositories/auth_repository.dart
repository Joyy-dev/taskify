import 'package:taskify/core/services/api_service.dart';

class AuthRepository {
  final ApiService apiService;

  AuthRepository({required this.apiService});

  Future<Map<String, dynamic>> register({required String name, required String email, required String password}) async {
    final response = await apiService.post(
      '/auth/register', 
      {
        'name': name,
        'email': email,
        'password': password
      }
    );
    return response.data['data'];
  }

  Future<Map<String, dynamic>> login({required String email, required String password}) async {
    final response = await apiService.post(
      '/auth/login',
      {
        'email':email,
        'password': password
      }
    );
    return response.data['data'];
  }
}