import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hyper_ui/shared/util/url_api/url_api.dart';

class RegisterService {
  Future<Map> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    final response = await Dio().post(
      "${ApiUrl.baseUrl}/register",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: {
        "name": fullName,
        "email": email,
        "password": password,
      },
    );

    if (response.data["status_code"] == 201) {
      Map obj = response.data;
      return obj;
    } else {
      return {};
    }
  }
}
