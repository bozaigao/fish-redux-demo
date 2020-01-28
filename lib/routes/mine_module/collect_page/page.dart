import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CollectPage extends Page<CollectState, Map<String, dynamic>> {
  CollectPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CollectState>(
                adapter: null,
                slots: <String, Dependent<CollectState>>{
                }),
            middleware: <Middleware<CollectState>>[
            ],);

}
