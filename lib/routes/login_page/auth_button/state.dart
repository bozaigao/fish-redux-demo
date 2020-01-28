import 'package:fish_redux/fish_redux.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AuthButtonState implements Cloneable<AuthButtonState> {
  WebViewController webViewController;
  bool canClick;

  AuthButtonState({this.canClick, this.webViewController});

  @override
  AuthButtonState clone() {
    return AuthButtonState()
      ..canClick = canClick
      ..webViewController = webViewController;
  }
}
