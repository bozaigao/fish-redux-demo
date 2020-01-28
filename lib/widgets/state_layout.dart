
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/res/dimens.dart';
import 'package:flutter_app/res/gaps.dart';
import 'package:flutter_app/utils/image_utils.dart';
import 'package:flutter_app/utils/theme_utils.dart';

/// design/9暂无状态页面/index.html#artboard3
class StateLayout extends StatefulWidget {
  
  const StateLayout({
    Key key,
    @required this.type,
    this.hintText
  }):super(key: key);
  
  final StateType type;
  final String hintText;
  
  @override
  _StateLayoutState createState() => _StateLayoutState();
}

class _StateLayoutState extends State<StateLayout> {
  
  String _img;
  String _hintText;
  
  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case StateType.loading:
        _img = "";
        _hintText = "";
        break;
      case StateType.empty:
        _img = "";
        _hintText = "";
        break;
    }
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          widget.type == StateType.loading ? const CupertinoActivityIndicator(radius: 16.0) :
          (widget.type == StateType.empty ? Gaps.empty : 
          Opacity(
            opacity: ThemeUtils.isDark(context) ? 0.5 : 1,
            child: Container(
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ImageUtils.getAssetImage("state/$_img"),
                ),
              ),
            ))
          ),
          Gaps.vGap16,
          Text(
            widget.hintText ?? _hintText,
            style: Theme.of(context).textTheme.subtitle.copyWith(fontSize: Dimens.font_sp14),
          ),
          Gaps.vGap50,
        ],
      ),
    );
  }
}

enum StateType {
  /// 加载中
  loading,
  /// 空
  empty
}