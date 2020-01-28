class HttpApi {
  /**登录模块**/

  ///密码登录
  static const String password = 'login/password';

  /**首页模块**/

  ///获取首页板块配置数据
  static const String getHomePagePlate = 'plate/home';

  ///获取素材详情数据
  static const String getMaterialDetail = 'material/detail';

  /**云学术模块**/

  ///获取云学术板块配置数据
  static const String cloudAcademy = 'plate/cloudAcademy';

  /**专区模块**/

  ///获取专区板块配置数据
  static const String special = 'plate/special';

  /**用户模块**/

  ///获取用户基本资料
  static const String getUserInfo = 'info/selfNew';

  ///获取我的收藏记录
  static const String getCollectRecord = 'collect/pageRecord';
}
