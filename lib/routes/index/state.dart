import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/global_store/state.dart';
import 'package:flutter_app/models/home/plate_entity.dart';
import 'package:flutter_app/models/user_info_entity.dart';
import 'package:flutter_app/routes/class_module/class_page/state.dart';
import 'package:flutter_app/routes/home_module/home_page/state.dart';
import 'package:flutter_app/routes/mine_module/mine_page/state.dart';
import 'package:flutter_app/routes/prefecture_module/prefecture_page/state.dart';

class IndexState implements GlobalBaseState, Cloneable<IndexState> {
  int currentIndex;
  PageController pageController;
  dynamic pageList;
  List<PlateEntity> homePlateList;
  List<PlateEntity> classPlateList;
  List<PlateEntity> prefecturePlateList;

  @override
  IndexState clone() {
    return IndexState()
      ..currentIndex = currentIndex
      ..pageController = PageController()
      ..pageList = pageList
      ..homePlateList = homePlateList
      ..classPlateList = classPlateList
      ..prefecturePlateList = prefecturePlateList
      ..userInfo = userInfo;
  }

  @override
  UserInfoEntity userInfo;
}

IndexState initState(Map<String, dynamic> args) {
  return IndexState().clone()
    ..currentIndex = 0
    ..pageController = PageController()
    ..pageList = []
    ..homePlateList = []
    ..classPlateList = []
    ..prefecturePlateList = [];
}

//首页
class HomeConnector extends ConnOp<IndexState, HomeState>
    with ReselectMixin<IndexState, HomeState> {
  @override
  HomeState computed(IndexState state) {
    return HomeState()..plateList = state.homePlateList
      ..userInfo = state.userInfo;
  }

  @override
  List<dynamic> factors(IndexState state) {
    return <dynamic>[state.homePlateList.length,state.userInfo];
  }

  @override
  void set(IndexState state, HomeState subState) {
//    throw Exception('Unexcepted to set PageState from HomeState');
  }
}

//云学术
class ClassConnector extends ConnOp<IndexState, ClassState>
    with ReselectMixin<IndexState, ClassState> {
  @override
  ClassState computed(IndexState state) {
    return ClassState()..plateList = state.classPlateList;
  }

  @override
  List<dynamic> factors(IndexState state) {
    return <dynamic>[state.classPlateList.length];
  }

  @override
  void set(IndexState state, ClassState subState) {
    throw Exception('Unexcepted to set PageState from ClassState');
  }
}

//工作台
class PrefectureConnector extends ConnOp<IndexState, PrefectureState>
    with ReselectMixin<IndexState, PrefectureState> {
  @override
  PrefectureState computed(IndexState state) {
    return PrefectureState()..plateList = state.prefecturePlateList;
  }

  @override
  List<dynamic> factors(IndexState state) {
    return <dynamic>[state.prefecturePlateList.length];
  }

  @override
  void set(IndexState state, PrefectureState subState) {
    throw Exception('Unexcepted to set PageState from PrefectureState');
  }
}

//我的
class MineConnector extends ConnOp<IndexState, MineState>
    with ReselectMixin<IndexState, MineState> {
  @override
  MineState computed(IndexState state) {
    return MineState()..userInfo = state.userInfo;
  }

  @override
  List<dynamic> factors(IndexState state) {
    return <dynamic>[state.userInfo];
  }

  @override
  void set(IndexState state, MineState subState) {
    throw Exception('Unexcepted to set PageState from MineState');
  }
}
