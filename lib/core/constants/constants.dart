// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

abstract class ImageConstants {
  static const logo = "images/logo.png";
  static const imageUser = "images/user.png";
  static const loading = "images/loading.gif";
  static const not_found = "images/not_found.png";

}

abstract class ColorsConstants {
  static const defaultColor = Color(0xff218838 );
  static const secondaryColor = Color(0xff007BFF);
  static const primary = Color(0xff007BFF);
  static const secondary = Color(0xff6C757D);
  static const success = Color(0xff28A745);
  static const danger = Color(0xffDC3545);
  static const warning = Color(0xffFFC107);
  static const info = Color(0xff17A2B8);
  static const bgColor = Color(0xFFE1DFDC);
}

abstract class Constants {
  static const ENV_BASE_URL_KEY = "base_url";
  static const ENV_AUTH_REQUIRED = "DIO_AUTH_KEY";
}

abstract class Messages {
  static const requiredField = 'Campo obrigatório';
  static const invalidEmail = 'Email inválido';
}