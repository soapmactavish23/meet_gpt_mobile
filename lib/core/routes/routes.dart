import 'package:flutter/material.dart';
import 'package:meet_gpt_mobile/core/routes/router_name.dart';
import 'package:meet_gpt_mobile/views/home/home_view.dart';
import 'package:meet_gpt_mobile/views/splash/splash_view.dart';

class Routes {
  static Route<dynamic> onGenereteRoute(RouteSettings settings) {
    switch (settings.name) {
      //Client Views
      case RouterName.baseRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      default:
        return MaterialPageRoute(builder: (_) => const SplashView());
    }
  }
}
