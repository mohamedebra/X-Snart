
class ServicesModel {
  int? id;
  int? userId;
  int? catId;
  String? name;
  String? slug;
  String? email;
  String? phone;
  String? address;
  String? image;
  String? qrCode;
  String? desc;
  int? active;
  String? createdAt;
  String? updatedAt;
  List<DetailsServices>? details;
  List<RatingServices>? rating;

  ServicesModel(
      {this.id,
        this.userId,
        this.catId,
        this.name,
        this.slug,
        this.email,
        this.phone,
        this.address,
        this.image,
        this.qrCode,
        this.desc,
        this.active,
        this.createdAt,
        this.updatedAt,
        this.details,
        this.rating});

  ServicesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    catId = json['cat_id'];
    name = json['name'];
    slug = json['slug'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    image = json['image'];
    qrCode = json['qr_code'];
    desc = json['desc'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['details'] != null) {
      details = <DetailsServices>[];
      json['details'].forEach((v) {
        details!.add(new DetailsServices.fromJson(v));
      });
    }
    if (json['rating'] != null) {
      rating = <RatingServices>[];
      json['rating'].forEach((v) {
        rating!.add(new RatingServices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['cat_id'] = this.catId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['image'] = this.image;
    data['qr_code'] = this.qrCode;
    data['desc'] = this.desc;
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.details != null) {
      data['details'] = this.details!.map((v) => v.toJson()).toList();
    }
    if (this.rating != null) {
      data['rating'] = this.rating!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class RatingServices {
  int? id;
  int? unitId;
  int? userId;
  int? rating;
  String? createdAt;
  String? updatedAt;

  RatingServices(
      {this.id,
        this.unitId,
        this.userId,
        this.rating,
        this.createdAt,
        this.updatedAt});

  RatingServices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    unitId = json['unit_id'];
    userId = json['user_id'];
    rating = (json['rating'] is double) ? (json['rating'] as double).toInt() : json['rating'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['unit_id'] = this.unitId;
    data['user_id'] = this.userId;
    data['rating'] = this.rating;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class DetailsServices {
  int? id;
  int? serviceId;
  String? service;
  String? price;
  String? dicount;
  int? isOffered;
  dynamic? createdAt;
  dynamic? updatedAt;

  DetailsServices(
      {this.id,
        this.serviceId,
        this.service,
        this.price,
        this.dicount,
        this.isOffered,
        this.createdAt,
        this.updatedAt});

  DetailsServices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceId = json['service_id'];
    service = json['service'];
    price = json['price'];
    dicount = json['dicount'];
    isOffered = json['is_offered'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['service_id'] = this.serviceId;
    data['service'] = this.service;
    data['price'] = this.price;
    data['dicount'] = this.dicount;
    data['is_offered'] = this.isOffered;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}