import 'package:dio/dio.dart';
import 'package:task_api_leaning_for_project/model/login_model.dart';

class LoginService {
  static Future<LoginModel?> loginUser(String email, String password) async {
    final dio = Dio();
    final uri = Uri.parse('https://api.learnova.info/api/v1/auth/login');

    try {
      final response = await dio.post(
        uri.toString(),
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200 && response.data['data'] != null) {
        return LoginModel.fromJson(response.data);
      } else {
        // You can even create an error model or handle it differently
        return null;
      }
    } catch (e) {
      print('Login error: $e');
      return null;
    }
  }
}
