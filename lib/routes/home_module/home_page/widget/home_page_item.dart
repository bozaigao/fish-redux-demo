import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/home/plate_entity.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/utils/routes/fluro_navigator.dart';
import 'package:flutter_app/utils/routes/routers.dart';
import 'package:flutter_app/utils/screen_util.dart';
import 'package:flutter_app/utils/toast.dart';

import '../../../../widgets/load_image.dart';

class HomePageItem extends StatelessWidget {
  const HomePageItem({
    Key key,
    @required this.item,
  }) : super(key: key);

  final PlateItem item;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    num width = ScreenUtil.screenWidthDp / 2;

    return Container(
      width: ScreenUtil.screenWidthDp / 2 - 28,
      margin: EdgeInsets.only(top: 15, left: 10),
      child: FlatButton(
        onPressed: () {
          if (item.goType == 4) {
            NavigatorUtils.push(context,
                '${Routes.newsDetailPage}?title=${Uri.encodeComponent(item.line1)}&id=${item.goId}');
            //以下是包含参数回调
//            NavigatorUtils.pushResult(context,
//                '${Routes.newsDetailPage}?title=${Uri.encodeComponent(item.line1)}&id=${item.id}',
//                (result) {
//              print(result);
//            });
          } else {
            Toast.show('学习视频还未开发');
          }
        },
        padding: EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: width,
              height: scaleSize(90),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(scaleSize(4)),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(item.icon1),
                    fit: BoxFit.cover,
                  )),
            ),
            Container(
                width: width,
                margin: EdgeInsets.only(
                  top: scaleSize(5),
                ),
                child: Text(
                  item.line1,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: setSp(15),
                      color: MyColors.lightBlackColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
            Padding(
                padding:
                    EdgeInsets.only(left: scaleSize(8), right: scaleSize(8)),
                child: Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
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
                    )))
          ],
        ),
      ),
    );
  }
}
