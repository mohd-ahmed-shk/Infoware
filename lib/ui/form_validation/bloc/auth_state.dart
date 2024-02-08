abstract class AuthState {}

class AuthInitial extends AuthState {}
class AuthSuccess extends AuthState {
  final String success;
  AuthSuccess({required this.success});
}
class AuthFailure extends AuthState {
  final String error;
  AuthFailure({required this.error});
}