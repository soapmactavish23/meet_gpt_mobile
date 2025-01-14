import 'package:flutter/material.dart';
import 'package:meet_gpt_mobile/main_package/core/application_provider.dart';
import 'package:meet_gpt_mobile/main_package/routes/routes.dart';
import 'package:meet_gpt_mobile/main_package/routes/routes_name.dart';
import 'package:meet_gpt_mobile/main_package/services/config/env.dart';
import 'package:meet_gpt_mobile/main_package/theme/main_nav_global_key.dart';
import 'package:meet_gpt_mobile/main_package/theme/main_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Env.i.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ApplicationProvider(
      materialApp: MaterialApp(
        title: 'Meet GPT',
        debugShowCheckedModeBanner: false,
        navigatorKey: MainNavGlobalKey.instance.navKey,
        theme: MainTheme.themeData,
        initialRoute: RoutesName.splashScreen,
        onGenerateRoute: Routes.onGenereteRoute,
      ),
    );
  }
}
