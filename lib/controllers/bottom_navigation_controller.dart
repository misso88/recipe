import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  int _index = 2;
  int get currentPage => _index;

  updateCurrentPage(int index) {
    _index = index;
    update(); // 상태 업데이트
  }
}
