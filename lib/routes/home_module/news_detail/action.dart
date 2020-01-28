import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/models/home/material_entity.dart';

//TODO replace with your own action
enum NewsDetailAction { initData, updateWebViewHeight }

class NewsDetailActionCreator {
  static Action initData(MaterialEntity materialEntity) {
    return Action(NewsDetailAction.initData, payload: materialEntity);
  }

  static Action updateWebViewHeight(double webViewHeight) {
    return Action(NewsDetailAction.updateWebViewHeight, payload: webViewHeight);
  }
}
