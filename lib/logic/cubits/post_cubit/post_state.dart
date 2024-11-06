import 'package:api_bloc_cubit_dio/data/model/post_model.dart';

/// Common Class for Post API
abstract class PostState {}   

class PostLoadingState extends PostState {}

class PostLoadedState extends PostState {
  final List<PostModel> posts;
  PostLoadedState(this.posts);
}

class PostErrorState extends PostState {
  final String error;
  PostErrorState(this.error);
}