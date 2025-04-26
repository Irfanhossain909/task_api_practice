import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_api_leaning_for_project/screen/home/controller/post_controller.dart';
import 'package:task_api_leaning_for_project/screen/notification/notification_scren.dart';
import 'package:task_api_leaning_for_project/screen/slider_screen/slider_screen.dart';

void main() {
  Get.lazyPut<PostController>(() => PostController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: HomeScreen(),
      home: SliderScreen(),
    );
  }
}
