import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SettingState> buildReducer() {
  return asReducer(
    <Object, Reducer<SettingState>>{
      SettingAction.action: _onAction,
    },
  );
}

SettingState _onAction(SettingState state, Action action) {
  final SettingState newState = state.clone();
  return newState;
}
