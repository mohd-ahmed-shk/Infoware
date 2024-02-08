import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/ui/user_data/cubit/response_cubit.dart';
import 'package:flutter_task/ui/user_data/cubit/response_state.dart';
import 'package:flutter_task/user_detail/user_detail_page.dart';
import 'package:flutter_task/widgets/base_app_bar.dart';

import '../../model/user_response.dart';

class UserDataPage extends StatelessWidget {
  const UserDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: BaseAppBar(
            title: Text(
              'API',
              style: TextStyle(fontSize: 20.sp, color: Colors.white),
            ),
            backgroundColor: const Color(0xFF59385d)),
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xFF59385d),
              Color(0xFF56365a),
              Color(0xFF6e425d),
              Color(0xFF984e5e),
              Color(0xFF904d61),
            ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
            child: BlocBuilder<ResponseCubit, ResponseState>(
              builder: (context, state) {
                if (state is ResponseLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(
                        backgroundColor: Colors.white),
                  );
                }
                if (state is ResponseLoadedState) {
                  return ListView.separated(
                    padding: const EdgeInsets.only(left: 10, right: 10).r,
                    itemCount: state.posts.length,
                    itemBuilder: (context, index) {
                      UserResponse userData = state.posts[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    UserDetailPage(userData: userData),
                              ));
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                              radius: 15.r,
                              child: Text(userData.id.toString())),
                          title: Text(userData.title,
                              style: TextStyle(
                                  fontSize: 20.sp, color: Colors.white),
                              maxLines: 1),
                          subtitle: Text(userData.body,
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: const Color(0xffe6d0dc),
                              ),
                              maxLines: 2),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: Colors.white54,
                      );
                    },
                  );
                }
                return Center(
                  child: Text(
                    'Error',
                    style: TextStyle(fontSize: 20.sp, color: Colors.white),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
