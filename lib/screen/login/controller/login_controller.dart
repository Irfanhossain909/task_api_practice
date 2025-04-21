import 'package:get/get.dart';
import 'package:task_api_leaning_for_project/services/login_service.dart';

class LoginController extends GetxController {
  var accessToken = ''.obs;
  var refreshToken = ''.obs;

  Future<void> login(String email, String password) async {
    final result = await LoginService.loginUser(email, password);

    if (result['success']) {
      accessToken.value = result['accessToken'];
      refreshToken.value = result['refreshToken'];
      print('Access Token: ${accessToken.value}');
      print('Refresh Token: ${refreshToken.value}');
      // You can also store token in local storage here
    } else {}
  }
}
