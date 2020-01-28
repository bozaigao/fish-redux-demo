import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/res/gaps.dart';
import 'package:flutter_app/utils/screen_util.dart';
import 'package:flutter_app/widgets/list_subtitle.dart';
import 'package:flutter_app/widgets/top_header.dart';

import '../exit_dialog.dart';
import 'state.dart';

Widget buildView(
    SettingState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    color: Colors.white,
    child: Column(
      children: <Widget>[
        TopHeader(
          title: '更多设置',
        ),
        Expanded(
          child: Container(
            color: MyColors.pageDefaultBackgroundColor,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: scaleSize(5),
                ),
                ListSubtitle(
                  title: '关于医点数据',
                ),
                ListSubtitle(
                  title: '用户协议',
                ),
                ListSubtitle(
                  title: '隐私协议',
                ),
                state.userInfo != null
                    ? ListSubtitle(
                        title: '当前帐号',
                        subTitle: state.userInfo.accountInfo.mobile,
                      )
                    : Gaps.empty,
                Container(
                  margin: EdgeInsets.only(top: scaleSize(10)),
                  width: ScreenUtil.screenWidthDp,
                  height: scaleSize(58),
                  color: Colors.white,
                  child: FlatButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      showExitDialog(viewService.context);
                    },
                    child: Center(
                      child: Text(
                        '退出登录',
                        style: TextStyle(
                            color: Color(0xff182222),
                            fontSize: setSp(16),
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}
