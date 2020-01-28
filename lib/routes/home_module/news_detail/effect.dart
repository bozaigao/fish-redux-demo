import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/models/home/material_entity.dart';
import 'package:flutter_app/routes/home_module/news_detail/action.dart';
import 'package:flutter_app/utils/net/dio_utils.dart';
import 'package:flutter_app/utils/net/http_api.dart';
import 'package:flutter_app/utils/toast.dart';

import 'state.dart';

Effect<NewsDetailState> buildEffect() {
  return combineEffects(<Object, Effect<NewsDetailState>>{
    Lifecycle.initState: _initData,
  });
}

void _initData(Action action, Context<NewsDetailState> ctx) {
  Map<String, String> params = Map();
  params["id"] = ctx.state.newsInfoModel.id;
  DioUtils.instance.requestNetwork<MaterialEntity>(
      Method.get, HttpApi.getMaterialDetail,
      params: params, queryParameters: params, onSuccess: (data) async {
    ctx.dispatch(NewsDetailActionCreator.initData(data));
  }, onError: (code, msg) {
    Toast.show(msg);
  });
}
