import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/providers/bottom_navigation_provider.dart';
import 'package:recipe/ui/widgets/searchWidget.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  late BottomNavigationProvider _bottomNavigationProvider;

  Widget _navigationBody() {
    switch (_bottomNavigationProvider.currentPage) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;
    }
    return Container();
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
      currentIndex: _bottomNavigationProvider.currentPage,
      selectedItemColor: Colors.red,
      type: BottomNavigationBarType.fixed, // 아이템 개수를 4개 이상하기 위해 설정
      onTap: (index) {
        _bottomNavigationProvider.updateCurrentPage(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _bottomNavigationProvider = Provider.of<BottomNavigationProvider>(context);
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
              Icons.notifications_none_rounded,
              color: Theme.of(context).hintColor,
            )
          ],
        ),
      ),
      body: _navigationBody(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}
