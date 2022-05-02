import 'package:flutter/material.dart';
import 'package:recipe/settings/server.dart';
import 'package:recipe/models/recipe.dart';

class SharedRecipeWidget extends StatelessWidget {
  final Recipe recipe;
  const SharedRecipeWidget({Key? key, required this.recipe}) : super(key: key);

  Widget _sharedRecipe(Recipe recipe) {
    return Container(
        margin: EdgeInsets.all(10),
        // height: 350,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 0.5, color: Colors.grey)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                    margin: EdgeInsets.all(10),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                              "${Server.userImgUrl}/${recipe.us_img}",
                            ),
                            fit: BoxFit.cover))),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipe.us_nickname,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      recipe.rp_uddate,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
                Expanded(
                    child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_rounded),
                  ),
                ))
              ],
            ),
            recipe.rp_img1 == null
                ? Container()
                : InkWell(
                    onTap: () {},
                    child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  "${Server.recipeImgUrl}/${recipe.rp_img1}",
                                ),
                                fit: BoxFit.cover))),
                  ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.rp_title,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    recipe.rp_contents ?? "",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ],
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return _sharedRecipe(recipe);
  }
}
