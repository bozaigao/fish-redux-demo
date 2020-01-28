import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/models/home/plate_entity.dart';

class ClassState implements Cloneable<ClassState> {
  List<PlateEntity> plateList;
  @override
  ClassState clone() {
    return ClassState()
      ..plateList = plateList;
  }
}

ClassState initState(Map<String, dynamic> args) {
  return ClassState()
    ..plateList = [];
}
