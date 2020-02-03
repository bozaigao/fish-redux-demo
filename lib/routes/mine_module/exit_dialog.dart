import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/global_store/action.dart';
import 'package:flutter_app/global_store/store.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/utils/common.dart';
import 'package:flutter_app/utils/routes/fluro_navigator.dart';
import 'package:flutter_app/utils/screen_util.dart';

/// *@filename exit_dialog.dart
/// *@author 何晏波
/// *@QQ 1054539528
/// *@date 2020-01-17
/// *@Description: 显示退出登录对话框

void showExitDialog(BuildContext context) async {
  await showGeneralDialog<bool>(
    context: context,
    barrierColor: Color(0x66000000),
    barrierDismissible: false,
    barrierLabel: MaterialLocalizations
        .of(context)
        .modalBarrierDismissLabel,
    transitionDuration: const Duration(milliseconds: 150),
    transitionBuilder: _buildMaterialDialogTransitions,
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return Center(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(scaleSize(10))),
              color: Colors.white),
          width:scaleSize(260),
          height: scaleSize(180),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Text(
                    '确定要退出?',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                        fontSize: setSp(15),
                        color: Color(0xff182222)),
                  ),
                ),
              ),
              Container(
                width: scaleSize(260),
                height: scaleSize(44),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(scaleSize(10))),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          NavigatorUtils.goBack(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(scaleSize(10))),
                            color: Color(0xffecf0f9),
                          ),
                          child: Center(
                            child: Text(
                              '取消',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: setSp(15),
                                  color: MyColors.themeColor,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          SpUtil.remove(Constant.loginToken);
                          GlobalStore.store.dispatch(
                              GlobalActionCreator.updateUserInfo(null));
                          Navigator.popAndPushNamed(context, '/');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(scaleSize(10))),
                            color: MyColors.themeColor,
                          ),
                          child: Center(
                            child: Text('确定',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: setSp(15),
                                    color: Colors.white,
                                    decoration: TextDecoration.none)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildMaterialDialogTransitions(BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  return FadeTransition(
    opacity: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: child,
  );
}
