import 'package:flutter/material.dart';
import 'package:recipe/settings/server.dart';
import 'package:recipe/models/recipe.dart';

class RecipeWidget extends StatelessWidget {
  // mode : 0(내 레시피), 1(공유 레시피)
  final int mode;
  final Recipe recipe;
  const RecipeWidget({Key? key, required this.recipe, required this.mode})
      : super(key: key);

  Widget _myRecipe() {
    return Container(
        height: 100,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 0.5, color: Colors.grey)),
        child: Row(
          children: [
            Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: NetworkImage(
                          recipe.rp_img1 == null
                              ? "${Server.categoryImgUrl}/${recipe.ct_img}"
                              : "${Server.recipeImgUrl}/${recipe.rp_img1}",
                        ),
                        fit: BoxFit.cover))),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text(recipe.rp_title), Text(recipe.rp_uddate)],
                  ),
                  Text(
                    recipe.rp_contents ?? "",
                    overflow: TextOverflow.ellipsis,
                  ),
                ]))
          ],
        ));
  }

  Widget _sharedRecipe() {
    return Container(
        margin: EdgeInsets.all(10),
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
                  SizedBox(
                    height: 8,
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
    return mode == 1 ? _sharedRecipe() : _myRecipe();
  }
}
