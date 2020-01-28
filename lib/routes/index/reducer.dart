import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<IndexState> buildReducer() {
  return asReducer(
    <Object, Reducer<IndexState>>{
      IndexAction.jump: _jump,
      IndexAction.initPageList: _init,
      IndexAction.initHomeData:_initHomeData,
      IndexAction.initClassData:_initClassData,
      IndexAction.initPrefectureData:_initPrefectureData
    },
  );
}

IndexState _jump(IndexState state, Action action) {
  final int newIndex = action.payload;
  return state.clone()
    ..currentIndex = newIndex;
}

IndexState _init(IndexState state, Action action) {
  final dynamic pageList = action.payload;
  return state.clone()
    ..pageList = pageList;
}

IndexState _initHomeData(IndexState state, Action action) {
  return state.clone()..homePlateList = action.payload;
}

IndexState _initClassData(IndexState state, Action action) {
  return state.clone()..classPlateList = action.payload;
}

IndexState _initPrefectureData(IndexState state, Action action) {
  return state.clone()..prefecturePlateList = action.payload;
}

