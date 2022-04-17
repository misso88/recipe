import 'package:flutter/material.dart';
import 'package:recipe/settings/server.dart';
import 'package:recipe/models/category.dart' as ctg;

class CategoryWidget extends StatelessWidget {
  final ctg.Category category;
  const CategoryWidget({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(),
              child: Image.network(
                "${Server.categoryImgUrl}/${category.ct_img}",
                height: 40,
                width: 40,
              )),
          Text(
            category.ct_name,
          )
        ],
      ),
    );
  }
}
