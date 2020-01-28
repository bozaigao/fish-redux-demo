class MaterialEntity {
  String content;
  String crop;
  DoctorEntity doctor;
  String doctorId;
  bool hasCollect;
  String icon;
  String id;
  String origin;
  String title;
  num view;

  MaterialEntity(
      {this.content,
      this.crop,
      this.doctor,
      this.doctorId,
      this.hasCollect,
      this.icon,
      this.id,
      this.origin,
      this.title,
      this.view});

  MaterialEntity.fromJson(Map<String, dynamic> json)
      : content = json['content'],
        crop = json['crop'],
        doctorId = json['doctorId'],
        hasCollect = json['hasCollect'],
        icon = json['icon'],
        id = json['id'],
        origin = json['origin'],
        title = json['title'],
        view = json['view'],
        doctor = DoctorEntity.fromJson(json['doctor']);

  Map<String, dynamic> toJson() => {
        'content': content,
        'crop': crop,
        'doctorId': doctorId,
        'hasCollect': hasCollect,
        'icon': icon,
        'id': id,
        'origin': origin,
        'title': title,
        'view': view,
        'doctor': doctor?.toJson()
      };
}

class DoctorEntity {
  String accountId;
  String epartmene;
  String gender;
  String hospital;
  String mobile;
  String name;
  String post;

  DoctorEntity(
      {this.accountId,
      this.epartmene,
      this.gender,
      this.hospital,
      this.mobile,
      this.name,
      this.post});

  DoctorEntity.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      accountId = json['accountId'];
      epartmene = json['epartmene'];
      gender = json['gender'];
      hospital = json['hospital'];
      mobile = json['mobile'];
      name = json['name'];
      post = json['post'];
    }
  }

  Map<String, dynamic> toJson() => {
        'accountId': accountId,
        'epartmene': epartmene,
        'gender': gender,
        'hospital': hospital,
        'mobile': mobile,
        'name': name,
        'post': post
      };
}
