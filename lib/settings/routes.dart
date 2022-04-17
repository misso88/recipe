import 'package:flutter/material.dart';

import 'package:recipe/ui/pages/intro.dart';
import 'package:recipe/ui/bottom_navigation.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        // (_) : 매개변수를 사용하고 싶지 않을 때 _ 사용
        return MaterialPageRoute(builder: (_) => Intro());
      case '/home':
        return MaterialPageRoute(builder: (_) => BottomNavigation());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("ERROR"),
        ),
        body: Center(
          child: Text("ERROR"),
        ),
      );
    });
  }
}
