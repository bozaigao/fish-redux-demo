import 'dart:convert';

import 'package:fish_redux/fish_redux.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter_app/global_store/action.dart';
import 'package:flutter_app/global_store/store.dart';
import 'package:flutter_app/models/user_info_entity.dart';
import 'package:flutter_app/routes/login_page/action.dart';
import 'package:flutter_app/utils/common.dart';
import 'package:flutter_app/utils/native_method.dart';
import 'package:flutter_app/utils/net/dio_utils.dart';
import 'package:flutter_app/utils/net/http_api.dart';
import 'package:flutter_app/utils/progress.dart';
import 'package:flutter_app/utils/routes/fluro_navigator.dart';
import 'package:flutter_app/utils/toast.dart';
import 'state.dart';

Effect<LoginState> buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    LoginAction.onPwdLogin: _onPwdLogin,
    LoginAction.getUserInfo: _getUserInfo,
  });
}

/// *@author 何晏波
/// *@QQ 1054539528
/// *@date 2020-01-15
/// *@Description: 获取到智能按钮数据后调用登录接口
void _onPwdLogin(Action action, Context<LoginState> ctx) async {
  String cipherPhone = await encode(wrapWithTimestamps(ctx.state.mobile));
  String cipherPwd = await encode(wrapWithTimestamps(ctx.state.pwd));
  Map<String, dynamic> message = json.decode(action.payload);
  showProgress(ctx.context);
  Map<String, String> params = Map();
  params["mobile"] = cipherPhone;
  params["password"] = cipherPwd;
  params["vscene"] = message['vscene'];
  params["vtoken"] = message['vtoken'];
  params["vsessionId"] = message['vsessionId'];
  params["vsig"] = message['vsig'];
  DioUtils.instance.requestNetwork<String>(Method.post, HttpApi.password,
      params: params, queryParameters: params, onSuccess: (data) async {
    hideProgress(ctx.context);
    await SpUtil.putString(Constant.loginToken, data);
    println('执行到这里啦');
    ctx.dispatch(LoginActionCreator.getUserInfo());
  }, onError: (code, msg) {
    hideProgress(ctx.context);
    Toast.show(msg);
  });
}

/// *@author 何晏波
/// *@QQ 1054539528
/// *@date 2020-01-17
/// *@Description: 获取用户信息
void _getUserInfo(Action action, Context<LoginState> ctx) async {
  DioUtils.instance.requestNetwork<UserInfoEntity>(Method.get, HttpApi.getUserInfo,
      params: null, queryParameters: null, onSuccess: (data) async {
    GlobalStore.store.dispatch(GlobalActionCreator.updateUserInfo(data));
    NavigatorUtils.goBack(ctx.context);
  }, onError: (code, msg) {
    Toast.show(msg);
  });
}
