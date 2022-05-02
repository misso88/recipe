import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/providers/bottom_navigation_provider.dart';
import 'package:recipe/ui/pages/home.dart';
import 'package:recipe/ui/pages/recipebook.dart';
import 'package:recipe/ui/widgets/search_widget.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({Key? key}) : super(key: key);
  late BottomNavigationProvider _bottomNavigationProvider;

  Widget _navigationBody() {
    switch (_bottomNavigationProvider.currentPage) {
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
  }

  Widget _bottomNavigationBarWidget() {
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
      currentIndex: _bottomNavigationProvider.currentPage,
      selectedItemColor: Colors.red,
      onTap: (index) {
        _bottomNavigationProvider.updateCurrentPage(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _bottomNavigationProvider = Provider.of<BottomNavigationProvider>(context);
    return Scaffold(
      body: _navigationBody(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}
