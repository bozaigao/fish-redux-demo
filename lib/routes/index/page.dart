import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/routes/class_module/class_page/page.dart';
import 'package:flutter_app/routes/home_module/home_page/page.dart';
import 'package:flutter_app/routes/mine_module/mine_page/page.dart';
import 'package:flutter_app/routes/prefecture_module/prefecture_page/page.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class IndexPage extends Page<IndexState, Map<String, dynamic>> {
  IndexPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<IndexState>(
              adapter: null,
              slots: <String, Dependent<IndexState>>{
                'homePage':  HomeConnector() + HomePage(),
                'classPage': ClassConnector() + ClassPage(),
                'prefecturePage': PrefectureConnector() + PrefecturePage(),
                'minePage': MineConnector() + MinePage()
              }),
          middleware: <Middleware<IndexState>>[],
        );
}
