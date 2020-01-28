import 'package:fish_redux/fish_redux.dart';
import 'package:webview_flutter/webview_flutter.dart';

//TODO replace with your own action
enum LoginAction {
  changeClick,
  initWebView,
  onPwdLogin,
  updateMobile,
  updatePwd,
  getUserInfo
}

class LoginActionCreator {
  static Action changeClick(bool clickState) {
    return Action(LoginAction.changeClick, payload: clickState);
  }

  static Action initWebView(WebViewController webViewController) {
    return Action(LoginAction.initWebView, payload: webViewController);
  }

  static Action onPwdLogin(String message) {
    return Action(LoginAction.onPwdLogin, payload: message);
  }

  static Action updateMobile(String mobile) {
    return Action(LoginAction.updateMobile, payload: mobile);
  }

  static Action updatePwd(String pwd) {
    return Action(LoginAction.updatePwd, payload: pwd);
  }

  static Action getUserInfo() {
    return const Action(LoginAction.getUserInfo);
  }
}
