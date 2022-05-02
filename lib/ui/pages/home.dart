import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

import 'package:recipe/settings/server.dart';
import 'package:recipe/ui/widgets/category_widget.dart';
import 'package:recipe/ui/widgets/search_widget.dart';
import 'package:recipe/ui/widgets/infinite_scroll_widget.dart';
import 'package:recipe/providers/banner_provider.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  late BannerProvider _bannerProvider;

  Widget _bannerSlide() {
    _bannerProvider.loadBanners();
    return Consumer<BannerProvider>(// 전체화면 업데이트가 아닌 일부분만 업데이트
        builder: (context, provider, widget) {
      if (provider.banners != null && provider.banners.length > 0) {
        return Swiper(
            autoplay: true,
            pagination: SwiperCustomPagination(
                builder: (BuildContext context, SwiperPluginConfig config) {
              return Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.black.withOpacity(0.4),
                      backgroundBlendMode: BlendMode.colorBurn),
                  child: Text(
                    " ${config.activeIndex} / ${provider.banners.length} ",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            }),
            itemCount: provider.banners.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  onTap: () {},
                  child: Image.network(
                    "${Server.bannerImgUrl}/${provider.banners[index].bn_img}",
                    fit: BoxFit.fill,
                  ));
            });
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // listen: false 수정될때마다 업데이트X -> Consumer로 일부분만 업데이트
    // listen: true 무한호출
    _bannerProvider = Provider.of<BannerProvider>(context, listen: false);
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
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 160,
              child: _bannerSlide(),
            ),
            CategoryWidget(),
            InfiniteScrollWidget(mode: 1)
            // SizedBox(
            //   height: 350,
            //   child: InfiniteScrollWidget(mode: 1),
            // ),
          ],
        )));
  }
}
