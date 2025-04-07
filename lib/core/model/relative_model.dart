class RelativeModel {
  String? message;
  RelativeRelativeModel? relative;
  UserRelativeModel? user;

  RelativeModel({this.message, this.relative, this.user});

  RelativeModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    relative = json['relative'] != null
        ? new RelativeRelativeModel.fromJson(json['relative'])
        : null;
    user = json['user'] != null ? new UserRelativeModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.relative != null) {
      data['relative'] = this.relative!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class RelativeRelativeModel {
  int? userId;
  int? unitId;
  int? relativeId;
  String? status;
  String? updatedAt;
  String? createdAt;
  int? id;

  RelativeRelativeModel(
      {this.userId,
        this.unitId,
        this.relativeId,
        this.status,
        this.updatedAt,
        this.createdAt,
        this.id});

  RelativeRelativeModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    unitId = json['unit_id'];
    relativeId = json['relative_id'];
    status = json['status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['unit_id'] = this.unitId;
    data['relative_id'] = this.relativeId;
    data['status'] = this.status;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

class UserRelativeModel {
  String? name;
  dynamic? image;
  String? email;
  String? userType;
  String? cardId;
  dynamic? location;
  dynamic? latitude;
  dynamic? longitude;
  dynamic? companyActivity;
  int? dashboardType;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? code;

  UserRelativeModel(
      {this.name,
        this.image,
        this.email,
        this.userType,
        this.cardId,
        this.location,
        this.latitude,
        this.longitude,
        this.companyActivity,
        this.dashboardType,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.code});

  UserRelativeModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    email = json['email'];
    userType = json['user_type'];
    cardId = json['card_id'];
    location = json['location'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    companyActivity = json['company_activity'];
    dashboardType = json['dashboard_type'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['email'] = this.email;
    data['user_type'] = this.userType;
    data['card_id'] = this.cardId;
    data['location'] = this.location;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['company_activity'] = this.companyActivity;
    data['dashboard_type'] = this.dashboardType;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['code'] = this.code;
    return data;
  }
}
