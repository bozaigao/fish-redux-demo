import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/res/gaps.dart';
import 'package:flutter_app/utils/common.dart';
import 'package:flutter_app/utils/data_tool.dart';
import 'package:flutter_app/utils/image_utils.dart';
import 'package:flutter_app/utils/screen_util.dart';
import 'package:flutter_app/utils/routes/fluro_navigator.dart';
import 'package:flutter_app/utils/routes/routers.dart';
import 'package:flutter_app/utils/toast.dart';
import 'package:flutter_app/widgets/load_image.dart';
import 'state.dart';

Widget buildView(MineState state, Dispatch dispatch, ViewService viewService) {
  if (state.userInfo != null) {
    println('刷新我的界面' + state.userInfo.accountInfo.name);
  }
  return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: MyColors.pageDefaultBackgroundColor,
          child: Column(
            children: <Widget>[
              _buildTop(state, viewService.context),
              Container(
                color: Colors.white,
                width: ScreenUtil.screenWidthDp,
                height: scaleSize(75),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _buildItem(viewService, '积分商城', 'ico_minepage_jifen'),
                        _buildItem(viewService, '听课记录', 'ico_minepage_class'),
                        _buildItem(
                            viewService, '我的收藏', 'ico_minepage_shouchang'),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: ScreenUtil.screenWidthDp,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: MyColors.pageDefaultBackgroundColor,
                            style: BorderStyle.solid,
                            width: scaleSize(10)))),
                child: Column(
                  children: <Widget>[
                    _buildListTile(viewService.context, '消息',
                        'ico_minepage_xiaoxi', 17, 17),
                    _buildListTile(viewService.context, '意见反馈',
                        'ico_minepage_yijian', 17, 17),
                    _buildListTile(
                        viewService.context, '联系方式', 'ico_kefu_btn', 18, 14.4),
                    _buildListTile(viewService.context, '设置',
                        'ico_minepage_shezhi', 18, 17),
                  ],
                ),
              )
            ],
          ),
        ),
      ));
}

_buildTop(MineState state, BuildContext context) {
  Map<String, String> roleMap = Map();
  roleMap[Constant.doctor] = '医生';
  roleMap[Constant.sales] = '学术代表';
  roleMap[Constant.clerk] = '学术专员';
  roleMap[Constant.nurse] = '护士';
  roleMap[Constant.physician] = '药师';
  roleMap[Constant.normal] = '普通用户';
  String roleName = '';

  if (state.userInfo != null) {
    roleName = roleMap[state.userInfo.accountInfo.role];
  }
  return Container(
    color: MyColors.statusBarColor,
    child: SafeArea(
      child: Container(
        width: ScreenUtil.screenWidthDp,
        height: scaleSize(105),
        color: MyColors.statusBarColor,
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      LoadImage(
                        _filterUserHeadImg(state),
                        width: scaleSize(70),
                        height: scaleSize(70),
                      ),
                      state.userInfo != null
                          ? Positioned(
                              bottom: 5,
                              right: 5,
                              child: LoadImage(
                                state.userInfo != null &&
                                        state.userInfo.accountInfo.gender == '男'
                                    ? 'ico_sex_nan'
                                    : 'ico_sex_nv',
                                width: scaleSize(18),
                                height: scaleSize(18),
                              ),
                            )
                          : Gaps.empty
                    ],
                  ),
                  state.userInfo == null
                      ? Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Color.fromARGB(127, 255, 255, 255)),
                          height: scaleSize(30),
                          margin: EdgeInsets.only(left: scaleSize(15)),
                          child: FlatButton(
                            onPressed: () {
                              NavigatorUtils.push(context, Routes.loginPage);
                            },
                            child: Text(
                              '登录/注册',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: setSp(18),
                                  fontWeight: FontWeight.bold),
                            ),
                            padding:
                                EdgeInsets.symmetric(horizontal: scaleSize(18)),
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.only(left: scaleSize(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  ConstrainedBox(
                                    child: Text(
                                      state.userInfo.accountInfo.name,
                                      style: TextStyle(
                                        fontSize: setSp(17),
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    constraints: BoxConstraints(
                                        maxWidth: scaleSize(140)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: scaleSize(7)),
                                    width: roleName.length == 2
                                        ? scaleSize(39)
                                        : scaleSize(66),
                                    height: scaleSize(22),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: roleName.length == 2
                                                ? ImageUtils.getAssetImage(
                                                    'ico_dengji_bg_short')
                                                : ImageUtils.getAssetImage(
                                                    'ico_dengji_bg'),
                                            fit: BoxFit.fill)),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        roleName,
                                        style: TextStyle(
                                            fontSize: setSp(11),
                                            color: Color(0xff825e27)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: scaleSize(8)),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(scaleSize(14)),
                                  color: Color(0x55ffffff),
                                ),
                                padding: EdgeInsets.only(
                                    top: scaleSize(4),
                                    right: scaleSize(12),
                                    bottom: scaleSize(4),
                                    left: scaleSize(12)),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      '我的积分',
                                      style: TextStyle(
                                          fontSize: setSp(13),
                                          color: Colors.white),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: scaleSize(2)),
                                      child: Text(
                                          '${state.userInfo.accountInfo.integral}',
                                          style: TextStyle(
                                              fontSize: setSp(16),
                                              color: Colors.white)),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                ],
              ),
              left: scaleSize(15),
              bottom: scaleSize(15),
            )
          ],
        ),
      ),
    ),
  );
}

/// *@author 何晏波
/// *@QQ 1054539528
/// *@date 2020-01-17
/// *@Description: 根据不同角色显示不同的头像
String _filterUserHeadImg(MineState state) {
  if (state.userInfo != null) {
    switch (state.userInfo.accountInfo.role) {
      case Constant.doctor:
        return 'ico_person_doctor';
      case Constant.sales:
        return 'ico_person_sales';
      case Constant.clerk:
        return 'ico_person_clerk';
      case Constant.physician:
        return 'ico_person_physician';
      case Constant.nurse:
        return 'ico_person_nurse';
      default:
        return 'ico_person_normal';
    }
  } else {
    return 'ico_person_normal';
  }
}

_buildItem(ViewService viewService, String title, String icoName) {
  return FlatButton(
    padding: EdgeInsets.only(top: scaleSize(10), bottom: scaleSize(10)),
    onPressed: () {
      if (title != '我的收藏') {
        Toast.show('请点击我的收藏');
      } else {
        judgeLogin(
            successCallback: () {
              NavigatorUtils.push(viewService.context, Routes.collectPage);
            },
            failCallback: () {
              NavigatorUtils.push(viewService.context, Routes.loginPage);
            });
      }
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        LoadImage(
          icoName,
          width: scaleSize(30),
          height: scaleSize(30),
        ),
        Container(
          margin: EdgeInsets.only(top: scaleSize(4)),
          child: Text(
            title,
            style:
                TextStyle(fontSize: setSp(12), color: MyColors.textBlackColor),
          ),
        )
      ],
    ),
  );
}

_buildListTile(
    BuildContext context, String title, String icon, num width, num height) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        width: ScreenUtil.screenWidthDp,
        color: Colors.white,
        height: scaleSize(50),
        child: FlatButton(
          onPressed: () {
            if (title != '设置') {
              Toast.show('请点击设置');
            } else {
              judgeLogin(successCallback: () {
                NavigatorUtils.push(context, Routes.settingPage);
              }, failCallback: () {
                NavigatorUtils.push(context, Routes.loginPage);
              });
            }
            println('点击了');
          },
          padding: EdgeInsets.all(0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: scaleSize(20)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    LoadImage(
                      icon,
                      width: scaleSize(width),
                      height: scaleSize(height),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: scaleSize(11)),
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: setSp(14),
                            color: MyColors.textBlackColor),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: scaleSize(20)),
                child: LoadImage(
                  'ico_minepage_item_arrow',
                  width: scaleSize(6),
                  height: scaleSize(10),
                ),
              ),
            ],
          ),
        ),
      ),
      Container(
        width: ScreenUtil.screenWidthDp - 30,
        height: 1,
        color: MyColors.pageDefaultBackgroundColor,
      )
    ],
  );
}
