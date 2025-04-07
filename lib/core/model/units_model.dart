class UnitsModel {
  int? id;
  int? userId;
  dynamic? unitCat;
  String? unitArea;
  String? latitude;
  String? longitude;
  int? numberOfRooms;
  String? contactNumber;
  String? name;
  String? location;
  dynamic? availableEntertainment;
  dynamic? availableEntertainmentAr;
  String? salePrice;
  dynamic? saleDiscount;
  String? rentPrice;
  dynamic? rentDiscount;
  dynamic? details;
  dynamic? detailsAr;
  dynamic? paymentMethods;
  int? petsAvailable;
  int? addCodeToTelephone;
  String? video;
  String? status;
  int? isActive;
  dynamic? createdAt;
  String? updatedAt;
  List<ImagesUnitsModel>? images;
  List<Rating>? rating;
  List<PaymentMethodModel>? paymentMethod;

  UnitsModel(
      {this.id,
        this.userId,
        this.unitCat,
        this.unitArea,
        this.latitude,
        this.longitude,
        this.numberOfRooms,
        this.contactNumber,
        this.name,
        this.location,
        this.availableEntertainment,
        this.availableEntertainmentAr,
        this.salePrice,
        this.saleDiscount,
        this.rentPrice,
        this.rentDiscount,
        this.details,
        this.detailsAr,
        this.paymentMethods,
        this.petsAvailable,
        this.addCodeToTelephone,
        this.video,
        this.status,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.images,
        this.rating,
        this.paymentMethod});

  UnitsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    unitCat = json['unit_cat'];
    unitArea = json['unit_area'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    numberOfRooms = json['number_of_rooms'];
    contactNumber = json['contact_number'];
    name = json['name'];
    location = json['location'];
    availableEntertainment = json['available_entertainment'];
    availableEntertainmentAr = json['available_entertainment_ar'];
    salePrice = json['sale_price'];
    saleDiscount = json['sale_discount'];
    rentPrice = json['rent_price'];
    rentDiscount = json['rent_discount'];
    details = json['details'];
    detailsAr = json['details_ar'];
    paymentMethods = json['payment_methods'];
    petsAvailable = json['pets_available'];
    addCodeToTelephone = json['add_code_to_telephone'];
    video = json['video'];
    status = json['status'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['images'] != null) {
      images = <ImagesUnitsModel>[];
      json['images'].forEach((v) {
        images!.add(new ImagesUnitsModel.fromJson(v));
      });
    }
    if (json['rating'] != null) {
      rating = <Rating>[];
      json['rating'].forEach((v) {
        rating!.add(new Rating.fromJson(v));
      });
    }
    if (json['payment_method'] != null) {
      paymentMethod = <PaymentMethodModel>[];
      json['payment_method'].forEach((v) {
        paymentMethod!.add(new PaymentMethodModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['unit_cat'] = this.unitCat;
    data['unit_area'] = this.unitArea;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['number_of_rooms'] = this.numberOfRooms;
    data['contact_number'] = this.contactNumber;
    data['name'] = this.name;
    data['location'] = this.location;
    data['available_entertainment'] = this.availableEntertainment;
    data['available_entertainment_ar'] = this.availableEntertainmentAr;
    data['sale_price'] = this.salePrice;
    data['sale_discount'] = this.saleDiscount;
    data['rent_price'] = this.rentPrice;
    data['rent_discount'] = this.rentDiscount;
    data['details'] = this.details;
    data['details_ar'] = this.detailsAr;
    data['payment_methods'] = this.paymentMethods;
    data['pets_available'] = this.petsAvailable;
    data['add_code_to_telephone'] = this.addCodeToTelephone;
    data['video'] = this.video;
    data['status'] = this.status;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.rating != null) {
      data['rating'] = this.rating!.map((v) => v.toJson()).toList();
    }
    if (this.paymentMethod != null) {
      data['payment_method'] =
          this.paymentMethod!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rating {
  int? id;
  int? unitId;
  int? userId;
  int? rating;
  String? createdAt;
  String? updatedAt;

  Rating(
      {this.id,
        this.unitId,
        this.userId,
        this.rating,
        this.createdAt,
        this.updatedAt});

  Rating.fromJson(Map<String, dynamic> json) {
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

class ImagesUnitsModel {
  int? id;
  int? ownerUnitId;
  String? imagePath;
  String? createdAt;
  String? updatedAt;

  ImagesUnitsModel(
      {this.id,
        this.ownerUnitId,
        this.imagePath,
        this.createdAt,
        this.updatedAt});

  ImagesUnitsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ownerUnitId = json['owner_unit_id'];
    imagePath = json['image_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['owner_unit_id'] = this.ownerUnitId;
    data['image_path'] = this.imagePath;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}


class PaymentMethodModel {
  int? id;
  int? unitId;
  String? name;
  String? paymentMethodNo;
  String? createdAt;
  String? updatedAt;

  PaymentMethodModel(
      {this.id,
        this.unitId,
        this.name,
        this.paymentMethodNo,
        this.createdAt,
        this.updatedAt});

  PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    unitId = json['unit_id'];
    name = json['name'];
    paymentMethodNo = json['payment_method_no'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['unit_id'] = this.unitId;
    data['name'] = this.name;
    data['payment_method_no'] = this.paymentMethodNo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}