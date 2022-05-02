import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/providers/recipe_provider.dart';
import 'package:recipe/models/recipe.dart';
import 'package:recipe/ui/widgets/my_recipe_widget.dart';
import 'package:recipe/ui/widgets/shared_recipe_widget.dart';

class InfiniteScrollWidget extends StatefulWidget {
  // mode : 0(내 레시피), 1(공유 레시피)
  final int mode;
  const InfiniteScrollWidget({Key? key, required this.mode}) : super(key: key);

  @override
  _InfiniteScrollWidgetState createState() => _InfiniteScrollWidgetState();
}

class _InfiniteScrollWidgetState extends State<InfiniteScrollWidget> {
  @override
  void initState() {
    super.initState();
    // initState 내부에 provider 사용시 listen:false로 설정
    // build함수가 실행되기전에 notifyListeners(setState)함수가 호출되면 error
    // -> 렌더링이 되지않았는데 또 렌더링하라고 해서
    Future.microtask(() {
      // 아주 잠깐 기다림 -> build함수가 먼저 실행될 수 있게 기다림
      Provider.of<RecipeProvider>(context, listen: false)
          .loadRecipes(reload: true);
    });
  }

  _renderListView() {
    final _recipeProvider = Provider.of<RecipeProvider>(context);
    final recipes = _recipeProvider.recipes;
    final loading = _recipeProvider.loading;

    // 업데이트되지 않았을 때(딱 한번 실행)
    if (loading && recipes.length == 0) {
      return Center(child: CircularProgressIndicator());
    }

    // 가져올 아이템이 아무것도 없을 때
    if (!loading && recipes.length == 0) {
      return const Center(child: Text("아이템이 없습니다."));
    }

    return ListView.builder(
        shrinkWrap: true, // 내부 컨텐츠 높이 미리 설정, ListView 내에서만 스크롤 가능
        physics: NeverScrollableScrollPhysics(), // 스크롤 비활성화, 새항목에서만 스크롤 가능
        itemCount: recipes.length + 1,
        itemBuilder: (context, index) {
          //future builder로 infinite scroll을 할 수도 있음
          if (index < recipes.length) {
            return widget.mode == 1
                ? SharedRecipeWidget(recipe: recipes[index])
                : MyRecipeWidget(recipe: recipes[index]);
          }
          if (!_recipeProvider.loading && _recipeProvider.hasMore) {
            //렌더링 오류가 안나게 Future.microtask()사용
            Future.microtask(() => _recipeProvider.loadRecipes(nextId: index));
          }

          if (_recipeProvider.hasMore) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Text("더이상 아이템이 없습니다."),
            );
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return _renderListView();
  }
}
