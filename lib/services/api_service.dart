
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:task_api_leaning_for_project/model/post_model.dart';

class ApiService {
  static Future <List<Post>> fatchPosts () async {
    try{
      final respownse = await Dio().get('https://jsonplaceholder.typicode.com/posts');
      if(respownse.statusCode == 200){
        final List<dynamic> data = respownse.data;
        return data.map((json) => Post.fromJson(json)).toList();
      }else {
        throw Exception('Failed to load posts');
      }
      } catch (e) {
      throw Exception('Error fetching posts: $e');
    }
  }
}