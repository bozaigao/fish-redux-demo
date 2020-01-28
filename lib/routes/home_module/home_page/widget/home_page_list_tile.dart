import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/home/plate_entity.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/utils/routes/fluro_navigator.dart';
import 'package:flutter_app/utils/routes/routers.dart';
import 'package:flutter_app/utils/screen_util.dart';

import '../../../../widgets/load_image.dart';

class HomePageListTile extends StatelessWidget {
  const HomePageListTile({
    Key key,
    @required this.item,
  }) : super(key: key);

  final PlateItem item;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      width: ScreenUtil.screenWidthDp,
      height: scaleSize(90),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: MyColors.pageDefaultBackgroundColor,
                  width: 1,
                  style: BorderStyle.solid))),
      child: FlatButton(
        onPressed: (){
          if (item.goType == 4) {
            NavigatorUtils.push(context,
                '${Routes.newsDetailPage}?title=${Uri.encodeComponent(item.line1)}&id=${item.goId}');
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: scaleSize(100),
              height: scaleSize(65),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(scaleSize(4)),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(item.icon1),
                    fit: BoxFit.cover,
                  )),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(scaleSize(13)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: scaleSize(240),
                      height: scaleSize(45),
                      child: Text(
                        item.line1,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: setSp(16),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              LoadImage(
                                "ico_homepage_eye_gray",
                                width: scaleSize(10),
                                height: scaleSize(7),
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 2),
                                  child: Text(
                                    item.line2,
                                    style: TextStyle(
                                        color: MyColors.textGrayColorThree,
                                        fontSize: setSp(10)),
                                  ))
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            LoadImage(
                              "ico_homepage_comment_gray",
                              width: scaleSize(9),
                              height: scaleSize(9),
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 2),
                                child: Text(
                                  item.line3,
                                  style: TextStyle(
                                      color: MyColors.textGrayColorThree,
                                      fontSize: setSp(10)),
                                ))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
