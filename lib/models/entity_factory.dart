import 'package:flutter_app/models/user_info_entity.dart';

import 'home/material_entity.dart';
import 'home/plate_entity.dart';
import 'mine/collect_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (T.toString() == "PlateEntity") {
      return PlateEntity.fromJson(json) as T;
    } else if (T.toString() == "UserInfoEntity") {
      return UserInfoEntity.fromJson(json) as T;
    }else if (T.toString() == "CollectEntity") {
      return CollectEntity.fromJson(json) as T;
    }else if (T.toString() == "MaterialEntity") {
      return MaterialEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}
