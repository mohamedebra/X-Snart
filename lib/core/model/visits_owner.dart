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