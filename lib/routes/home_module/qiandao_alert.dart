import 'package:flutter/material.dart';
import 'package:flutter_app/utils/image_utils.dart';
import 'package:flutter_app/utils/routes/fluro_navigator.dart';
import 'package:flutter_app/utils/screen_util.dart';
import 'package:flutter_app/widgets/load_image.dart';

/// *@filename qiandao_alert.dart
/// *@author 何晏波
/// *@QQ 1054539528
/// *@date 2020-01-17
/// *@Description:展示签到自定义对话框

void showQianDaoAlert(BuildContext context, int integral) async {
  await showGeneralDialog<bool>(
    context: context,
    barrierColor: Color(0x66000000),
    barrierDismissible: false,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    transitionDuration: const Duration(milliseconds: 150),
    transitionBuilder: _buildMaterialDialogTransitions,
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return SafeArea(
        child: Builder(builder: (BuildContext context) {
          return Center(
            child: Container(
              width: scaleSize(291),
              height: scaleSize(500),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: scaleSize(44)),
                    width: scaleSize(291),
                    height: scaleSize(150),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: ImageUtils.getAssetImage('ico_qiandao_bg'),
                          fit: BoxFit.fill),
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '+',
                                    style: TextStyle(
                                        fontSize: setSp(14),
                                        color: Color(0xffff8317),
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    '10',
                                    style: TextStyle(
                                        fontSize: setSp(22),
                                        color: Color(0xffff8317),
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: scaleSize(20)),
                            child: Text(' 签到成功',
                                style: TextStyle(
                                    fontSize: setSp(20),
                                    color: Colors.white,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: scaleSize(4)),
                            child: Text('我的积分: $integral',
                                style: TextStyle(
                                    fontSize: setSp(14),
                                    color: Colors.white,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.normal)),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(scaleSize(4)),
                          bottomRight: Radius.circular(scaleSize(4))),
                      color: Colors.white,
                    ),
                    width: scaleSize(291),
                    height: scaleSize(284),
                    padding: EdgeInsets.only(left: scaleSize(10)),
                    child: Column(
                      children: <Widget>[
                        Wrap(
                          direction: Axis.horizontal,
                          children: <Widget>[
                            _generateItem(10, 1),
                            _generateItem(10, 2),
                            _generateItem(20, 3),
                            _generateItem(10, 4),
                            _generateItem(10, 5),
                            _generateItem(10, 6),
                            _generateItem(30, 7),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: scaleSize(20)),
                          width: scaleSize(201),
                          height: scaleSize(45),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xffff9200), Color(0xffff5f00)]),
                            borderRadius:
                                BorderRadius.all(Radius.circular(scaleSize(4))),
                            color: Color(0xffff9200),
                          ),
                          child: Center(
                            child: Text(
                              '去积分商城看看',
                              style: TextStyle(
                                  fontSize: setSp(18),
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            child: LoadImage(
                              'ico_modal_close_btn',
                              width: scaleSize(38),
                              height: scaleSize(38),
                            ),
                            onTap: () {
                              NavigatorUtils.goBack(context);
                            },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      );
    },
  );
}

_generateItem(int integral, int day) {
  return Opacity(
    opacity: day == 1 ? 1 : 0.5,
    child: Container(
      margin: EdgeInsets.only(
          left: scaleSize(8),
          right: scaleSize(8),
          top: scaleSize(day < 5 ? 20 : 15)),
      child: Column(
        children: <Widget>[
          Container(
            width: scaleSize(50),
            child: Column(
              children: <Widget>[
                Text(
                  '+$integral',
                  style: TextStyle(
                      fontSize: setSp(14),
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal),
                ),
                Container(
                  margin: EdgeInsets.only(top: scaleSize(5)),
                  child: LoadImage(
                    'ico_qiandao_tag',
                    width: scaleSize(30),
                    height: scaleSize(26),
                  ),
                ),
              ],
            ),
            padding: EdgeInsets.only(
                left: scaleSize(10),
                right: scaleSize(10),
                top: scaleSize(5),
                bottom: scaleSize(5)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(scaleSize(4)),
              color: day == 1
                  ? Color(0xfff1f1f1)
                  : Color.fromRGBO(196, 194, 194, 0.5),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: scaleSize(4)),
            child: day == 1
                ? LoadImage(
                    'ico_qiandao_yiqian_gou',
                    width: scaleSize(20),
                    height: scaleSize(13),
                  )
                : Text(
                    '第$day天',
                    style: TextStyle(
                        fontSize: setSp(12),
                        color: Color(0xffa2a4a8),
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal),
                  ),
          )
        ],
      ),
    ),
  );
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
