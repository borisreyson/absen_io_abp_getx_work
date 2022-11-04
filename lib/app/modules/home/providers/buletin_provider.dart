import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../buletin_model.dart';

class BuletinProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Buletin.fromJson(map);
      if (map is List) {
        return map.map((item) => Buletin.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = 'https://lp.abpjobsite.com/api/v1/message/info';
  }

  Future<Buletin?> getBuletin(int id) async {
    final response = await get('buletin/$id');
    return response.body;
  }

  Future<Buletin?> getBuletinPage(int page) async {
    var api = await http.get(
        Uri.parse("https://lp.abpjobsite.com/api/v1/message/info?page=$page"));
    var jsonObject = json.decode(api.body);
    return Buletin.fromJson((jsonObject));
  }

  Future<Response<Buletin>> postBuletin(Buletin buletin) async =>
      await post('buletin', buletin);
  Future<Response> deleteBuletin(int id) async => await delete('buletin/$id');
}
