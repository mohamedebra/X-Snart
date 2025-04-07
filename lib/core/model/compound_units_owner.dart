class CompoundUnitsOwner {
  int? id;
  String? name;
  String? email;
  int? unitId;
  dynamic? unitName;
  String? contactNumber;
  dynamic? propertyNumber;
  dynamic? propertyHistory;
  dynamic? apartmentNumber;

  CompoundUnitsOwner(
      {this.id,
        this.name,
        this.email,
        this.unitId,
        this.unitName,
        this.contactNumber,
        this.propertyNumber,
        this.propertyHistory,
        this.apartmentNumber});

  CompoundUnitsOwner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    unitId = json['unit_id'];
    unitName = json['unit_name'];
    contactNumber = json['contact_number'];
    propertyNumber = json['property_number'];
    propertyHistory = json['property_history'];
    apartmentNumber = json['apartment_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['unit_id'] = this.unitId;
    data['unit_name'] = this.unitName;
    data['contact_number'] = this.contactNumber;
    data['property_number'] = this.propertyNumber;
    data['property_history'] = this.propertyHistory;
    data['apartment_number'] = this.apartmentNumber;
    return data;
  }
}