import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/models/mine/collect_entity.dart';
import 'package:flutter_app/utils/net/dio_utils.dart';
import 'package:flutter_app/utils/net/http_api.dart';
import 'package:flutter_app/utils/progress.dart';
import 'package:flutter_app/utils/toast.dart';
import 'action.dart';
import 'state.dart';

Effect<CollectState> buildEffect() {
  return combineEffects(<Object, Effect<CollectState>>{
    Lifecycle.initState: _initData,
    CollectAction.onRefresh: _onRefresh,
    CollectAction.onLoadMore: _onLoadMore,
  });
}

void _initData(Action action, Context<CollectState> ctx) {
  Map<String, String> params = Map();
  params["pageNo"] = '1';
  params["pageSize"] = ctx.state.pageSize.toString();
  Future.delayed(Duration(microseconds: 500), () {
    showProgress(ctx.context);
    DioUtils.instance.requestNetwork<CollectEntity>(
        Method.get, HttpApi.getCollectRecord,
        params: params, queryParameters: params, onSuccess: (data) async {
      hideProgress(ctx.context);
      ctx.state.controller.resetLoadState();
      ctx.state.controller.finishRefresh();
      ctx.dispatch(CollectActionCreator.updatePageNo(1));
      ctx.dispatch(CollectActionCreator.refresh(data));
    }, onError: (code, msg) {
      hideProgress(ctx.context);
      Toast.show(msg);
    });
  });
}

void _onRefresh(Action action, Context<CollectState> ctx) {
  Map<String, String> params = Map();
  params["pageNo"] = '1';
  params["pageSize"] = ctx.state.pageSize.toString();
  Future.delayed(Duration(seconds: 1), () {
    DioUtils.instance.requestNetwork<CollectEntity>(
        Method.get, HttpApi.getCollectRecord,
        params: params, queryParameters: params, onSuccess: (data) async {
      ctx.state.controller.resetLoadState();
      ctx.state.controller.finishRefresh();
      ctx.dispatch(CollectActionCreator.updatePageNo(1));
      ctx.dispatch(CollectActionCreator.refresh(data));
    }, onError: (code, msg) {
      Toast.show(msg);
    });
  });
}

void _onLoadMore(Action action, Context<CollectState> ctx) {
  Map<String, String> params = Map();
  params["pageNo"] = ctx.state.pageNo.toString();
  params["pageSize"] = ctx.state.pageSize.toString();
  CollectEntity collectEntity = ctx.state.collectEntity;
  Future.delayed(Duration(seconds: 1), () {
    DioUtils.instance.requestNetwork<CollectEntity>(
        Method.get, HttpApi.getCollectRecord,
        params: params, queryParameters: params, onSuccess: (data) {
      ctx.state.controller.finishLoad();
      ctx.dispatch(CollectActionCreator.updatePageNo(ctx.state.pageNo + 1));
      if (data.result.length != 0) {
        collectEntity.result.addAll(data.result);
        ctx.dispatch(CollectActionCreator.loadMore(collectEntity));
      } else {
        Toast.show('没有更多数据了');
      }
    }, onError: (code, msg) {
      Toast.show(msg);
    });
  });
}
