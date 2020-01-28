import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class AuthButtonComponent extends Component<AuthButtonState> {
  AuthButtonComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<AuthButtonState>(
                adapter: null,
                slots: <String, Dependent<AuthButtonState>>{
                }),);

}
