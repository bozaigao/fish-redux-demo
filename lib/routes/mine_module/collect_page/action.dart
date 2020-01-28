import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/models/mine/collect_entity.dart';

//TODO replace with your own action
enum CollectAction {
  initData,
  updatePageNo,
  onRefresh,
  refresh,
  onLoadMore,
  loadMore
}

class CollectActionCreator {
  static Action onInitData(CollectEntity collectEntity) {
    return Action(CollectAction.initData, payload: collectEntity);
  }

  static Action updatePageNo(int newPageNo) {
    return Action(CollectAction.updatePageNo, payload: newPageNo);
  }

  static Action onRefresh() {
    return const Action(CollectAction.onRefresh);
  }

  static Action refresh(CollectEntity collectEntity) {
    return Action(CollectAction.refresh, payload: collectEntity);
  }

  static Action onLoadMore() {
    return const Action(CollectAction.onLoadMore);
  }

  static Action loadMore(CollectEntity collectEntity) {
    return Action(CollectAction.loadMore, payload: collectEntity);
  }
}
