import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum PrefectureAction { onRefresh }

class PrefectureActionCreator {
  static Action onRefresh() {
    return const Action(PrefectureAction.onRefresh);
  }
}
