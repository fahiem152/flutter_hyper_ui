import 'package:dio/dio.dart';
import 'package:hyper_ui/shared/util/url_api/url_api.dart';

class LoginService {
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await Dio().post(
        "${ApiUrl.baseUrl}/login",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "email": email,
          "password": password,
        },
      );
      Map obj = response.data;
      ApiUrl.token = obj["data"]["token"];
      return true;
    } catch (e) {
      return false;
    }
  }
}
