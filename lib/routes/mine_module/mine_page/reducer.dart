import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MineState> buildReducer() {
  return asReducer(
    <Object, Reducer<MineState>>{
      MineAction.action: _onAction,
    },
  );
}

MineState _onAction(MineState state, Action action) {
  final MineState newState = state.clone();
  return newState;
}
