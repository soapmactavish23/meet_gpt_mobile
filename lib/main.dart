import 'package:flutter/material.dart';
import 'package:meet_gpt_mobile/core/application_config.dart';
import 'package:meet_gpt_mobile/core/provider/application_provider.dart';
import 'package:meet_gpt_mobile/core/routes/router_name.dart';
import 'package:meet_gpt_mobile/core/routes/routes.dart';
import 'package:meet_gpt_mobile/core/ui/main_nav_global_key.dart';
import 'package:meet_gpt_mobile/core/ui/main_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ApplicationConfig().configureApp();
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
        initialRoute: RouterName.splashScreen,
        onGenerateRoute: Routes.onGenereteRoute,
      ),
    );
  }
}

