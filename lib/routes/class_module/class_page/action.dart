import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ClassAction { onRefresh }

class ClassActionCreator {
  static Action onRefresh() {
    return const Action(ClassAction.onRefresh);
  }

}
