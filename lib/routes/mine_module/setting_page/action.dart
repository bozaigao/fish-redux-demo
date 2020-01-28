import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SettingAction { action }

class SettingActionCreator {
  static Action onAction() {
    return const Action(SettingAction.action);
  }
}
