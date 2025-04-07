import 'package:get/get.dart';

class MyUnit {
  int? id;
  int? userId;
  String? unitType;
  String? unitArea;
  String? location;
  int? numberOfRooms;
  String? contactNumber;
  String? availableEntertainment;
  int? numberOfBeds;
  String? price;
  String? details;
  String? paymentMethods;
  bool? petsAvailable;
  bool? addCodeToTelephone;
  String? createdAt;
  String? updatedAt;
  String? status;
  dynamic? options;
  int? isActive;
  List<ImagesUnit>? images;

  MyUnit(
      {this.id,
        this.userId,
        this.unitType,
        this.unitArea,
        this.location,
        this.numberOfRooms,
        this.contactNumber,
        this.availableEntertainment,
        this.numberOfBeds,
        this.price,
        this.details,
        this.paymentMethods,
        this.petsAvailable,
        this.addCodeToTelephone,
        this.createdAt,
        this.updatedAt,
        this.status,
        this.options,
        this.isActive,
        this.images});

  MyUnit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    unitType = json['unit_type'];
    unitArea = json['unit_area'];
    location = json['location'];
    numberOfRooms = json['number_of_rooms'];
    contactNumber = json['contact_number'];
    availableEntertainment = json['available_entertainment'];
    numberOfBeds = json['number_of_beds'];
    price = json['price'];
    details = json['details'];
    paymentMethods = json['payment_methods'];
    petsAvailable = json['pets_available'] == 1 ? true : false;
    addCodeToTelephone = json['add_code_to_telephone'] == 1 ? true : false;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    options = json['options'];
    isActive = json['is_active'];
    if (json['images'] != null) {
      images = <ImagesUnit>[];
      json['images'].forEach((v) {
        images!.add(new ImagesUnit.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['unit_type'] = this.unitType;
    data['unit_area'] = this.unitArea;
    data['location'] = this.location;
    data['number_of_rooms'] = this.numberOfRooms;
    data['contact_number'] = this.contactNumber;
    data['available_entertainment'] = this.availableEntertainment;
    data['number_of_beds'] = this.numberOfBeds;
    data['price'] = this.price;
    data['details'] = this.details;
    data['payment_methods'] = this.paymentMethods;
    data['pets_available'] = this.petsAvailable;
    data['add_code_to_telephone'] = this.addCodeToTelephone;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    data['options'] = this.options;
    data['is_active'] = this.isActive;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ImagesUnit {
  int? id;
  int? ownerUnitId;
  String? imagePath;
  String? createdAt;
  String? updatedAt;

  ImagesUnit(
      {this.id,
        this.ownerUnitId,
        this.imagePath,
        this.createdAt,
        this.updatedAt});

  ImagesUnit.fromJson(Map<String, dynamic> json) {
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

class VisitsOwner {
  String? message;
  DataVisitsOwner? data;

  VisitsOwner({this.message, this.data});

  VisitsOwner.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new DataVisitsOwner.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataVisitsOwner {
  String? postulantType;
  String? name;
  String? purposeOfVisit;
  int? numberOfIndividuals;
  String? visitTimeFrom;
  String? visitTimeTo;
  String? durationOfVisit;
  bool? pets;
  dynamic? petType;
  bool? entryByVehicle;
  String? vehicleType;
  int? accompanyingIndividuals;
  int? userId;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? qrCodePath;

  DataVisitsOwner(
      {this.postulantType,
        this.name,
        this.purposeOfVisit,
        this.numberOfIndividuals,
        this.visitTimeFrom,
        this.visitTimeTo,
        this.durationOfVisit,
        this.pets,
        this.petType,
        this.entryByVehicle,
        this.vehicleType,
        this.accompanyingIndividuals,
        this.userId,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.qrCodePath});

  DataVisitsOwner.fromJson(Map<String, dynamic> json) {
    postulantType = json['postulant_type'];
    name = json['name'];
    purposeOfVisit = json['purpose_of_visit'];

    numberOfIndividuals = json['number_of_individuals'] is int
        ? json['number_of_individuals']
        : int.tryParse(json['number_of_individuals'].toString()) ?? 0;

    visitTimeFrom = json['visit_time_from'];
    visitTimeTo = json['visit_time_to'];
    durationOfVisit = json['duration_of_visit'];
    pets = json['pets'];
    petType = json['pet_type'];
    entryByVehicle = json['entry_by_vehicle'];
    vehicleType = json['vehicle_type'];
    accompanyingIndividuals = json['accompanying_individuals'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    qrCodePath = json['qr_code_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postulant_type'] = this.postulantType;
    data['name'] = this.name;
    data['purpose_of_visit'] = this.purposeOfVisit;
    data['number_of_individuals'] = this.numberOfIndividuals;
    data['visit_time_from'] = this.visitTimeFrom;
    data['visit_time_to'] = this.visitTimeTo;
    data['duration_of_visit'] = this.durationOfVisit;
    data['pets'] = this.pets;
    data['pet_type'] = this.petType;
    data['entry_by_vehicle'] = this.entryByVehicle;
    data['vehicle_type'] = this.vehicleType;
    data['accompanying_individuals'] = this.accompanyingIndividuals;
    data['user_id'] = this.userId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['qr_code_path'] = this.qrCodePath;
    return data;
  }
}