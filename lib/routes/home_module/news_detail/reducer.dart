import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<NewsDetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<NewsDetailState>>{
      NewsDetailAction.initData: _initData,
      NewsDetailAction.updateWebViewHeight: _updateWebViewHeight,
    },
  );
}

NewsDetailState _initData(NewsDetailState state, Action action) {
  return state.clone()
  ..materialEntity = action.payload;
}

NewsDetailState _updateWebViewHeight(NewsDetailState state, Action action) {
  return state.clone()
    ..webViewHeight = action.payload;
}
