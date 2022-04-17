import 'package:flutter/foundation.dart';
import 'package:recipe/models/category.dart'
    as ctg; // Category 클래스명이 중복돼서 접두사 사용
import 'package:recipe/repositories/category_repository.dart';

class CategoryProvider extends ChangeNotifier {
  CategoryRepository _categoryRepository = CategoryRepository();
  List<ctg.Category> _categorys = []; // 외부접근X
  List<ctg.Category> get categorys => _categorys; // 외부접근O

  loadCategorys() async {
    List<ctg.Category> listCategorys =
        await _categoryRepository.getCategoryList();
    // listMovies 예외처리
    // 추가적인 가공절차
    _categorys = listCategorys;
    notifyListeners(); // 상태 업데이트
  }
}
