import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe/settings/server.dart';
import 'package:recipe/models/recipe.dart';
import 'package:recipe/models/recipe_ingredient.dart';
import 'package:recipe/models/recipe_order.dart';

class RecipeRepository {
  // API로 호출해서 값을 받아오는 부분
  // ui에서 접근X
  // provider에서 접근O
  final http.Client _client = http.Client();

  Future<List<Recipe>> getRecipeList(limit, offset) async {
    Uri url = Uri.parse(getUrl("list"));
    var response = await _client.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: json.encode(<Object, Object>{
        'limit': limit,
        'offset': offset,
      }),
    );

    print("getRecipeList API Code " + response.statusCode.toString());

    if (response.statusCode == 200) {
      // 200 : 성공코드
      final responseBody = json.decode(response.body);
      List<Recipe> list =
          responseBody.map<Recipe>((item) => Recipe.fromJson(item)).toList();
      return list;
    } else {
      return [];
    }
  }

  String getUrl(String control) {
    return "${Server.serverUrl}/recipe/$control";
  }
}
