class UserInfoEntity {
  AccountInfoEntity accountInfo;
  IdentityoutEntity identity;
  BankCardEntity bankCard;
  UserInfoEntity({
    this.accountInfo,
    this.identity,
    this.bankCard
  });

  UserInfoEntity.fromJson(Map < String, dynamic > json):
    accountInfo=AccountInfoEntity.fromJson(json['accountInfo']),
    identity=IdentityoutEntity.fromJson(json['identity']),
    bankCard=BankCardEntity.fromJson(json['bankCard']);
  Map <String, dynamic> toJson() => {
    'accountInfo':accountInfo?.toJson(),
    'identity':identity?.toJson(),
    'bankCard':bankCard?.toJson()
  };
}

class AccountInfoEntity {
  String id;
  String name;
  String mobile;
  String gender;
  String role;
  num integral;
  num amount;
  bool hasPassword;
  String saleContractId;
  AccountInfoEntity({
    this.id,
    this.name,
    this.mobile,
    this.gender,
    this.role,
    this.integral,
    this.amount,
    this.hasPassword,
    this.saleContractId
  });

  AccountInfoEntity.fromJson(Map < String, dynamic > json):
    id=json['id'],
    name=json['name'],
    mobile=json['mobile'],
    gender=json['gender'],
    role=json['role'],
    integral=json['integral'],
    amount=json['amount'],
    hasPassword=json['hasPassword'],
    saleContractId=json['saleContractId'];
  Map <String, dynamic> toJson() => {
    'id':id,
    'name':name,
    'mobile':mobile,
    'gender':gender,
    'role':role,
    'integral':integral,
    'amount':amount,
    'hasPassword':hasPassword,
    'saleContractId':saleContractId
  };
}

class IdentityoutEntity {
  String status;
  String reason;
  String role;
  String company;
  IdentityinEntity identity;
  bool canIdentity;
  IdentityoutEntity({
    this.status,
    this.reason,
    this.role,
    this.company,
    this.identity,
    this.canIdentity
  });

  IdentityoutEntity.fromJson(Map < String, dynamic > json):
    status=json['status'],
    reason=json['reason'],
    role=json['role'],
    company=json['company'],
    canIdentity=json['canIdentity'],
    identity=IdentityinEntity.fromJson(json['identity']);
  Map <String, dynamic> toJson() => {
    'status':status,
    'reason':reason,
    'role':role,
    'company':company,
    'canIdentity':canIdentity,
    'identity':identity?.toJson()
  };
}

class IdentityinEntity {
  String role;
  String img;
  String cardAft;
  String cardFore;
  String eSignature;
  String serviceTarget;
  String manageName;
  String manageMobile;
  String relation;
  String company;
  String name;
  String cardNo;
  String gender;
  bool residenceType;
  String license;
  ExtEntity ext;
  IdentityinEntity({
    this.role,
    this.img,
    this.cardAft,
    this.cardFore,
    this.eSignature,
    this.serviceTarget,
    this.manageName,
    this.manageMobile,
    this.relation,
    this.company,
    this.name,
    this.cardNo,
    this.gender,
    this.residenceType,
    this.license,
    this.ext
  });

  IdentityinEntity.fromJson(Map < String, dynamic > json):
    role=json['role'],
    img=json['img'],
    cardAft=json['cardAft'],
    cardFore=json['cardFore'],
    eSignature=json['eSignature'],
    serviceTarget=json['serviceTarget'],
    manageName=json['manageName'],
    manageMobile=json['manageMobile'],
    relation=json['relation'],
    company=json['company'],
    name=json['name'],
    cardNo=json['cardNo'],
    gender=json['gender'],
    residenceType=json['residenceType'],
    license=json['license'],
    ext=ExtEntity.fromJson(json['ext']);
  Map <String, dynamic> toJson() => {
    'role':role,
    'img':img,
    'cardAft':cardAft,
    'cardFore':cardFore,
    'eSignature':eSignature,
    'serviceTarget':serviceTarget,
    'manageName':manageName,
    'manageMobile':manageMobile,
    'relation':relation,
    'company':company,
    'name':name,
    'cardNo':cardNo,
    'gender':gender,
    'residenceType':residenceType,
    'license':license,
    'ext':ext?.toJson()
  };
}

class ExtEntity {
  String accountId;
  List<String> categories;
  List<String> channels;
  List<num> productIds;
  List<AreasEntity> areas;
  List<String> hospitals;
  List<String> departments;
  String pharmacy;
  String other;
  List<ProductsEntity> products;
  ExtEntity({
    this.accountId,
    this.categories,
    this.channels,
    this.productIds,
    this.areas,
    this.hospitals,
    this.departments,
    this.pharmacy,
    this.other,
    this.products
  });

  ExtEntity.fromJson(Map < String, dynamic > json):
    accountId=json['accountId'],
    pharmacy=json['pharmacy'],
    other=json['other'],
    categories=List<String>.from(json['categories']),
    channels=List<String>.from(json['channels']),
    productIds=List<num>.from(json['productIds']),
    hospitals=List<String>.from(json['hospitals']),
    departments=List<String>.from(json['departments']),
    areas=(json['areas'] as List)?.map((l)=>AreasEntity.fromJson(l))?.toList(),
    products=(json['products'] as List)?.map((l)=>ProductsEntity.fromJson(l))?.toList();
  Map <String, dynamic> toJson() => {
    'accountId':accountId,
    'pharmacy':pharmacy,
    'other':other,
    'categories':categories,
    'channels':channels,
    'productIds':productIds,
    'hospitals':hospitals,
    'departments':departments,
    'areas':areas?.map((it)=>it.toJson())?.toList(),
    'products':products?.map((it)=>it.toJson())?.toList()
  };
}

class AreasEntity {
  String province;
  String city;
  String district;
  AreasEntity({
    this.province,
    this.city,
    this.district
  });

  AreasEntity.fromJson(Map < String, dynamic > json):
    province=json['province'],
    city=json['city'],
    district=json['district'];
  Map <String, dynamic> toJson() => {
    'province':province,
    'city':city,
    'district':district
  };
}

class ProductsEntity {
  num id;
  String title;
  String size;
  String company;
  String pharmaId;
  String pharmaName;
  String titleLetter;
  ProductsEntity({
    this.id,
    this.title,
    this.size,
    this.company,
    this.pharmaId,
    this.pharmaName,
    this.titleLetter
  });

  ProductsEntity.fromJson(Map < String, dynamic > json):
    id=json['id'],
    title=json['title'],
    size=json['size'],
    company=json['company'],
    pharmaId=json['pharmaId'],
    pharmaName=json['pharmaName'],
    titleLetter=json['titleLetter'];
  Map <String, dynamic> toJson() => {
    'id':id,
    'title':title,
    'size':size,
    'company':company,
    'pharmaId':pharmaId,
    'pharmaName':pharmaName,
    'titleLetter':titleLetter
  };
}

class BankCardEntity {
  String cardNo;
  String cardName;
  BankCardEntity({
    this.cardNo,
    this.cardName
  });

  BankCardEntity.fromJson(Map < String, dynamic > json):
    cardNo=json['cardNo'],
    cardName=json['cardName'];
  Map <String, dynamic> toJson() => {
    'cardNo':cardNo,
    'cardName':cardName
  };
}