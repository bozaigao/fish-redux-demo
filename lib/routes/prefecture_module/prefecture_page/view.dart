import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/home/plate_entity.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/routes/home_module/home_page/widget/home_page_item.dart';
import 'package:flutter_app/routes/home_module/home_page/widget/home_page_list_tile.dart';
import 'package:flutter_app/utils/routes/fluro_navigator.dart';
import 'package:flutter_app/utils/routes/routers.dart';
import 'package:flutter_app/utils/screen_util.dart';
import 'package:flutter_app/widgets/load_image.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(PrefectureState state, Dispatch dispatch,
    ViewService viewService) {
  return Scaffold(
      backgroundColor: Colors.white,
      body:
      Stack(children: <Widget>[
        _topHeader(),
        SafeArea(child: Container(
            margin: EdgeInsets.only(top: scaleSize(44)),
            child: RefreshIndicator(
              color: MyColors.themeColor,
              onRefresh: () async {
                return dispatch(PrefectureActionCreator.onRefresh());
              },
              child: SingleChildScrollView(child: Column(
                children: _generateChild(viewService.context, state.plateList),
              ),),)))
      ],)
  );
}


/// *@author 何晏波
/// *@QQ 1054539528
/// *@date 2020-01-16
/// *@Description: 生成子组件
_generateChild(BuildContext context, List<PlateEntity> plateList) {
  List<PlateEntity> uiType1 = [],
      uiType2 = [],
      uiType3 = [];

  for (PlateEntity item in plateList) {
    if (item.uiType == 1) {
      uiType1.add(item);
    }
    if (item.uiType == 2) {
      uiType3.add(item);
    }
    if (item.uiType == 3) {
      uiType2.add(item);
    }
  }

  List<Widget> childList = [];

  for (PlateEntity item in uiType1) {
    childList.add(_swiper(context, item));
  }

  for (PlateEntity item in uiType2) {
    childList.add(_uiTypeUI2(item));
  }

  for (PlateEntity item in uiType3) {
    childList.add(_uiTypeUI3(item));
  }

  return childList;
}


/// *@author 何晏波
/// *@QQ 1054539528
/// *@date 2020-01-06
/// *@Description: swiper
_swiper(BuildContext context, PlateEntity data) {
  if (data.items.length == 1) {
    return
      Column(children: <Widget>[
        GestureDetector(
          onTap: () {
            NavigatorUtils.push(context,
                '${Routes.newsDetailPage}?title=${Uri.encodeComponent(
                    data.items[0].line1)}&id=${data.items[0].goId}');
          },
          child: LoadImage(
              data.items[0].icon1,
              key: Key(data.items[0].icon1),
              fit: BoxFit.fill,
              width: ScreenUtil.screenWidthDp,
              height: scaleSize(150)
          ),),
        SizedBox(width: ScreenUtil.screenWidthDp,
          height: scaleSize(10),)
      ],);
  }

  return Container(color: MyColors.pageDefaultBackgroundColor,
      width: ScreenUtil.screenWidthDp,
      height: scaleSize(150),
      child: Container(
        width: ScreenUtil.screenWidthDp,
        height: scaleSize(150),
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return
              GestureDetector(
                onTap: () {
                  NavigatorUtils.push(context,
                      '${Routes.newsDetailPage}?title=${Uri.encodeComponent(
                          data.items[index].line1)}&id=${data.items[index]
                          .id}');
                },
                child: LoadImage(
                    data.items[index].icon1,
                    key: Key(data.items[index].icon1),
                    fit: BoxFit.fill,
                    width: ScreenUtil.screenWidthDp,
                    height: scaleSize(150)
                ),);
          },
          itemWidth: ScreenUtil.screenWidthDp,
          itemHeight: scaleSize(150),
          itemCount: data.items.length,
          loop: true,
          autoplay: true,
          pagination: SwiperPagination(),
          layout: SwiperLayout.DEFAULT,
        ),));
}

/// *@author 何晏波
/// *@QQ 1054539528
/// *@date 2020-01-06
/// *@Description: 返回顶部组件　
_topHeader() {
  return SafeArea(child: Container(
      color: Colors.white,
      height: scaleSize(44),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(
                  left: scaleSize(10)),
              child: SizedBox()),
          Text(
            '咨询专区',
            style: TextStyle(
                fontSize: setSp(18),
                color: Color.fromARGB(255, 24, 34, 34)),
          ),
          Container(
              margin: EdgeInsets.only(
                  right: scaleSize(10)),
              child: SizedBox()),
        ],
      )));
}


/// *@author 何晏波
/// *@QQ 1054539528
/// *@date 2020-01-06
/// *@Description: 返回视频专栏、健康生活
_uiTypeUI2(PlateEntity data) {
  return Container(color: MyColors.pageDefaultBackgroundColor,
    child: Container(color: Colors.white,
        margin: EdgeInsets.only(
            top: scaleSize(10)),
        child: Padding(
          padding: EdgeInsets.all(
              scaleSize(16)), child:
        Column(
          children: <Widget>[
            Row(crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(width: scaleSize(3),
                  height: scaleSize(16),
                  color: MyColors.themeColor,),
                Container(margin: EdgeInsets.only(
                    left: scaleSize(8)),
                    child: Text(data.header, style: TextStyle(
                        fontSize: setSp(16),
                        fontWeight: FontWeight.bold),))
              ],),
            Container(child:
            Wrap(direction: Axis.horizontal,
                children: _buildWidgetByList(data.header, data))
            )
          ],
        ),)),);
}

List<HomePageItem> _buildWidgetByList(String title,
    PlateEntity data) {
  List<HomePageItem> listWidget = [];

  for (PlateItem item in data.items) {
    listWidget.add(HomePageItem(
      key: Key('$title${item.line1}'),
      item: item,));
  }

  return listWidget;
}


/// *@author 何晏波
/// *@QQ 1054539528
/// *@date 2020-01-07
/// *@Description: 样式三
_uiTypeUI3(PlateEntity data) {
  if (data.header.isNotEmpty) {
    return Container(color: MyColors.pageDefaultBackgroundColor,
        child:
        Container(color: Colors.white,
          width: ScreenUtil.screenWidthDp,
          margin: EdgeInsets.only(
              top: scaleSize(10)),
          child: Padding(
            padding: EdgeInsets.all(
                scaleSize(16)), child:
          Column(
            children: <Widget>[
              Row(crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: scaleSize(3),
                    height: scaleSize(16),
                    color: MyColors.themeColor,),
                  Container(margin: EdgeInsets.only(
                      left: scaleSize(8)),
                      child: Text(data.header, style: TextStyle(
                          fontSize: setSp(16),
                          fontWeight: FontWeight.bold),))
                ],),
              Column(children: _buildWidgetByList2(data.header, data),)
            ],
          ),),)
    );
  }

  return Container(color: MyColors.pageDefaultBackgroundColor,
      child:
      Container(color: Colors.white,
        width: ScreenUtil.screenWidthDp,
        margin: EdgeInsets.only(
            top: scaleSize(10),
            left: 10),
        child: Padding(
          padding: EdgeInsets.all(
              scaleSize(6)), child:
        Column(children: _buildWidgetByList2(data.header, data),),),)
  );
}

List<HomePageListTile> _buildWidgetByList2(String title,
    PlateEntity data) {
  List<HomePageListTile> listWidget = [];

  for (PlateItem item in data.items) {
    listWidget.add(HomePageListTile(
      key: Key('$title${item.line1}'),
      item: item,));
  }

  return listWidget;
}
