import '../../../model/user_response.dart';

abstract class ResponseState {}

class ResponseLoadingState extends ResponseState {}
class ResponseLoadedState extends ResponseState {
  final List<UserResponse> posts;
  ResponseLoadedState(this.posts);
}
class ResponseErrorState extends ResponseState {
  final String err;
  ResponseErrorState(this.err);
}