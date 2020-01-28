import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum AuthButtonAction { action }

class AuthButtonActionCreator {
  static Action onAction() {
    return const Action(AuthButtonAction.action);
  }
}
