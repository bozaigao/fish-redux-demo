import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/models/mine/collect_entity.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class CollectState implements Cloneable<CollectState> {
  CollectEntity collectEntity;
  EasyRefreshController controller;
  int pageNo;
  int pageSize;

  @override
  CollectState clone() {
    return CollectState()
      ..collectEntity = collectEntity
      ..controller = controller
      ..pageNo = pageNo
      ..pageSize = pageSize;
  }
}

CollectState initState(Map<String, dynamic> args) {
  return CollectState()
    ..collectEntity = null
    ..controller = EasyRefreshController()
    ..pageNo = 1
    ..pageSize = 20;
}
