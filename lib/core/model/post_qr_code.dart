
class PostQrCode {
  int? id;
  int? userId;
  String? postulantType;
  String? name;
  String? purposeOfVisit;
  int? numberOfIndividuals;
  String? visitTimeFrom;
  String? visitTimeTo;
  String? durationOfVisit;
  int? pets;
  Null? petType;
  int? entryByVehicle;
  String? vehicleType;
  int? accompanyingIndividuals;
  String? qrCodePath;
  String? createdAt;
  String? updatedAt;

  PostQrCode(
      {this.id,
        this.userId,
        this.postulantType,
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
        this.qrCodePath,
        this.createdAt,
        this.updatedAt});

  PostQrCode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    postulantType = json['postulant_type'];
    name = json['name'];
    purposeOfVisit = json['purpose_of_visit'];
    numberOfIndividuals = json['number_of_individuals'];
    visitTimeFrom = json['visit_time_from'];
    visitTimeTo = json['visit_time_to'];
    durationOfVisit = json['duration_of_visit'];
    pets = json['pets'];
    petType = json['pet_type'];
    entryByVehicle = json['entry_by_vehicle'];
    vehicleType = json['vehicle_type'];
    accompanyingIndividuals = json['accompanying_individuals'];
    qrCodePath = json['qr_code_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
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
    data['qr_code_path'] = this.qrCodePath;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}