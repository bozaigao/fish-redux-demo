import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/models/home/plate_entity.dart';

//TODO replace with your own action
enum IndexAction {
  onJump,
  jump,
  initPageList,
  initHomeData,
  initClassData,
  initPrefectureData,
  getUserInfo
}

class IndexActionCreator {
  static Action jump(int index) {
    return Action(IndexAction.jump, payload: index);
  }

  static Action initPageList(dynamic list) {
    return Action(IndexAction.initPageList, payload: list);
  }

  static Action initHomeData(List<PlateEntity> plateList) {
    return Action(IndexAction.initHomeData, payload: plateList);
  }

  static Action initClassData(List<PlateEntity> plateList) {
    return Action(IndexAction.initClassData, payload: plateList);
  }

  static Action initPrefectureData(List<PlateEntity> plateList) {
    return Action(IndexAction.initPrefectureData, payload: plateList);
  }

  static Action getUserInfo() {
    return const Action(IndexAction.getUserInfo);
  }
}
