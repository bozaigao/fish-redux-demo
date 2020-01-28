import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<LoginState> buildReducer() {
  return asReducer(
    <Object, Reducer<LoginState>>{
      LoginAction.changeClick: _changeClick,
      LoginAction.initWebView: _initWebView,
      LoginAction.updateMobile: _updateMobile,
      LoginAction.updatePwd: _updatePwd,
    },
  );
}

LoginState _changeClick(LoginState state, Action action) {
  return state.clone()..canClick = action.payload;
}

LoginState _initWebView(LoginState state, Action action) {
  return state.clone()..webViewController = action.payload;
}

LoginState _updateMobile(LoginState state, Action action) {
  return state.clone()
    ..mobile = action.payload
  ..canClick = action.payload.startsWith('1')&&
      action.payload.length == 11&&
      state.pwd.length > 5;
}

LoginState _updatePwd(LoginState state, Action action) {
  return state.clone()
    ..pwd = action.payload
    ..canClick = state.mobile.startsWith('1')&&
        state.mobile.length == 11&&
        action.payload.length > 5;
}
