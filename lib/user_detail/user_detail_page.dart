import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/model/user_response.dart';

import '../widgets/base_app_bar.dart';

class UserDetailPage extends StatelessWidget {
  final UserResponse userData;

  const UserDetailPage({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: BaseAppBar(
          title: Text(
            userData.title,
            style: TextStyle(fontSize: 20.sp, color: Colors.white),
          ),
          backgroundColor: const Color(0xFF59385d)),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFF59385d),
          Color(0xFF56365a),
          Color(0xFF6e425d),
          Color(0xFF984e5e),
          Color(0xFF904d61),
        ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(15).r,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20).r),
              child: Padding(
                padding: const EdgeInsets.all(15.0).r ,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40.r,
                      child: Text(
                        userData.id.toString(),
                        style: TextStyle(fontSize: 20.sp),
                      ),
                    ),
                    10.verticalSpace,
                    Text(
                      userData.title,
                      style: TextStyle(fontSize: 20.sp, color: Colors.black),
                    ),
                    10.verticalSpace,
                    Text(
                      userData.body,
                      style: TextStyle(fontSize: 15.sp, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
