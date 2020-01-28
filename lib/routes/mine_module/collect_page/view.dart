import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/home/plate_entity.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/routes/home_module/home_page/widget/home_page_list_tile.dart';
import 'package:flutter_app/routes/mine_module/collect_page/action.dart';
import 'package:flutter_app/widgets/top_header.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'state.dart';

Widget buildView(
    CollectState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    color: Colors.white,
    child: Column(
      children: <Widget>[
        TopHeader(
          title: '我的收藏',
        ),
        Expanded(
          child: EasyRefresh.custom(
            enableControlFinishRefresh: true,
            enableControlFinishLoad: true,
            taskIndependence: false,
            controller: state.controller,
            scrollDirection: Axis.vertical,
            topBouncing: true,
            bottomBouncing: true,
            header: BezierCircleHeader(backgroundColor: MyColors.themeColor),
            footer: BezierBounceFooter(backgroundColor: MyColors.themeColor),
            onRefresh: () async {
              dispatch(CollectActionCreator.onRefresh());
            },
            onLoad: () async {
              dispatch(CollectActionCreator.onLoadMore());
            },
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    PlateItem resultEntity =
                        state.collectEntity.result[index];
                    return HomePageListTile(
                        item: resultEntity,);
                  },
                  childCount: state.collectEntity != null
                      ? state.collectEntity.result.length
                      : 0,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
