import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HomeAction { onRefresh }

class HomeActionCreator {
  static Action onRefresh() {
    return const Action(HomeAction.onRefresh);
  }
}
