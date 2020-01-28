import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/routes/login_page/action.dart';
import 'package:flutter_app/utils/image_utils.dart';
import 'package:flutter_app/utils/routes/fluro_navigator.dart';
import 'package:flutter_app/utils/screen_util.dart';
import 'package:flutter_app/widgets/load_image.dart';
import 'state.dart';

Widget buildView(LoginState state, Dispatch dispatch, ViewService viewService) {
  initScreenUtil(viewService.context);

  return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: ScreenUtil.screenWidthDp,
          height: ScreenUtil.screenHeightDp,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: ImageUtils.getAssetImage('ico_login_bg'),
                fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: FlatButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: () {
                FocusScope.of(viewService.context).requestFocus(FocusNode());
              },
              padding: EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        top: scaleSize(20), left: scaleSize(20)),
                    child: GestureDetector(
                      child: LoadImage(
                        'ico_login_close',
                        width: scaleSize(16),
                        height: scaleSize(16),
                      ),
                      onTap: () {
                        NavigatorUtils.goBack(viewService.context);
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: scaleSize(32), top: scaleSize(51)),
                    child: Text(
                      '欢迎登录医点数据',
                      style: TextStyle(
                          fontSize: setSp(24), color: Color(0xff333333)),
                    ),
                  ),
                  _buildTextField(state, dispatch, 'ico_account', '请输入你的手机号',
                      51, TextInputType.number, false, 11),
                  _buildTextField(state, dispatch, 'ico_pwd', '请输入6-16位密码', 30,
                      TextInputType.text, true, 16),
                  viewService.buildComponent('authButton'),
                  _buildBottom()
                ],
              ),
            ),
          ),
        ),
      ));
}

_buildTextField(
    LoginState state,
    Dispatch dispatch,
    String icon,
    String placeHolder,
    num marginTop,
    TextInputType textInputType,
    bool obscureText,
    num maxLength) {
  return Container(
    decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
      width: 1,
      color: Color(0xffd8d8d8),
    ))),
    width: ScreenUtil.screenWidthDp - scaleSize(60),
    margin: EdgeInsets.only(top: scaleSize(marginTop), left: scaleSize(30)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        LoadImage(
          icon,
          width: scaleSize(12),
          height: scaleSize(14),
        ),
        Container(
          width: scaleSize(180),
          margin: EdgeInsets.only(left: scaleSize(11)),
          child: TextField(
            obscureText: obscureText,
            maxLengthEnforced: true,
            maxLength: maxLength,
            keyboardAppearance: Brightness.light,
            minLines: 1,
            cursorColor: MyColors.themeColor,
            style: TextStyle(color: Color(0xff072b2b), fontSize: setSp(16)),
            keyboardType: textInputType,
            decoration: InputDecoration(
                hintText: placeHolder,
                hintStyle:
                    TextStyle(color: Color(0xff999999), fontSize: setSp(16)),
                border: InputBorder.none,
                counterText: ''),
            onChanged: (String value) {
              if (placeHolder.contains('手机号')) {
                dispatch(LoginActionCreator.updateMobile(value));
              } else {
                dispatch(LoginActionCreator.updatePwd(value));
              }
            },
          ),
        )
      ],
    ),
  );
}

_buildBottom() {
  return Column(
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(top: scaleSize(23)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(right: scaleSize(10)),
                width: scaleSize(120),
                height: 1,
                color: Color(0xfff0f0f0)),
            Text(
              '快捷登录',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: setSp(13),
                  color: Color(0xff999999)),
            ),
            Container(
                margin: EdgeInsets.only(left: scaleSize(10)),
                width: scaleSize(120),
                height: 1,
                color: Color(0xfff0f0f0))
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: scaleSize(35)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            LoadImage(
              'wechat_friends',
              width: scaleSize(44),
              height: scaleSize(44),
            )
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: scaleSize(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '未注册手机号验证后即完成注册',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: setSp(13),
                  color: Color(0xff8bacac)),
            )
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('注册即同意',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: setSp(13),
                    color: Color(0xff8bacac))),
            Text('用户协议',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.normal,
                    fontSize: setSp(13),
                    color: MyColors.themeColor)),
            Text('和',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: setSp(13),
                    color: Color(0xff8bacac))),
            Text('隐私政策',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.normal,
                    fontSize: setSp(13),
                    color: MyColors.themeColor))
          ],
        ),
      )
    ],
  );
}
