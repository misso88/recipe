import 'package:flutter/material.dart';
import 'package:recipe/styles/colors.dart' as style;
import 'package:provider/provider.dart';
import 'package:recipe/providers/bottom_navigation_provider.dart';
import 'package:recipe/ui/pages/home.dart';
import 'package:recipe/ui/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe',
      initialRoute: '/',
      // onGenerateRoute : 이름이 부여된 라우트를 네이게이팅(Navigator.pushNamed())할 때 호출, RouteSettings 가 전달됨
      // onGenerateRoute를 사용하지 않고 initialRoute만 사용하면 에러
      // RouteSettings 구조
      //   const RouteSettings({
      //     String name,  // 라우터 이름
      //     bool isInitialRoute: false, // 초기 라우터인지 여부
      //     Object arguments  // 파라미터
      //   })
      onGenerateRoute: Routes.generateRoute,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) => BottomNavigationProvider(),
          ),
        ],
        child: Home(),
      ),
      theme: ThemeData(
        fontFamily: 'LeeSeoyun',
        // primarySwatch: Colors.white, // white 사용하면 오류
        backgroundColor: style.Colors().backgroundColor(1),
        primaryColor: style.Colors().mainColor(1),
        focusColor: style.Colors().focusColor(1),
        hintColor: style.Colors().hintColor(1),
      ),
    );
  }
}
