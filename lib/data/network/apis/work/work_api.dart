import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:work_app/data/network/constants/endpoints.dart';
import 'package:work_app/data/network/dio_client.dart';
import 'package:work_app/models/login/login_response.dart';
import 'package:work_app/models/mywork/list_my_work.dart';

@Singleton()
class WorkApi {
  // dio instance
  final DioClient _dioClient;

  // injecting dio instance
  WorkApi(this._dioClient);


  //TODO fix all try catch un necessary call

  Future<ListMyWork> getMyWork(int skip, {int limit = 15}) async {
    try {
      final response = await _dioClient.post(Endpoints.myWork,
          queryParameters: {"skip": skip, "take": limit});
      return ListMyWork.fromJson(response);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<LoginResponse> login(String username, String password) async {

      var formData =
          FormData.fromMap({'password': password, 'username': username});

      var response = await _dioClient.post(Endpoints.login, data: formData);

      return LoginResponse.fromJson(response);

  }
}
