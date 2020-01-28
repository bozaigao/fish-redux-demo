import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class PrefecturePage extends Page<PrefectureState, Map<String, dynamic>> {
  PrefecturePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<PrefectureState>(
                adapter: null,
                slots: <String, Dependent<PrefectureState>>{
                }),
            middleware: <Middleware<PrefectureState>>[
            ],);

}
