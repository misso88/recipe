import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:recipe/settings/server.dart';
import 'package:recipe/controllers/banner_controller.dart';
import 'package:recipe/controllers/shared_recipe_controller.dart';
import 'package:recipe/ui/widgets/category_widget.dart';
import 'package:recipe/ui/widgets/search_widget.dart';
import 'package:recipe/ui/widgets/infinite_scroll_widget.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final bannerController = Get.put(BannerController());
  final sharedRecipeController = Get.put(SharedRecipeController());

  Widget _bannerSlide() {
    bannerController.loadBanners();
    return GetBuilder<BannerController>(builder: (bannerController) {
      if (bannerController.banners != null &&
          bannerController.banners.length > 0) {
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
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black.withOpacity(0.4),
                      backgroundBlendMode: BlendMode.colorBurn),
                  child: Text(
                    " ${config.activeIndex} / ${bannerController.banners.length} ",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            }),
            itemCount: bannerController.banners.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  onTap: () {},
                  child: Image.network(
                    "${Server.bannerImgUrl}/${bannerController.banners[index].bn_img}",
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
            controller: sharedRecipeController.scrollController.value,
            child: Column(
              children: [
                SizedBox(
                  height: 160,
                  child: _bannerSlide(),
                ),
                CategoryWidget(),
                InfiniteScrollWidget(mode: 1) // 공유레시피
              ],
            )));
  }
}
