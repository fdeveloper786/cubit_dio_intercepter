import 'package:api_bloc_cubit_dio/data/api/api.dart';
import 'package:api_bloc_cubit_dio/data/model/post_model.dart';
import 'package:dio/dio.dart';

class PostRepo {
  API api = API();

  Future<List<PostModel>> fetchPost() async {
    try {
      Response response = await api.sendRequest.get("/posts");
      List<dynamic> postMaps = response.data;
      return postMaps.map((postMaps) => PostModel.fromJson(postMaps)).toList();
    } catch (ex) {
      rethrow;
    }
  }

}