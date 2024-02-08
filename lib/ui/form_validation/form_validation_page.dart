import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/ui/form_validation/bloc/auth_bloc.dart';
import 'package:flutter_task/ui/form_validation/bloc/auth_event.dart';
import 'package:flutter_task/widgets/app_text_from_field.dart';
import 'package:flutter_task/widgets/base_app_bar.dart';

import 'bloc/auth_state.dart';

class FormValidationPage extends StatefulWidget {
  const FormValidationPage({super.key});

  @override
  State<FormValidationPage> createState() => _FormValidationPageState();
}

class _FormValidationPageState extends State<FormValidationPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _countryController = TextEditingController();
  final _stateController = TextEditingController();
  final _cityController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: BaseAppBar(
          title: Text(
            'Sign In',
            style: TextStyle(fontSize: 25.sp),
          ),
          backgroundColor: Colors.transparent),
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                state.error,
                style: const TextStyle(color: Colors.red),
              )));
            }
          },
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  labelText("Name"),
                  AppTextFormField(
                    ctrl: _nameController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    prefixIcon: Icon(
                      Icons.person_4_outlined,
                      color: Colors.grey,
                      size: 15.r,
                    ),
                    hintText: 'Type your name',
                  ),
                  20.verticalSpace,
                  labelText("Email"),
                  AppTextFormField(
                    ctrl: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.grey,
                      size: 15.r,
                    ),
                    hintText: 'Type your email',
                  ),
                  20.verticalSpace,
                  labelText("Phone Number"),
                  AppTextFormField(
                    ctrl: _phoneController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    hintText: 'Type your phone number',
                    prefixIcon: Icon(
                      Icons.dialpad_outlined,
                      color: Colors.grey,
                      size: 15.r,
                    ),
                  ),
                  20.verticalSpace,
                  labelText('Country'),
                  AppTextFormField(
                    ctrl: _countryController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    hintText: 'Type your country name',
                    prefixIcon: Icon(
                      Icons.outlined_flag_outlined,
                      color: Colors.grey,
                      size: 15.r,
                    ),
                  ),
                  20.verticalSpace,
                  labelText('State'),
                  AppTextFormField(
                    ctrl: _stateController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    hintText: 'Type your state name',
                    prefixIcon: Icon(
                      Icons.house_outlined,
                      color: Colors.grey,
                      size: 15.r,
                    ),
                  ),
                  20.verticalSpace,
                  labelText('City'),
                  AppTextFormField(
                    ctrl: _cityController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    hintText: 'Type your city name',
                    prefixIcon: Icon(
                      Icons.location_city_outlined,
                      color: Colors.grey,
                      size: 15.r,
                    ),
                  ),
                  20.verticalSpace,
                  labelText('Password'),
                  AppTextFormField(
                    ctrl: _passController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    obscureText: true,
                    hintText: 'Type your password',
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Colors.grey,
                      size: 15.r,
                    ),
                  ),
                  20.verticalSpace,
                  labelText('Confirm Password'),
                  AppTextFormField(
                    ctrl: _confirmPassController,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    hintText: 'Type your confirm password',
                    prefixIcon: Icon(
                      Icons.lock_reset_outlined,
                      color: Colors.grey,
                      size: 15.r,
                    ),
                  ),
                  20.verticalSpace,
                  InkWell(
                    onTap: () {
                      BlocProvider.of<AuthBloc>(context).add(AuthLoginRequested(
                          name: _nameController.text,
                          email: _emailController.text,
                          phone: _phoneController.text,
                          country: _countryController.text,
                          state: _stateController.text,
                          city: _cityController.text,
                          password: _passController.text,
                          confirmPassword: _confirmPassController.text));
                    },
                    child: Container(
                      width: double.maxFinite,
                      height: 45.r,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50).r,
                          gradient: const LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Color(0xffbc37f6),
                                Color(0xff7472f2),
                                Color(0xff2bb5e6),
                              ])),
                      child: const Center(child: Text('Sign In')),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Text labelText(String text) => Text(
        text,
        style: const TextStyle(color: Colors.black87),
      );
}
