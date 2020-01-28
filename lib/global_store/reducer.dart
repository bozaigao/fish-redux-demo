import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Reducer<GlobalState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalState>>{
      GlobalAction.updateUserInfo: updateUserInfo,
    },
  );
}

GlobalState updateUserInfo(GlobalState state, Action action) {
  return state.clone()..userInfo = action.payload;
}
