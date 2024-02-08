import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_task/repository/api/api_dart.dart';

import '../model/user_response.dart';

class PostRepository {
  API api = API();
  Future<List<UserResponse>> fetchPosts() async {
    try {
      Response response =  await api.sendRequest.get("/posts");
      List<dynamic> data = response.data;
      return data.map((e) => UserResponse.fromJson(e)).toList();
    } catch(e) {
      throw e;
    }
  }
}