import 'package:get/get.dart';
import 'package:task_api_leaning_for_project/model/post_model.dart';

import '../../services/api_service.dart';

class PostController extends GetxController {
  var postList = <Post>[].obs;

  Future<void> getPosts() async {
    try {
      postList.value = await ApiService.fatchPosts();
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    getPosts();
  }
}