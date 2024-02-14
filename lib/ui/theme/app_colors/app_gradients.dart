import 'package:flutter/material.dart';

abstract class AppGradients {
  static Gradient green = const LinearGradient(colors: [
    Color.fromRGBO(31, 219, 95, 1),
    Color.fromRGBO(49, 199, 100, 1),
  ]);
  static Gradient orange = const LinearGradient(colors: [
    Color.fromRGBO(246, 103, 0, 1),
    Color.fromRGBO(237, 57, 0, 1),
  ]);
  static Gradient blue = const LinearGradient(colors: [
    Color.fromRGBO(0, 172, 246, 1),
    Color.fromRGBO(0, 109, 237, 1),
  ]);

  static List<Gradient> allGradients = [
    green,
    orange,
    blue,
  ];
}
