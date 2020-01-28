import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/routes/login_page/auth_button/component.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class LoginPage extends Page<LoginState, Map<String, dynamic>> {
  LoginPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<LoginState>(
              adapter: null,
              slots: <String, Dependent<LoginState>>{
                'authButton': AuthButtonConnector() + AuthButtonComponent()
              }),
          middleware: <Middleware<LoginState>>[],
        );
}
