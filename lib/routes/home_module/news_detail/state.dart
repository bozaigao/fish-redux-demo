import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/models/home/material_entity.dart';
import 'package:flutter_app/utils/screen_util.dart';

class NewsDetailState implements Cloneable<NewsDetailState> {
  NewsInfoModel newsInfoModel;
  MaterialEntity materialEntity;
  double webViewHeight;

  @override
  NewsDetailState clone() {
    return NewsDetailState()
      ..newsInfoModel = newsInfoModel
      ..materialEntity = materialEntity
      ..webViewHeight = webViewHeight;
  }
}

NewsDetailState initState(NewsInfoModel newsInfoModel) {
  return NewsDetailState()
    ..newsInfoModel = newsInfoModel
    ..materialEntity = null
    ..webViewHeight = ScreenUtil.screenHeightDp;
}

class NewsInfoModel {
  final String id;
  final String title;

  const NewsInfoModel({this.id, this.title});
}
