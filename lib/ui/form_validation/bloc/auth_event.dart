class AuthEvent {}

class AuthLoginRequested extends AuthEvent {
  final String name;
  final String email;
  final String phone;
  final String country;
  final String state;
  final String city;
  final String password;
  final String confirmPassword;

  AuthLoginRequested({
    required this.name,required this.email,required this.phone,required this.country,required this.state,required this.city,required this.password,required this.confirmPassword, });
}