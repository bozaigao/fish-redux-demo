import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/models/home/plate_entity.dart';

class PrefectureState implements Cloneable<PrefectureState> {
  List<PlateEntity> plateList;
  @override
  PrefectureState clone() {
    return PrefectureState()
      ..plateList = plateList;
  }
}

PrefectureState initState(Map<String, dynamic> args) {
  return PrefectureState()
    ..plateList = [];
}
