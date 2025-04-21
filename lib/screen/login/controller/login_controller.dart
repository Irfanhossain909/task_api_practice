import 'package:get/get.dart';
import 'package:task_api_leaning_for_project/services/login_service.dart';

class LoginController extends GetxController {
  Future<void> login(String email, String password) async {
    final response = await LoginService.loginUser(email, password);

    if (response != null) {
      print("Access Token: ${response.accessToken}");
      // Save token or navigate
    } else {
      print("Login failed");
    }
  }
}
