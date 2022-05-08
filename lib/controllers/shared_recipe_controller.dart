import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:recipe/models/recipe.dart';
import 'package:recipe/repositories/recipe_repository.dart';

class SharedRecipeController extends GetxController {
  RecipeRepository _recipeRepository = RecipeRepository();
  var _recipes = <Recipe>[].obs; // 외부접근X
  List<Recipe> get recipes => _recipes; // 외부접근O

  var scrollController = ScrollController().obs;

  final _pageSize = 20;
  var loading = false.obs; // 로딩상태 관리
  var hasMore = false.obs; // 데이터가 더 있는지 확인
  var isShow = true.obs; // 스크롤 방향에 따라 BottomNavigationBar 노출 조절

  @override
  void onInit() {
    loadRecipes();
    scrollController.value.addListener(() {
      if (scrollController.value.position.pixels ==
              scrollController.value.position.maxScrollExtent &&
          hasMore.value) {
        // 맨 밑까지 스크롤 했을 때 불러올 데이터가 있으면
        loadRecipes();
      }

      // 스크롤이 아래방향이면 BottomNavigationBar 숨김
      final direction = scrollController.value.position.userScrollDirection;
      if (direction == ScrollDirection.forward)
        isShow.value = true;
      else
        isShow.value = false;
    });
    super.onInit();
  }

  loadRecipes() async {
    try {
      loading.value = true;

      await Future.delayed(Duration(seconds: 1)); // 1초 딜레이

      int offset = _recipes.length;
      var recipeList = await _recipeRepository.getRecipeList(_pageSize, offset);

      _recipes.addAll(recipeList);

      loading.value = false;
      hasMore.value = recipeList.length > 0;
    } catch (error) {
      print("error : $error");
    }
  }

  reload() async {
    loading.value = true;
    _recipes.clear(); // 리스트 초기화

    loadRecipes();
  }
}
