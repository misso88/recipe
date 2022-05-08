import 'package:flutter/material.dart';
import 'package:recipe/styles/colors.dart' as style;
import 'package:get/get.dart';
import 'package:recipe/ui/bottom_navigation.dart';
import 'package:recipe/settings/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Recipe',
      initialRoute: '/',
      onGenerateRoute: Routes.generateRoute,
      // initialBinding: AppBinding(),
      home: BottomNavigation(),
      theme: ThemeData(
        fontFamily: 'LeeSeoyun',
        backgroundColor: style.Colors().backgroundColor(1),
        primaryColor: style.Colors().mainColor(1),
        focusColor: style.Colors().focusColor(1),
        hintColor: style.Colors().hintColor(1),
      ),
    );
  }
}

// class AppBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<BannerController>(() => BannerController());
//     Get.lazyPut<BottomNavigationController>(() => BottomNavigationController());
//     Get.lazyPut<CategoryController>(() => CategoryController());
//     Get.lazyPut<MyRecipeController>(() => MyRecipeController());
//     Get.lazyPut<SharedRecipeController>(() => SharedRecipeController());
//   }
// }
