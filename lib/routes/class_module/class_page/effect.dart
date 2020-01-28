import 'package:fish_redux/fish_redux.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter_app/models/home/plate_entity.dart';
import 'package:flutter_app/routes/index/action.dart';
import 'package:flutter_app/utils/common.dart';
import 'package:flutter_app/utils/net/dio_utils.dart';
import 'package:flutter_app/utils/net/http_api.dart';
import 'package:flutter_app/utils/toast.dart';
import 'action.dart';
import 'state.dart';

Effect<ClassState> buildEffect() {
  return combineEffects(<Object, Effect<ClassState>>{
    Lifecycle.initState: _init,
    ClassAction.onRefresh: _init
  });
}

Future _init(Action action, Context<ClassState> ctx) async {
  await DioUtils.instance.requestNetwork<PlateEntity>(
      Method.get, HttpApi.cloudAcademy,
      params: null,
      queryParameters: null,
      isList: true, onSuccessList: (list) async {
    await SpUtil.putObjectList(Constant.classData, list);
    ctx.dispatch(IndexActionCreator.initClassData(list));
  }, onError: (code, msg) {
    Toast.show(msg);
  });
}
