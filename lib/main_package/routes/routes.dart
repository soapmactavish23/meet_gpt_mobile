import 'package:flutter/material.dart';
import 'package:meet_gpt_mobile/main_package/routes/routes_name.dart';
import 'package:meet_gpt_mobile/views/home/home_view.dart';
import 'package:meet_gpt_mobile/views/meet/meet_detail_form.dart';
import 'package:meet_gpt_mobile/views/meet/meet_detail_view.dart';
import 'package:meet_gpt_mobile/views/splash/splash_view.dart';

class Routes {
  static Route<dynamic> onGenereteRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case RoutesName.meetDetail:
        return MaterialPageRoute(builder: (_) => const MeetDetailForm());
      case RoutesName.meetForm:
        return MaterialPageRoute(builder: (_) => const MeetDetailView());
      default:
        return MaterialPageRoute(builder: (_) => const SplashView());
    }
  }
}
