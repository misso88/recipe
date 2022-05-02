import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/models/category.dart';
import 'package:recipe/providers/category_provider.dart';
import 'package:recipe/settings/server.dart';
import 'package:recipe/models/category.dart' as ctg;

class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key? key}) : super(key: key);
  late CategoryProvider _categoryProvider;

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
    // listen: false 수정될때마다 업데이트X -> Consumer로 일부분만 업데이트
    // listen: true 무한호출
    _categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
    _categoryProvider.loadCategorys();
    return SizedBox(
      height: 100,
      child: Consumer<CategoryProvider>(// 전체화면 업데이트가 아닌 일부분만 업데이트
          builder: (context, provider, widget) {
        if (provider.categorys != null && provider.categorys.length > 0) {
          return _listView(provider.categorys);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
