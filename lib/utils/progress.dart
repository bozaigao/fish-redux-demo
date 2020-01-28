import 'package:flutter/material.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/utils/routes/fluro_navigator.dart';
import 'package:flutter_app/utils/screen_util.dart';
import 'package:flutter_app/widgets/load_image.dart';
import 'image_utils.dart';

/// *@filename qiandao_alert.dart
/// *@author 何晏波
/// *@QQ 1054539528
/// *@date 2020-01-15
/// *@Description: 自定义进度展示对话框
bool _isShowDialog = false;

void showProgress(BuildContext context) async {
  if (!_isShowDialog) {
    _isShowDialog = true;
    await showGeneralDialog<bool>(
      context: context,
      barrierColor: Color(0x11000000),
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: _buildMaterialDialogTransitions,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return SafeArea(
          child: Builder(builder: (BuildContext context) {
            return Center(
              child: Container(
                width: scaleSize(120),
                height: scaleSize(120),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ImageUtils.getAssetImage('ico_loading_bg'),
                      fit: BoxFit.fill),
                ),
                child: Container(
                  margin: EdgeInsets.only(top: scaleSize(25)),
                  child: Column(
                    children: <Widget>[
                      LoadImage(
                        'loading',
                        format: 'gif',
                        width: scaleSize(100),
                        height: scaleSize(40),
                      ),
                      Text(
                        '加载中...',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: setSp(14),
                          color: MyColors.textGrayColor,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
    _isShowDialog = false;
  }
}

void hideProgress(BuildContext context) {
  if (_isShowDialog) {
    _isShowDialog = false;
    NavigatorUtils.goBack(context);
  }
}

Widget _buildMaterialDialogTransitions(
    BuildContext context,
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
