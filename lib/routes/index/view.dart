import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/res/dimens.dart';
import 'package:flutter_app/routes/index/action.dart';
import 'package:flutter_app/utils/double_tap_back_exit_app.dart';
import 'package:flutter_app/utils/screen_util.dart';
import 'package:flutter_app/utils/theme_utils.dart';
import 'package:flutter_app/widgets/load_image.dart';
import 'state.dart';

Widget buildView(IndexState state, Dispatch dispatch, ViewService viewService) {
  initScreenUtil(viewService.context);
  return DoubleTapBackExitApp(
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: ThemeUtils.getBackgroundColor(viewService.context),
            items: _buildBottomNavigationBarItem(),
            type: BottomNavigationBarType.fixed,
            currentIndex: state.currentIndex,
            elevation: 5.0,
            iconSize: 21.0,
            selectedFontSize: Dimens.font_sp10,
            unselectedFontSize: Dimens.font_sp10,
            selectedItemColor: MyColors.app_main,
            unselectedItemColor: MyColors.unselected_item_color,
            onTap: (index) {
              state.pageController.jumpToPage(index);
              dispatch(IndexActionCreator.jump(index));
            },
          ),
          // 使用PageView的原因参看 https://zhuanlan.zhihu.com/p/58582876
          body: PageView(
            controller: state.pageController,
            onPageChanged: (int index) {
              _onPageChanged(index);
            },
            children: state.pageList,
            physics: NeverScrollableScrollPhysics(),
          )));
}

void _onPageChanged(int index) {}

List<BottomNavigationBarItem> _buildBottomNavigationBarItem() {
  var _appBarTitles = ['首页', '云学术', '专区', '我的'];
  List<BottomNavigationBarItem> _list;
  if (_list == null) {
    var _tabImages = [
      [
        const LoadAssetImage("ico_tabar_home_normal", width: 25.0),
        const LoadAssetImage("ico_tabar_home_pressed", width: 25.0),
      ],
      [
        const LoadAssetImage("ico_tabar_class_normal", width: 25.0),
        const LoadAssetImage("ico_tabar_class_pressed", width: 25.0),
      ],
      [
        const LoadAssetImage("ico_tabar_prefecture_normal", width: 25.0),
        const LoadAssetImage("ico_tabar_prefecture_pressed", width: 25.0),
      ],
      [
        const LoadAssetImage("ico_tabar_mine_normal", width: 25.0),
        const LoadAssetImage("ico_tabar_mine_pressed", width: 25.0),
      ]
    ];
    _list = List.generate(4, (i) {
      return BottomNavigationBarItem(
          icon: _tabImages[i][0],
          activeIcon: _tabImages[i][1],
          title: Padding(
            padding: const EdgeInsets.only(top: 1.5),
            child: Text(
              _appBarTitles[i],
              key: Key(_appBarTitles[i]),
            ),
          ));
    });
  }
  return _list;
}
