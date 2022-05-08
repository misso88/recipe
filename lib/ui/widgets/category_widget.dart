import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe/settings/server.dart';
import 'package:recipe/models/category.dart';
import 'package:recipe/controllers/category_controller.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key? key}) : super(key: key);
  final categoryController = Get.put(CategoryController());

  Widget _listView(List<Category> categorys) {
    return ListView.builder(
      shrinkWrap: true, // 내부 컨텐츠 높이 미리 설정, ListView 내에서만 스크롤 가능
      scrollDirection: Axis.horizontal, // 가로 스크롤
      itemCount: categorys.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                  onTap: () {},
                  child: Image.network(
                    "${Server.categoryImgUrl}/${categorys[index].ct_img}",
                    height: 50,
                    width: 50,
                  )),
              Text(
                categorys[index].ct_name,
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    categoryController.loadCategorys();
    return SizedBox(
      height: 100,
      child: GetBuilder<CategoryController>(
        builder: (categoryController) {
          if (categoryController.categorys != null &&
              categoryController.categorys.length > 0) {
            return _listView(categoryController.categorys);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
