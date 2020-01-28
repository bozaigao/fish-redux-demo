import 'dart:convert';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/routes/home_module/news_detail/action.dart';
import 'package:flutter_app/utils/progress.dart';
import 'package:flutter_app/utils/screen_util.dart';
import 'package:flutter_app/widgets/top_header.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'state.dart';

Widget buildView(
    NewsDetailState state, Dispatch dispatch, ViewService viewService) {
  String webHtml = "<!DOCTYPE html>"
      "<html lang=\"en\">"
      "<head>"
      "<meta charset=\"UTF-8\">"
      "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, user-scalable=0\">"
      "<meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">"
      "<title></title>"
      "<style>"
      "video{"
      "height: 180px !important;"
      "width: 100%;"
      "margin: 0 auto !important;"
      "}"
      "img{"
      "display: block;"
      "margin: 0 auto !important;"
      "width: 100% !important;"
      "}"
      "p{"
      "font-size: 16px !important;"
      "color:'#4a4a4a';"
      "}"
      "div,p,a,span,image,video{"
      "-webkit-touch-callout: none; "
      "-webkit-user-select: none; "
      "-khtml-user-select: none;"
      "-moz-user-select: none; "
      "-ms-user-select: none; "
      "user-select: none;"
      "}"
      "body>p,body>div{"
      "width:100% !important;"
      "}"
      " body{"
      "box-sizing: border-box;"
      "padding: 0 !important;"
      "}"
      "</style>"
      "</head>"
      "<body>"
      "${state.materialEntity != null ? state.materialEntity.content : ''}"
      "<script>"
      "window.onload = function() {"
      "if (sendHeight) {"
      "sendHeight.postMessage(document.body.clientHeight);"
      "}"
      "};"
      " </script>"
      "</body>"
      "</html>";

  return Container(
    color: Colors.white,
    child: Stack(
      children: <Widget>[
        TopHeader(
          title: state.newsInfoModel.title,
        ),
        SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: scaleSize(44)),
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: scaleSize(20)),
                          width: ScreenUtil.screenWidthDp,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                state.materialEntity != null
                                    ? state.materialEntity.title
                                    : '',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none,
                                    color: Color(0xff575757),
                                    fontSize: setSp(scaleSize(22))),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: scaleSize(5)),
                                child: Text(
                                    state.materialEntity != null
                                        ? state.materialEntity.origin
                                        : '',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.none,
                                        color: MyColors.themeColor,
                                        fontSize: setSp(scaleSize(14)))),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: ScreenUtil.screenWidthDp,
                          height: state.webViewHeight,
                          child: state.materialEntity != null
                              ? WebView(
                                  initialUrl: new Uri.dataFromString(webHtml,
                                          mimeType: 'text/html',
                                          encoding: Encoding.getByName("utf-8"))
                                      .toString(),
                                  debuggingEnabled: true,
                                  javascriptMode: JavascriptMode.unrestricted,
                                  onPageStarted: (url) {
                                    showProgress(viewService.context);
                                  },
                                  onPageFinished: (url) {
                                    hideProgress(viewService.context);
                                  },
                                  javascriptChannels: <JavascriptChannel>[
                                    JavascriptChannel(
                                        name: "sendHeight",
                                        onMessageReceived:
                                            (JavascriptMessage message) {
                                          println('高度' + message.message);
                                          dispatch(NewsDetailActionCreator
                                              .updateWebViewHeight(double.parse(
                                                      message.message) +
                                                  scaleSize(50)));
                                        }),
                                  ].toSet(),
                                )
                              : SizedBox(),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
