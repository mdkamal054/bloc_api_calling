

import 'package:bloc_api/data/model/post_model.dart';
import 'package:bloc_api/data/repositories/api/api.dart';
import 'package:dio/dio.dart';

class PostRepositories {
  API api = API();

  Future<List<PostModel>> fetchPosts() async {
    try {
      Response response = await api.sendRequest.get("/posts");
      List<dynamic> postMap = response.data;
      return postMap.map((map) => PostModel.fromJson(map)).toList();

    } catch (ex) {
      throw ex;
    }
  }
}
