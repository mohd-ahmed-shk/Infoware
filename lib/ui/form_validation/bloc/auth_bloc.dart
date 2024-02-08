import 'package:bloc/bloc.dart';
import 'package:flutter_task/ui/form_validation/bloc/auth_event.dart';
import 'package:flutter_task/ui/form_validation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) async {
      final bool emailValid =
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(event.email);



      Pattern pattern =
          r'/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/';
      final bool phoneValid = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(event.phone);



      try {
        if (event.name.isEmpty) {
          return emit(AuthFailure(error: "Please enter your name"));
        }
        if (event.email.isEmpty) {
          return emit(AuthFailure(error: "Please enter your email"));
        }
        if (emailValid == false) {
          return emit(AuthFailure(error: "Please enter valid email"));
        }
        if (event.phone.isEmpty) {
          return emit(AuthFailure(error: "Please enter your phone number"));
        }
        if (phoneValid == false) {
          return emit(AuthFailure(error: "Please enter your valid phone number"));
        }
        if (event.country.isEmpty) {
          return emit(AuthFailure(error: "Please enter your country name"));
        }
        if (event.state.isEmpty) {
          return emit(AuthFailure(error: "Please enter your state name"));
        }
        if (event.city.isEmpty) {
          return emit(AuthFailure(error: "Please enter your city name"));
        }
        if (event.password.isEmpty) {
          return emit(AuthFailure(error: "Please enter your password"));
        }
        if (event.confirmPassword.length < 6) {
          return emit(AuthFailure(error: "Password length should be greater than 6"));
        }
        if (event.confirmPassword.isEmpty) {
          return emit(AuthFailure(error: "Please enter your confirm password"));
        }

        if (event.password != event.confirmPassword) {
          return emit(AuthFailure(error: "Password does not match"));
        }
        await Future.delayed(
          const Duration(seconds: 2),
          () {
            return emit(AuthSuccess(success: 'Successful'));
          },
        );
      } catch (e) {
        return emit(AuthFailure(error: e.toString()));
      }
    });
  }
}
