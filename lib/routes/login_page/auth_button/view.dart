import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/routes/login_page/action.dart';
import 'package:flutter_app/utils/screen_util.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'state.dart';

Widget buildView(
    AuthButtonState state, Dispatch dispatch, ViewService viewService) {
  if (state.webViewController != null && state.canClick) {
    state.webViewController.evaluateJavascript(
        "window.document.getElementsByTagName('html')[0].style.background = '#34b0b0';"
        "window.document.getElementById('SM_BTN_WRAPPER_1').style.pointerEvents = 'auto';");
  } else if (state.webViewController != null) {
    state.webViewController.evaluateJavascript(
        "window.document.getElementsByTagName('html')[0].style.background = '#d9d9d9';"
        "window.document.getElementById('SM_BTN_WRAPPER_1').style.pointerEvents = 'none';");
  }
  return Container(
    width: ScreenUtil.screenWidthDp,
    margin: EdgeInsets.only(top: scaleSize(54)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: scaleSize(315),
          height: scaleSize(50),
          child: WebView(
            initialUrl: 'http://codepush.guigug.com/flutter.html',
            debuggingEnabled: true,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController controller) {
              dispatch(LoginActionCreator.initWebView(controller));
            },
            onPageFinished: (url) {},
            javascriptChannels: <JavascriptChannel>[
              JavascriptChannel(
                  name: "feedback",
                  onMessageReceived: (JavascriptMessage message) {
                    dispatch(
                        LoginActionCreator.onPwdLogin(message.message));
                    print("参数： ${message.message}");
                  }),
            ].toSet(),
          ),
        )
      ],
    ),
  );
}
