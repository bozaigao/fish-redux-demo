import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CollectState> buildReducer() {
  return asReducer(
    <Object, Reducer<CollectState>>{
      CollectAction.initData: _initData,
      CollectAction.updatePageNo: _updatePageNo,
      CollectAction.refresh: _refresh,
      CollectAction.loadMore: _loadMore,
    },
  );
}

CollectState _initData(CollectState state, Action action) {
  return state.clone()
  ..collectEntity = action.payload;
}

CollectState _updatePageNo(CollectState state, Action action) {
  return state.clone()
    ..pageNo = action.payload;
}

CollectState _refresh(CollectState state, Action action) {
  return state.clone()
    ..collectEntity = action.payload;
}

CollectState _loadMore(CollectState state, Action action) {
  return state.clone()
    ..collectEntity = action.payload;
}
