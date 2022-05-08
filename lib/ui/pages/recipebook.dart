import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe/controllers/my_recipe_controller.dart';
import 'package:recipe/ui/widgets/Infinite_scroll_widget.dart';
import 'package:recipe/ui/widgets/category_widget.dart';
import 'package:recipe/ui/widgets/search_widget.dart';

class RecipeBook extends StatelessWidget {
  RecipeBook({Key? key}) : super(key: key);
  final myRecipeController = Get.find<MyRecipeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          title: Row(
            children: [
              Image.asset(
                "assets/logo/logo.png",
                width: 60,
                height: 40,
              ),
              Expanded(
                child: SearchWidget(hintText: "오늘의 레시피는?"),
              ),
              Icon(
                Icons.add_rounded,
                color: Theme.of(context).hintColor,
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
            controller: myRecipeController.scrollController.value,
            child: Column(
              children: [
                CategoryWidget(), InfiniteScrollWidget(mode: 0) // 나의레시피
              ],
            )));
  }
}
