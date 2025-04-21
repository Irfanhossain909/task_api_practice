import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_api_leaning_for_project/screen/login/controller/login_controller.dart';

// void login(email, password) async {
//   final dio = Dio();
//   try {
//     final response = await dio.post(
//       'https://api.learnova.info/api/v1/auth/login',
//       data: {'email': email, 'password': password},
//     );

//     response.data.toString();
//     final accessToken = response.data['data']['accessToken'];
//     print('Access Token: $accessToken');

//     if (response.statusCode == 200) {
//       print('Acount Lodin');
//     } else {
//       print('feiled');
//     }
//   } catch (e) {
//     print(e.toString());
//   }
// }

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Login'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  loginController.login(
                    emailController.text,
                    passwordController.text,
                  );
                },
                child: const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
