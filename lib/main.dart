import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/model/user_response.dart';
import 'package:flutter_task/music_player/music_player_page.dart';
import 'package:flutter_task/repository/post_repository.dart';
import 'package:flutter_task/ui/form_validation/bloc/auth_bloc.dart';
import 'package:flutter_task/ui/form_validation/form_validation_page.dart';
import 'package:flutter_task/ui/user_data/cubit/response_cubit.dart';
import 'package:flutter_task/ui/user_data/user_data_page.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (_ , child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AuthBloc(),),
            BlocProvider(create: (context) => ResponseCubit(),),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            home: child,
          ),
        );
      },
      child: const UserDataPage(),
      // child: const FormValidationPage(),
      // child: const HomeScreen(),
    );
  }
}
