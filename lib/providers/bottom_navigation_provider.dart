import 'package:flutter/cupertino.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int _index = 2;
  int get currentPage => _index;

  updateCurrentPage(int index) {
    _index = index;
    notifyListeners(); // 상태 업데이트
  }
}
