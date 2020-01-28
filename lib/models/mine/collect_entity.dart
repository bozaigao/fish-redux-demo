import 'package:flutter_app/models/home/plate_entity.dart';

class CollectEntity {
  num first;
  num pageNo;
  num pageSize;
  List<PlateItem> result;
  num total;
  num totalPage;
  CollectEntity({
    this.first,
    this.pageNo,
    this.pageSize,
    this.result,
    this.total,
    this.totalPage
  });

  CollectEntity.fromJson(Map < String, dynamic > json):
    first=json['first'],
    pageNo=json['pageNo'],
    pageSize=json['pageSize'],
    total=json['total'],
    totalPage=json['totalPage'],
    result=(json['result'] as List)?.map((l)=>PlateItem.fromJson(l))?.toList();
  Map <String, dynamic> toJson() => {
    'first':first,
    'pageNo':pageNo,
    'pageSize':pageSize,
    'total':total,
    'totalPage':totalPage,
    'result':result?.map((it)=>it.toJson())?.toList()
  };
}