import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/screen_util.dart';

import 'load_image.dart';

/// *@filename list_subtitle.dart
/// *@author 何晏波
/// *@QQ 1054539528
/// *@date 2020-01-17
/// *@Description: ListSubtitle
class ListSubtitle extends StatelessWidget {
  final String title;
  final String subTitle;

  const ListSubtitle({Key key, @required this.title, this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          color: Colors.white,
          width: ScreenUtil.screenWidthDp,
          height: scaleSize(50),
          child: FlatButton(
            padding: EdgeInsets.only(left: scaleSize(15), right: scaleSize(15)),
            onPressed: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: setSp(14),
                      color: Color(0xff182222),
                      decoration: TextDecoration.none),
                ),
                subTitle == null
                    ? LoadImage(
                        'ico_minepage_item_arrow',
                        width: scaleSize(6),
                        height: scaleSize(10),
                      )
                    : Text(
                        subTitle,
                        style: TextStyle(
                            fontSize: setSp(13), color: Color(0xff979aa0)),
                      )
              ],
            ),
          ),
        ),
        Container(
          width: ScreenUtil.screenWidthDp - scaleSize(30),
          height: 1,
          color: Color(0xffe9eff4),
        )
      ],
    );
  }
}
