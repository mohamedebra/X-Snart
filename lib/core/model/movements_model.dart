class MovementsModel {
  String? message;
  List<MovementsModelData>? data;

  MovementsModel({this.message, this.data});

  MovementsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <MovementsModelData>[];
      json['data'].forEach((v) {
        data!.add(new MovementsModelData.fromJson(v));
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

class MovementsModelData {
  int? id;
  int? userId;
  int? compoundUserId;
  int? unitId;
  String? purpose;
  String? vehicleType;
  int? visitId;
  String? numberOfPeople;
  String? fromDate;
  String? toDate;
  String? createdAt;
  String? updatedAt;
  String? mainUserName;
  dynamic? mainUserCardId;
  int? visitUnitId;
  String? purposeOfVisit;
  List<MovementDetails>? movementDetails;
  List<RentedUnits>? rentedUnits;
  List<UserUnits>? userUnits;

  MovementsModelData(
      {this.id,
        this.userId,
        this.compoundUserId,
        this.unitId,
        this.purpose,
        this.vehicleType,
        this.visitId,
        this.numberOfPeople,
        this.fromDate,
        this.toDate,
        this.createdAt,
        this.updatedAt,
        this.mainUserName,
        this.mainUserCardId,
        this.visitUnitId,
        this.purposeOfVisit,
        this.movementDetails,
        this.rentedUnits,
        this.userUnits});

  MovementsModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    compoundUserId = json['compound_user_id'];
    unitId = json['unit_id'];
    purpose = json['purpose'];
    vehicleType = json['vehicle_type'];
    visitId = json['visit_id'];
    numberOfPeople = json['number_of_people'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    mainUserName = json['main_user_name'];
    mainUserCardId = json['main_user_card_id'];
    visitUnitId = json['visit_unit_id'];
    purposeOfVisit = json['purpose_of_visit'];
    if (json['movementDetails'] != null) {
      movementDetails = <MovementDetails>[];
      json['movementDetails'].forEach((v) {
        movementDetails!.add(new MovementDetails.fromJson(v));
      });
    }
    if (json['rentedUnits'] != null) {
      rentedUnits = <RentedUnits>[];
      json['rentedUnits'].forEach((v) {
        rentedUnits!.add(new RentedUnits.fromJson(v));
      });
    }
    if (json['userUnits'] != null) {
      userUnits = <UserUnits>[];
      json['userUnits'].forEach((v) {
        userUnits!.add(new UserUnits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['compound_user_id'] = this.compoundUserId;
    data['unit_id'] = this.unitId;
    data['purpose'] = this.purpose;
    data['vehicle_type'] = this.vehicleType;
    data['visit_id'] = this.visitId;
    data['number_of_people'] = this.numberOfPeople;
    data['from_date'] = this.fromDate;
    data['to_date'] = this.toDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['main_user_name'] = this.mainUserName;
    data['main_user_card_id'] = this.mainUserCardId;
    data['visit_unit_id'] = this.visitUnitId;
    data['purpose_of_visit'] = this.purposeOfVisit;
    if (this.movementDetails != null) {
      data['movementDetails'] =
          this.movementDetails!.map((v) => v.toJson()).toList();
    }
    if (this.rentedUnits != null) {
      data['rentedUnits'] = this.rentedUnits!.map((v) => v.toJson()).toList();
    }
    if (this.userUnits != null) {
      data['userUnits'] = this.userUnits!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MovementDetails {
  int? id;
  int? movementId;
  int? cardId;
  String? name;
  String? phone;
  String? fromDate;
  String? toDate;
  String? createdAt;
  String? updatedAt;

  MovementDetails(
      {this.id,
        this.movementId,
        this.cardId,
        this.name,
        this.phone,
        this.fromDate,
        this.toDate,
        this.createdAt,
        this.updatedAt});

  MovementDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    movementId = json['movement_id'];
    cardId = json['card_id'];
    name = json['name'];
    phone = json['phone'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['movement_id'] = this.movementId;
    data['card_id'] = this.cardId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['from_date'] = this.fromDate;
    data['to_date'] = this.toDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class RentedUnits {
  int? id;
  dynamic? name;
  dynamic? propertyNumber;
  dynamic? apartmentNumber;

  RentedUnits({this.id, this.name, this.propertyNumber, this.apartmentNumber});

  RentedUnits.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    propertyNumber = json['property_number'];
    apartmentNumber = json['apartment_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['property_number'] = this.propertyNumber;
    data['apartment_number'] = this.apartmentNumber;
    return data;
  }
}

class UserUnits {
  int? id;
  String? name;
  String? propertyNumber;
  String? apartmentNumber;

  UserUnits({this.id, this.name, this.propertyNumber, this.apartmentNumber});

  UserUnits.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    propertyNumber = json['property_number'];
    apartmentNumber = json['apartment_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['property_number'] = this.propertyNumber;
    data['apartment_number'] = this.apartmentNumber;
    return data;
  }
}