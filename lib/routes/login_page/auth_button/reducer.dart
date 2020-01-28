import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AuthButtonState> buildReducer() {
  return asReducer(
    <Object, Reducer<AuthButtonState>>{
      AuthButtonAction.action: _onAction,
    },
  );
}

AuthButtonState _onAction(AuthButtonState state, Action action) {
  final AuthButtonState newState = state.clone();
  return newState;
}
