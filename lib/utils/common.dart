import 'package:flutter/material.dart';

class Constant {
  /// debug开关，上线需要关闭
  /// App运行在Release环境时，inProduction为true；当App运行在Debug和Profile环境时，inProduction为false
  static const bool inProduction  = const bool.fromEnvironment("dart.vm.product");

  static bool isTest  = false;

  static const String data = 'data';
  static const String message = 'message';
  static const String code = 'code';
  static const String loginToken = 'loginToken';
  static const String homeData = "homeData";
  static const String classData = "classData";
  static const String prefectureData = "prefectureData";

  static const String normal = "normal";
  static const String doctor = "doctor";
  static const String sales = "sales";
  static const String clerk = "clerk";
  static const String nurse = "nurse";
  static const String physician = "physician";

  static const List<Color> colorList = [
    Color(0xFFFFD147), Color(0xFFA9DAF2), Color(0xFFFAAF64),
    Color(0xFF7087FA), Color(0xFFA0E65C), Color(0xFF5CE6A1), Color(0xFFA364FA),
    Color(0xFFDA61F2), Color(0xFFFA64AE), Color(0xFFFA6464),
  ];
}
