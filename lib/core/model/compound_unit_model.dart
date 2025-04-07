class CompoundUnitModel {
  int? id;
  int? userId;
  int? compoundUserId;
  int? unitCat;
  dynamic? name;
  dynamic? location;
  String? unitArea;
  String? latitude;
  String? longitude;
  int? numberOfRooms;
  String? contactNumber;
  String? availableEntertainment;
  dynamic? salePrice;
  dynamic? saleDiscount;
  dynamic? rentPrice;
  dynamic? rentDiscount;
  dynamic? rentType;
  String? details;
  dynamic? paymentMethods;
  int? petsAvailable;
  int? addCodeToTelephone;
  dynamic? video;
  String? status;
  String? rentStatus;
  int? isActive;
  String? createdAt;
  String? updatedAt;
  List<ImagesUnitsCompound>? images;
  List<RatingUnitsCompound>? rating;
  List<PaymentMethod>? paymentMethod;

  CompoundUnitModel(
      {this.id,
        this.userId,
        this.compoundUserId,
        this.unitCat,
        this.name,
        this.location,
        this.unitArea,
        this.latitude,
        this.longitude,
        this.numberOfRooms,
        this.contactNumber,
        this.availableEntertainment,
        this.salePrice,
        this.saleDiscount,
        this.rentPrice,
        this.rentDiscount,
        this.rentType,
        this.details,
        this.paymentMethods,
        this.petsAvailable,
        this.addCodeToTelephone,
        this.video,
        this.status,
        this.rentStatus,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.images,
        this.rating,
        this.paymentMethod});

  CompoundUnitModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    compoundUserId = json['compound_user_id'];
    unitCat = json['unit_cat'];
    name = json['name'];
    location = json['location'];
    unitArea = json['unit_area'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    numberOfRooms = json['number_of_rooms'];
    contactNumber = json['contact_number'];
    availableEntertainment = json['available_entertainment'];
    salePrice = json['sale_price'];
    saleDiscount = json['sale_discount'];
    rentPrice = json['rent_price'];
    rentDiscount = json['rent_discount'];
    rentType = json['rent_type'];
    details = json['details'];
    paymentMethods = json['payment_methods'];
    petsAvailable = json['pets_available'];
    addCodeToTelephone = json['add_code_to_telephone'];
    video = json['video'];
    status = json['status'];
    rentStatus = json['rent_status'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['images'] != null) {
      images = <ImagesUnitsCompound>[];
      json['images'].forEach((v) {
        images!.add(new ImagesUnitsCompound.fromJson(v));
      });
    }
    if (json['rating'] != null) {
      rating = <RatingUnitsCompound>[];
      json['rating'].forEach((v) {
        rating!.add(new RatingUnitsCompound.fromJson(v));
      });
    }
    if (json['payment_method'] != null) {
      paymentMethod = <PaymentMethod>[];
      json['payment_method'].forEach((v) {
        paymentMethod!.add(new PaymentMethod.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['compound_user_id'] = this.compoundUserId;
    data['unit_cat'] = this.unitCat;
    data['name'] = this.name;
    data['location'] = this.location;
    data['unit_area'] = this.unitArea;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['number_of_rooms'] = this.numberOfRooms;
    data['contact_number'] = this.contactNumber;
    data['available_entertainment'] = this.availableEntertainment;
    data['sale_price'] = this.salePrice;
    data['sale_discount'] = this.saleDiscount;
    data['rent_price'] = this.rentPrice;
    data['rent_discount'] = this.rentDiscount;
    data['rent_type'] = this.rentType;
    data['details'] = this.details;
    data['payment_methods'] = this.paymentMethods;
    data['pets_available'] = this.petsAvailable;
    data['add_code_to_telephone'] = this.addCodeToTelephone;
    data['video'] = this.video;
    data['status'] = this.status;
    data['rent_status'] = this.rentStatus;
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
class RatingUnitsCompound {
  int? id;
  int? unitId;
  int? userId;
  int? rating;
  String? createdAt;
  String? updatedAt;

  RatingUnitsCompound(
      {this.id,
        this.unitId,
        this.userId,
        this.rating,
        this.createdAt,
        this.updatedAt});

  RatingUnitsCompound.fromJson(Map<String, dynamic> json) {
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

class ImagesUnitsCompound {
  int? id;
  int? ownerUnitId;
  String? imagePath;
  String? createdAt;
  String? updatedAt;

  ImagesUnitsCompound(
      {this.id,
        this.ownerUnitId,
        this.imagePath,
        this.createdAt,
        this.updatedAt});

  ImagesUnitsCompound.fromJson(Map<String, dynamic> json) {
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
class PaymentMethod {
  int? id;
  int? unitId;
  String? name;
  String? paymentMethodNo;
  String? createdAt;
  String? updatedAt;

  PaymentMethod(
      {this.id,
        this.unitId,
        this.name,
        this.paymentMethodNo,
        this.createdAt,
        this.updatedAt});

  PaymentMethod.fromJson(Map<String, dynamic> json) {
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