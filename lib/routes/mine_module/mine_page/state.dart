import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/global_store/state.dart';
import 'package:flutter_app/models/user_info_entity.dart';

class MineState implements GlobalBaseState, Cloneable<MineState> {

  @override
  MineState clone() {
    return MineState()
    ..userInfo = userInfo;
  }

  @override
  UserInfoEntity userInfo;
}

MineState initState(Map<String, dynamic> args) {
  return MineState();
}
