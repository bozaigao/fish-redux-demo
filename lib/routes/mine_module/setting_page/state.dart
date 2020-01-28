import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/global_store/state.dart';
import 'package:flutter_app/models/user_info_entity.dart';

class SettingState implements GlobalBaseState,Cloneable<SettingState> {

  @override
  SettingState clone() {
    return SettingState()
    ..userInfo = userInfo;
  }

  @override
  UserInfoEntity userInfo;
}

SettingState initState(Map<String, dynamic> args) {
  return SettingState();
}
