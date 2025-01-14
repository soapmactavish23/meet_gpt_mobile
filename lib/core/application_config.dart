import 'package:flutter/material.dart';
import 'package:meet_gpt_mobile/core/constants/enviroments.dart';

class ApplicationConfig {
  Future<void> configureApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _loadEnvs();
  }

  Future<void> _loadEnvs() => Enviroments.loadEnvs();
}
