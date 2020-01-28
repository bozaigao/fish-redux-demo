import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/models/user_info_entity.dart';

abstract class GlobalBaseState {
  UserInfoEntity get userInfo;
  set userInfo(UserInfoEntity userInfo);
}

class GlobalState implements GlobalBaseState, Cloneable<GlobalState> {
  @override
  UserInfoEntity userInfo;

  @override
  GlobalState clone() {
    return GlobalState();
  }
}
