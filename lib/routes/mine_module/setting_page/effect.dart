import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<SettingState> buildEffect() {
  return combineEffects(<Object, Effect<SettingState>>{
    SettingAction.action: _onAction,
  });
}

void _onAction(Action action, Context<SettingState> ctx) {
}
