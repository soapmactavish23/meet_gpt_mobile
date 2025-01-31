import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class Enviroments {
  Enviroments._();

  static String? param(String paramName) {
    return dotenv.env[paramName];
    // if (kReleaseMode) {
    //   return FirebaseRemoteConfig.instance.getString(paramName);
    // } else {}
  }

  static Future<void> loadEnvs() async {
    await dotenv.load(fileName: '.env');
    // if (kReleaseMode) {
    //   final remoteConfig = FirebaseRemoteConfig.instance;
    //   await remoteConfig.setConfigSettings(RemoteConfigSettings(
    //     fetchTimeout: const Duration(
    //       minutes: 1,
    //     ),
    //     minimumFetchInterval: const Duration(hours: 1),
    //   ));
    //   await remoteConfig.fetchAndActivate();
    // } else {
    //   await dotenv.load(fileName: '.env');
    // }
  }
}
