import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

/// Toast工具类
class Toast {
  static show(String msg, {duration = 2000}) {
    if (msg == null) {
      return;
    }
    showToast(
      msg,
      duration: Duration(milliseconds: duration),
      dismissOtherToast: true,
      position: ToastPosition.bottom,
      backgroundColor: Color.fromARGB(140, 0, 0, 0),
      radius: 20
    );
  }

  static cancelToast() {
    dismissAllToast();
  }
}
