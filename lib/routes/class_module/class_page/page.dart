import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ClassPage extends Page<ClassState, Map<String, dynamic>>{
  ClassPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ClassState>(
                adapter: null,
                slots: <String, Dependent<ClassState>>{
                }),
            middleware: <Middleware<ClassState>>[
            ],);

}
