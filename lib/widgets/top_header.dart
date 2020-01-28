import 'package:flutter/material.dart';
import 'package:flutter_app/utils/routes/fluro_navigator.dart';
import 'package:flutter_app/utils/screen_util.dart';
import 'load_image.dart';

/// *@filename top_header.dart
/// *@author 何晏波
/// *@QQ 1054539528
/// *@date 2020-01-17
/// *@Description: 导航栏顶部组件

class TopHeader extends StatelessWidget {
  final String title;

  const TopHeader({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Container(
        color: Colors.white,
        width: scaleSize(ScreenUtil.screenWidthDp),
        height: scaleSize(44),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                NavigatorUtils.goBack(context);
                ///以下是返回参数
//                NavigatorUtils.goBackWithParams(context, '参数');
              },
              child: Container(
                padding: EdgeInsets.all(scaleSize(10)),
                child: LoadImage(
                  'ico_back',
                  width: scaleSize(10),
                  height: scaleSize(20),
                ),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: scaleSize(220)),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: setSp(18),
                    color: Color(0xff182222),
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              width: scaleSize(30),
            )
          ],
        ),
      ),
    );
  }
}
