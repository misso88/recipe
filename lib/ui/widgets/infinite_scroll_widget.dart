import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe/controllers/my_recipe_controller.dart';
import 'package:recipe/controllers/shared_recipe_controller.dart';
import 'package:recipe/ui/widgets/recipe_widget.dart';

class InfiniteScrollWidget extends StatelessWidget {
  // mode : 0(내 레시피), 1(공유 레시피)
  final int mode;
  InfiniteScrollWidget({Key? key, required this.mode}) : super(key: key);
  final sharedRecipeController = Get.find<SharedRecipeController>();
  final myRecipeController = Get.find<MyRecipeController>();

  Widget _renderListView(controller) {
    return Obx(() => ListView.builder(
        shrinkWrap: true, // 내부 컨텐츠 높이 미리 설정, ListView 내에서만 스크롤 가능
        physics: NeverScrollableScrollPhysics(), // 스크롤 비활성화, 새항목에서만 스크롤 가능
        itemCount: controller.recipes.length + 1,
        itemBuilder: (context, index) {
          if (index < controller.recipes.length) {
            return RecipeWidget(recipe: controller.recipes[index], mode: mode);
          }
          if (controller.loading.value || controller.hasMore.value) {
            return Center(
              child: RefreshProgressIndicator(),
            );
          }
          return Column(
            children: [
              Text("더 이상 불러올 레시피가 없습니다."),
              IconButton(
                  onPressed: () => controller.reload(),
                  icon: Icon(Icons.refresh_rounded))
            ],
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return _renderListView(
        mode == 1 ? sharedRecipeController : myRecipeController);
  }
}
