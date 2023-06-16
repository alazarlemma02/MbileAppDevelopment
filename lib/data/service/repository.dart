import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:todo_app/data/model/post_model.dart';

class PostRepository {
  Future<List<PostModel>> getDataFromApi() async {
    var client = http.Client();
    List<PostModel> posts = [];
    try {
      var response = await client
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

      List result = jsonDecode(response.body);

      for (int i = 0; i < result.length; i++) {
        PostModel post = PostModel.fromJson(result[i] as Map<String, dynamic>);
        posts.add(post);
      }
      return posts;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<bool> sendData(Map<String, dynamic> data) async {
    var client = http.Client();
    try {
      var response = await client.post(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
        body: jsonEncode(data),
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
    return false;
  }


}
