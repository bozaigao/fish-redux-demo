import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';

import 'common.dart';

void judgeLogin({@required Function successCallback, Function failCallback}) {
  String loginToken = SpUtil.getString(Constant.loginToken);

  if (loginToken != null && loginToken.length != 0) {
    if (successCallback != null) {
      successCallback();
    }
  } else if (failCallback != null) {
    failCallback();
  }
}
