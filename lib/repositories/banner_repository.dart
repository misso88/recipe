import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe/settings/server.dart';
import 'package:recipe/models/banner.dart';

class BannerRepository {
  // API로 호출해서 값을 받아오는 부분
  // ui에서 접근X
  // provider에서 접근O
  final http.Client _client = http.Client();

  Future<List<Banner>> getBannerList() async {
    Uri url = Uri.parse(getUrl("list"));
    var response = await _client.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    print("getBannerList API Code " + response.statusCode.toString());

    if (response.statusCode == 200) {
      // 200 : 성공코드
      final responseBody = json.decode(response.body);
      List<Banner> list =
          responseBody.map<Banner>((item) => Banner.fromJson(item)).toList();
      return list;
    } else {
      return [];
    }
  }

  String getUrl(String control) {
    return "${Server.serverUrl}/banner/$control";
  }
}
