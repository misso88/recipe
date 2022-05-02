import 'package:flutter/material.dart';
import 'package:recipe/settings/server.dart';
import 'package:recipe/models/recipe.dart';

class MyRecipeWidget extends StatelessWidget {
  final Recipe recipe;
  const MyRecipeWidget({Key? key, required this.recipe}) : super(key: key);

  Widget _myRecipe(Recipe recipe) {
    return Container(
      height: 80,
      child: Text(recipe.rp_title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _myRecipe(recipe);
  }
}
