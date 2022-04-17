import 'package:flutter/foundation.dart';
import 'package:recipe/models/banner.dart';
import 'package:recipe/repositories/banner_repository.dart';

class BannerProvider extends ChangeNotifier {
  BannerRepository _bannerRepository = BannerRepository();
  List<Banner> _banners = []; // 외부접근X
  List<Banner> get banners => _banners; // 외부접근O

  loadBanners() async {
    List<Banner> listBanners = await _bannerRepository.getBannerList();
    // listMovies 예외처리
    // 추가적인 가공절차
    _banners = listBanners;
    notifyListeners(); // 상태 업데이트
  }
}
