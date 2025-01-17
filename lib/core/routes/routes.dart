import 'package:flutter/material.dart';
import 'package:meet_gpt_mobile/core/routes/router_name.dart';
import 'package:meet_gpt_mobile/domain/models/class/meet.dart';
import 'package:meet_gpt_mobile/views/home/home_view.dart';
import 'package:meet_gpt_mobile/views/meet/meet_detail_view.dart';
import 'package:meet_gpt_mobile/views/meet/meet_form_view.dart';
import 'package:meet_gpt_mobile/views/splash/splash_view.dart';

class Routes {
  static Route<dynamic> onGenereteRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterName.baseRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case RouterName.meetForm:
        return MaterialPageRoute(builder: (_) => const MeetFormView());
      case RouterName.meetDetail:
        return MaterialPageRoute(
            builder: (_) => MeetDetailView(
                  meet: settings.arguments as Meet,
                ));
      default:
        return MaterialPageRoute(builder: (_) => const SplashView());
    }
  }
}
