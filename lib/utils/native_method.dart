import 'package:flutter/services.dart';

/// *@author 何晏波
/// *@QQ 1054539528
/// *@date 2020-01-15
/// *@Description: 原生端加密
const encodePlugin = const MethodChannel('www.guigug.com/rsa_and_base64');

Future<String> encode(String plaint) async {
  //获取到插件与原生的交互通道
  String result = await encodePlugin.invokeMethod('encode', {"plaint": plaint});
  print('加密结果:' + result);
  return result;
}

/// *@author 何晏波
/// *@QQ 1054539528
/// *@date 2020-01-15
/// *@Description: 加入随机因子
String wrapWithTimestamps(String text) {
  return '$text@${new DateTime.now().millisecondsSinceEpoch}';
}
