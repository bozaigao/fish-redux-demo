import 'package:fish_redux/fish_redux.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_app/routes/index/page.dart';
import 'package:flutter_app/utils/log_utils.dart';
import 'package:flutter_app/utils/routes/application.dart';
import 'package:flutter_app/utils/routes/routers.dart';
import 'package:oktoast/oktoast.dart';
import 'global_store/state.dart';
import 'global_store/store.dart';

/// 创建应用的根 Widget
/// 1. 创建一个简单的路由，并注册页面
/// 2. 对所需的页面进行和 AppStore 的连接
/// 3. 对所需的页面进行 AOP 的增强
Widget createApp() {
  final router = Router();
  Routes.configureRoutes(router);
  Application.router = router;
  Log.init();

  dynamic indexPage = IndexPage();
  indexPage.connectExtraStore<GlobalState>(GlobalStore.store,
      (Object pagestate, GlobalState appState) {
    final GlobalBaseState p = pagestate;
    if (p.userInfo != appState.userInfo) {
      if (pagestate is Cloneable) {
        final Object copy = pagestate.clone();
        final GlobalBaseState newState = copy;
        newState.userInfo = appState.userInfo;
        return newState;
      }
    }
    return pagestate;
  });

  return OKToast(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: indexPage.buildPage(null),
      onGenerateRoute: Application.router.generator,
    ),
  );
}
