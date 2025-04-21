import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/post_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final postController = Get.find<PostController>();

    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: Obx(() {
        if (postController.postList.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: postController.postList.length,
          itemBuilder: (context, index) {
            final post = postController.postList[index];
            return ListTile(
              leading: Text(post.id.toString()),
              title: Text(post.title),
              // subtitle: Text(post.des),
            );
          },
        );
      }),
    );
  }
}
