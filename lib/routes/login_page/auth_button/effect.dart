import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<AuthButtonState> buildEffect() {
  return combineEffects(<Object, Effect<AuthButtonState>>{
    AuthButtonAction.action: _onAction,
  });
}

void _onAction(Action action, Context<AuthButtonState> ctx) {
}
