import 'package:flutter/foundation.dart';
import 'package:recipe/models/recipe.dart';
import 'package:recipe/repositories/recipe_repository.dart';

class RecipeProvider extends ChangeNotifier {
  RecipeRepository _recipeRepository = RecipeRepository();
  List<Recipe> _recipes = []; // 외부접근X
  List<Recipe> get recipes => _recipes; // 외부접근O

  final _pageSize = 20;
  bool loading = false; // 로딩상태 관리
  bool hasMore = true; // item이 더 있는지 확인

  loadRecipes({
    // 사용자가 증가하면 네트워크 트래픽을 생각해 마지막 서버요청시간 DateTime을 두고 5분 초과시 캐시 초기화
    bool? reload, // 리로드 확인
    int? nextId, // 처음 요청시 nextId를 넣지않기 때문에 @required 생략
  }) async {
    nextId ??= 0; // nextId를 안넣었을 경우 0으로 설정
    reload ??= false;

    if (reload) {
      hasMore = true;
      _recipes.clear();
    }

    // error가 안난다는 가정하게 try catch 사용X
    loading = true;
    notifyListeners();

    final recipeList = await _recipeRepository.getRecipeList(_pageSize, nextId);

    this._recipes = [
      ...this._recipes,
      ...recipeList,
    ];

    if (recipeList.length == 0) {
      hasMore = false;
    }

    loading = false;
    notifyListeners(); // chche가 업데이트될때마다 호출
  }
}
