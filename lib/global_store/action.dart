import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/models/user_info_entity.dart';

enum GlobalAction { updateUserInfo }

class GlobalActionCreator {
  static Action updateUserInfo(UserInfoEntity userInfo) {
    return Action(GlobalAction.updateUserInfo, payload: userInfo);
  }
}
