import 'package:fish_redux/fish_redux.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'auth_button/state.dart';

class LoginState implements Cloneable<LoginState> {
  bool canClick;
  WebViewController webViewController;
  String mobile;
  String pwd;

  @override
  LoginState clone() {
    return LoginState()
      ..canClick = canClick
      ..webViewController = webViewController
      ..mobile = mobile
      ..pwd = pwd;
  }
}

LoginState initState(Map<String, dynamic> args) {
  return LoginState()
    ..canClick = false
    ..mobile = ''
    ..pwd = '';
}

class AuthButtonConnector extends ConnOp<LoginState, AuthButtonState>
    with ReselectMixin<LoginState, AuthButtonState> {
  @override
  AuthButtonState computed(LoginState state) {
    return AuthButtonState().clone()
      ..canClick = state.canClick
      ..webViewController = state.webViewController;
  }

  @override
  List<dynamic> factors(LoginState state) {
    return <dynamic>[state.canClick, state.webViewController];
  }

  @override
  void set(LoginState state, AuthButtonState subState) {}
}
