import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/global_store/state.dart';
import 'package:flutter_app/models/home/plate_entity.dart';
import 'package:flutter_app/models/user_info_entity.dart';

class HomeState implements GlobalBaseState,Cloneable<HomeState> {
  List<PlateEntity> plateList;
  @override
  HomeState clone() {
    return HomeState()
    ..plateList = plateList
      ..userInfo = userInfo;
  }

  @override
  UserInfoEntity userInfo;
}

HomeState initState(Map<String, dynamic> args) {
  return HomeState()
  ..plateList = [];
}
