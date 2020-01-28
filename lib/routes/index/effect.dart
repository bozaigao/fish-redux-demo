import 'package:fish_redux/fish_redux.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter_app/global_store/action.dart';
import 'package:flutter_app/global_store/store.dart';
import 'package:flutter_app/models/home/plate_entity.dart';
import 'package:flutter_app/models/user_info_entity.dart';
import 'package:flutter_app/routes/index/action.dart';
import 'package:flutter_app/utils/common.dart';
import 'package:flutter_app/utils/data_tool.dart';
import 'package:flutter_app/utils/net/dio_utils.dart';
import 'package:flutter_app/utils/net/http_api.dart';
import 'package:flutter_app/utils/toast.dart';
import 'package:flutter_app/widgets/keep_alive_widget.dart';
import 'state.dart';

Effect<IndexState> buildEffect() {
  return combineEffects(<Object, Effect<IndexState>>{
    Lifecycle.initState: _init,
    IndexAction.getUserInfo: _getUserInfo
  });
}

void _init(Action action, Context<IndexState> ctx) async {
  dynamic pageList = [
    keepAliveWrapper(
      ctx.buildComponent('homePage'),
    ),
    keepAliveWrapper(
      ctx.buildComponent('classPage'),
    ),
    keepAliveWrapper(
      ctx.buildComponent('prefecturePage'),
    ),
    keepAliveWrapper(
      ctx.buildComponent('minePage'),
    ),
  ];
  ctx.dispatch(IndexActionCreator.initPageList(pageList));

  //读取首页缓存数据
  await SpUtil.getInstance();
  judgeLogin(successCallback: () {
    println('准备获取用户数据');
    ctx.dispatch(IndexActionCreator.getUserInfo());
  });
  List<dynamic> homeCacheData = SpUtil.getObjectList(Constant.homeData);

  List<PlateEntity> homeData = [];
  for (dynamic item in homeCacheData) {
    homeData.add(PlateEntity.fromJson(item));
  }
  ctx.dispatch(IndexActionCreator.initHomeData(homeData));

  //读取首页云学术缓存数据
  List<dynamic> classCacheData = SpUtil.getObjectList(Constant.classData);

  List<PlateEntity> classData = [];
  for (dynamic item in classCacheData) {
    classData.add(PlateEntity.fromJson(item));
  }
  ctx.dispatch(IndexActionCreator.initClassData(classData));

  //读取专区缓存数据
  List<dynamic> prefectureCacheData =
      SpUtil.getObjectList(Constant.prefectureData);

  List<PlateEntity> prefectureData = [];
  for (dynamic item in prefectureCacheData) {
    prefectureData.add(PlateEntity.fromJson(item));
  }
  ctx.dispatch(IndexActionCreator.initPrefectureData(prefectureData));
}

void _getUserInfo(Action action, Context<IndexState> ctx) async {
  DioUtils.instance.requestNetwork<UserInfoEntity>(
      Method.get, HttpApi.getUserInfo, params: null, queryParameters: null,
      onSuccess: (data) async {
    println('获取用户数据' + data.accountInfo.name);
    GlobalStore.store.dispatch(GlobalActionCreator.updateUserInfo(data));
  }, onError: (code, msg) {
    Toast.show(msg);
  });
}
