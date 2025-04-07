class CompoundsModel {
  String? message;
  List<CompoundsModelData>? data;

  CompoundsModel({this.message, this.data});

  CompoundsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <CompoundsModelData>[];
      json['data'].forEach((v) {
        data!.add(new CompoundsModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CompoundsModelData {
  int? id;
  int? userId;
  String? name;
  String? slug;
  String? details;
  String? email;
  String? mainImage;
  String? qrCode;
  String? phone;
  String? latitude;
  String? longitude;
  String? location;
  String? responseFrom;
  String? responseTo;
  int? starRating;
  String? createdAt;
  String? updatedAt;
  String? qrCodeUrl;
  List<CompoundsModelDataImages>? images;
  List<CompoundsModelDataServices>? services;
  List<CompoundsModelDataRating>? rating;

  CompoundsModelData(
      {this.id,
        this.userId,
        this.name,
        this.slug,
        this.details,
        this.email,
        this.mainImage,
        this.qrCode,
        this.phone,
        this.latitude,
        this.longitude,
        this.location,
        this.responseFrom,
        this.responseTo,
        this.starRating,
        this.createdAt,
        this.updatedAt,
        this.qrCodeUrl,
        this.images,
        this.services,
        this.rating});

  CompoundsModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    slug = json['slug'];
    details = json['details'];
    email = json['email'];
    mainImage = json['main_image'];
    qrCode = json['qr_code'];
    phone = json['phone'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    location = json['location'];
    responseFrom = json['response_from'];
    responseTo = json['response_to'];
    starRating = json['star_rating'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    qrCodeUrl = json['qr_code_url'];
    if (json['images'] != null) {
      images = <CompoundsModelDataImages>[];
      json['images'].forEach((v) {
        images!.add(new CompoundsModelDataImages.fromJson(v));
      });
    }
    if (json['services'] != null) {
      services = <CompoundsModelDataServices>[];
      json['services'].forEach((v) {
        services!.add(new CompoundsModelDataServices.fromJson(v));
      });
    }
    if (json['rating'] != null) {
      rating = <CompoundsModelDataRating>[];
      json['rating'].forEach((v) {
        rating!.add(new CompoundsModelDataRating.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['details'] = this.details;
    data['email'] = this.email;
    data['main_image'] = this.mainImage;
    data['qr_code'] = this.qrCode;
    data['phone'] = this.phone;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['location'] = this.location;
    data['response_from'] = this.responseFrom;
    data['response_to'] = this.responseTo;
    data['star_rating'] = this.starRating;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['qr_code_url'] = this.qrCodeUrl;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    if (this.rating != null) {
      data['rating'] = this.rating!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CompoundsModelDataImages {
  int? id;
  int? compoundId;
  String? imagePath;
  String? createdAt;
  String? updatedAt;

  CompoundsModelDataImages(
      {this.id,
        this.compoundId,
        this.imagePath,
        this.createdAt,
        this.updatedAt});

  CompoundsModelDataImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    compoundId = json['compound_id'];
    imagePath = json['image_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['compound_id'] = this.compoundId;
    data['image_path'] = this.imagePath;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class CompoundsModelDataServices {
  int? id;
  int? compoundId;
  String? service;
  String? createdAt;
  String? updatedAt;

  CompoundsModelDataServices(
      {this.id, this.compoundId, this.service, this.createdAt, this.updatedAt});

  CompoundsModelDataServices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    compoundId = json['compound_id'];
    service = json['service'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['compound_id'] = this.compoundId;
    data['service'] = this.service;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class CompoundsModelDataRating {
  int? id;
  int? compoundId;
  int? userId;
  int? rating;
  String? createdAt;
  String? updatedAt;

  CompoundsModelDataRating(
      {this.id,
        this.compoundId,
        this.userId,
        this.rating,
        this.createdAt,
        this.updatedAt});

  CompoundsModelDataRating.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    compoundId = json['compound_id'];
    userId = json['user_id'];
    rating = json['rating'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['compound_id'] = this.compoundId;
    data['user_id'] = this.userId;
    data['rating'] = this.rating;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}