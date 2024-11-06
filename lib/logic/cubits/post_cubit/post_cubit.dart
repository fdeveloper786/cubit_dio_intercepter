import 'package:api_bloc_cubit_dio/data/model/post_model.dart';
import 'package:api_bloc_cubit_dio/repository/post_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api_bloc_cubit_dio/logic/cubits/post_cubit/post_state.dart';

 /// Cubit Class for Post Data.
class PostCubit extends Cubit<PostState> {
  PostCubit() : super( PostLoadingState()) {
    fetchPosts();
  }

  PostRepo postRepo = PostRepo();

  void fetchPosts() async {
    try{
      List<PostModel> posts = await postRepo.fetchPost();
      emit(PostLoadedState(posts));
    } on DioException catch(ex){
      if(ex.type == DioExceptionType.connectionError) {
        emit(PostErrorState("Can't fetch posts, please check your internet connection!"));
      }else {
        emit (PostErrorState(ex.type.toString()));
      }
    }
  }

}