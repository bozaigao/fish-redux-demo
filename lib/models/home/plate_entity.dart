class PlateEntity {
  int id;
  String header;
  int uiType;
  List<PlateItem> items;

  PlateEntity({this.id, this.header, this.uiType, this.items});

  PlateEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    header = json['header'];
    uiType = json['uiType'];
    if (json['items'] != null) {
      items = new List<PlateItem>();
      (json['items'] as List).forEach((v) {
        items.add(new PlateItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['header'] = this.header;
    data['uiType'] = this.uiType;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlateItem {
  int id;
  int plateId;
  String goId;
  String icon1;
  String icon2;
  String line1;
  String line2;
  String line3;
  int goType;

  PlateItem(
      {this.id,
      this.plateId,
      this.goId,
      this.icon1,
      this.icon2,
      this.line1,
      this.line2,
      this.line3,
      this.goType});

  PlateItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    plateId = json['plateId'];
    goId = json['goId'];
    icon1 = json['icon1'];
    icon2 = json['icon2'];
    line1 = json['line1'];
    line2 = json['line2'];
    line3 = json['line3'];
    goType = json['goType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['plateId'] = this.plateId;
    data['goId'] = this.goId;
    data['icon1'] = this.icon1;
    data['icon2'] = this.icon2;
    data['line1'] = this.line1;
    data['line2'] = this.line2;
    data['line3'] = this.line3;
    data['goType'] = this.goType;
    return data;
  }
}
