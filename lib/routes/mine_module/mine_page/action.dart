import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MineAction { action }

class MineActionCreator {
  static Action onAction() {
    return const Action(MineAction.action);
  }
}
