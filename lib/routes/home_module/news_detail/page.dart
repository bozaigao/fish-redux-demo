import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class NewsDetailPage extends Page<NewsDetailState,NewsInfoModel> {
  NewsDetailPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<NewsDetailState>(
                adapter: null,
                slots: <String, Dependent<NewsDetailState>>{
                }),
            middleware: <Middleware<NewsDetailState>>[
            ],);

}
