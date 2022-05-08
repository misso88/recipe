import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe/controllers/my_recipe_controller.dart';
import 'package:recipe/controllers/bottom_navigation_controller.dart';
import 'package:recipe/ui/pages/home.dart';
import 'package:recipe/ui/pages/recipebook.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({Key? key}) : super(key: key);
  final bottomNavigationController = Get.put(BottomNavigationController());
  final myRecipeController = Get.put(MyRecipeController());

  Widget _navigationBody() {
    return GetBuilder<BottomNavigationController>(
        builder: (BottomNavigationController) {
      switch (bottomNavigationController.currentPage) {
        case 0:
          return Center(
            child: Text("계량"),
          );
        case 1:
          return RecipeBook();
        case 2:
          return Home();
        case 3:
          return Center(
            child: Text("찜"),
          );
        case 4:
          return Center(
            child: Text("마이페이지"),
          );
        default:
          return Container();
      }
    });
  }

  Widget _bottomNavigationBarWidget() {
    return GetBuilder<BottomNavigationController>(
      builder: (BottomNavigationController) {
        return BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.create_new_folder_rounded), label: "계량"),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_book_rounded), label: "레시피북"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "홈"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "찜"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded), label: "마이페이지")
          ],
          type: BottomNavigationBarType.fixed, // 아이템 개수를 4개 이상하기 위해 설정
          currentIndex: bottomNavigationController.currentPage,
          selectedItemColor: Colors.red,
          onTap: (index) {
            bottomNavigationController.updateCurrentPage(index);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _navigationBody(),
        bottomNavigationBar: _bottomNavigationBarWidget()
        // Obx(() => AnimatedContainer(
        //       duration: Duration(milliseconds: 200),
        //       curve: Curves.fastLinearToSlowEaseIn,
        //       child: sharedRecipeController.isShow.value
        //           ? _bottomNavigationBarWidget()
        //           : SizedBox(
        //               height: 0,
        //             ),
        //     ))
        );
  }
}
