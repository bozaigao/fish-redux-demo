import 'package:fish_redux/fish_redux.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_app/global_store/state.dart';
import 'package:flutter_app/global_store/store.dart';
import 'package:flutter_app/models/index/page_component.dart';
import 'package:flutter_app/routes/home_module/news_detail/page.dart';
import 'package:flutter_app/routes/home_module/news_detail/state.dart';
import 'package:flutter_app/routes/login_page/page.dart';
import 'package:flutter_app/routes/mine_module/collect_page/page.dart';
import 'package:flutter_app/routes/mine_module/setting_page/page.dart';

import '404.dart';

class Routes {
  //登录页面
  static String loginPage = "/loginPage";

  //设置页面
  static String settingPage = "/settingPage";

  //我的收藏页面
  static String collectPage = "/collectPage";

  //新闻详情页面
  static String newsDetailPage = "/newsDetailPage";
  static String webViewPage = "/webViewPage";
  static List<dynamic> listRoutes = [];

  static void configureRoutes(Router router) {
    /// 指定路由跳转错误返回页
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      debugPrint("未找到目标页");
      return WidgetNotFound();
    });

    listRoutes
        .add(PageComponent(pageName: Routes.loginPage, page: LoginPage()));

    listRoutes
        .add(PageComponent(pageName: Routes.settingPage, page: SettingPage()));

    listRoutes
        .add(PageComponent(pageName: Routes.collectPage, page: CollectPage()));

        router.define(Routes.newsDetailPage, handler: Handler(handlerFunc: (_, params) {
          return NewsDetailPage().buildPage(NewsInfoModel(title: params['title'].first,id: params['id'].first));
        }));

    ///添加公共的方法
    listRoutes.forEach((dynamic route) {
      /// 只有特定的范围的 Page 才需要建立和 AppStore 的连接关系
      /// 满足 Page<T> ，T 是 GlobalBaseState 的子类
      if (route.page.isTypeof<GlobalBaseState>()) {
        /// 建立 AppStore 驱动 PageStore 的单向数据连接
        /// 1. 参数1 AppStore
        /// 2. 参数2 当 AppStore.state 变化时, PageStore.state 该如何变化
        route.page.connectExtraStore<GlobalState>(GlobalStore.store,
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
      }

      route.page
        ..enhancer.append(
          /// View AOP
          viewMiddleware: <ViewMiddleware<dynamic>>[
            safetyView<dynamic>(),
          ],

          /// Adapter AOP
          adapterMiddleware: <AdapterMiddleware<dynamic>>[
            safetyAdapter<dynamic>()
          ],

          /// Effect AOP
          effectMiddleware: <EffectMiddleware<dynamic>>[
            _pageAnalyticsMiddleware<dynamic>(),
          ],

          /// Store AOP
          middleware: <Middleware<dynamic>>[
            logMiddleware<dynamic>(tag: route.page.runtimeType.toString()),
          ],
        );
      router.define(route.pageName,
          handler: Handler(
              handlerFunc:
                  (BuildContext context, Map<String, List<String>> params) =>
                      route.page.buildPage(null)));
    });
  }
}

/// 简单的 Effect AOP
/// 只针对页面的生命周期进行打印
EffectMiddleware<T> _pageAnalyticsMiddleware<T>({String tag = 'redux'}) {
  return (AbstractLogic<dynamic> logic, Store<T> store) {
    return (Effect<dynamic> effect) {
      return (Action action, Context<dynamic> ctx) {
        if (logic is Page<dynamic, dynamic> && action.type is Lifecycle) {
          print('${logic.runtimeType} ${action.type.toString()} ');
        }
        return effect?.call(action, ctx);
      };
    };
  };
}
