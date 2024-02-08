import 'package:bloc/bloc.dart';
import 'package:flutter_task/model/user_response.dart';
import 'package:flutter_task/repository/post_repository.dart';
import 'package:flutter_task/ui/user_data/cubit/response_state.dart';

class ResponseCubit extends Cubit<ResponseState> {
  ResponseCubit():super(ResponseLoadingState()){
    fetchData();
  }

  PostRepository postRepository = PostRepository();
  void fetchData() async {
    try {
      List<UserResponse> posts = await postRepository.fetchPosts();
      emit(ResponseLoadedState(posts));
    } catch(e) {
      emit(ResponseErrorState(e.toString()));
    }
  }

}