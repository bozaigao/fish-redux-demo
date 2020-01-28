import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ClassState> buildReducer() {
  return asReducer(
    <Object, Reducer<ClassState>>{
    },
  );
}
