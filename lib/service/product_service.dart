import 'package:dio/dio.dart';
import 'package:hyper_ui/shared/util/url_api/url_api.dart';

class ProductService {
  get() async {
    var response = await Dio().get(
      "${ApiUrl.baseUrl}/products",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    print(obj["data"]);
    return obj["data"];
  }

  Future<Map> create({
    required String name,
    required String description,
    required int price,
    required String image_url,
    required int category_id,
  }) async {
    var response = await Dio().post(
      "${ApiUrl.baseUrl}/products",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${ApiUrl.token}"
        },
      ),
      data: {
        "name": name,
        "description": description,
        "price": price,
        "image_url": image_url,
        "category_id": category_id,
      },
    );
    Map obj = response.data;
    return obj;
  }

  update({
    required int id,
    required String name,
    required String description,
    required int price,
    required String image_url,
    required int category_id,
  }) async {
    var response = await Dio().put(
      "${ApiUrl.baseUrl}/products/$id",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${ApiUrl.token}"
        },
      ),
      data: {
        "name": name,
        "description": description,
        "price": price,
        "image_url": image_url,
        "category_id": category_id,
      },
    );
    Map obj = response.data;
  }

  delete({
    required int id,
  }) async {
    var response = await Dio().delete(
      "${ApiUrl.baseUrl}/products/$id",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${ApiUrl.token}"
        },
      ),
    );
    Map obj = response.data;
  }
}
