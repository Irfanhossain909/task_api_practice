import 'package:dio/dio.dart';

class LoginService {
  static Future<Map<String, dynamic>> loginUser(
    String email,
    String password,
  ) async {
    final dio = Dio();
    final uri = Uri.parse(
      'https://api.learnova.info/api/v1/auth/login',
    ); // change this to your actual endpoint

    try {
      final response = await dio.post(
        uri.toString(),
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        return {
          'success': true,
          'accessToken': response.data['data']['accessToken'],
          'refreshToken': response.data['data']['refreshToken'],
          'message': response.data['message'],
        };
      } else {
        return {'message': response.data['message'] ?? 'Login failed'};
      }
    } catch (e) {
      return {'success': false, 'message': 'Error: $e'};
    }
  }
}
