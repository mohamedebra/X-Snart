// ignore_for_file: non_constant_identifier_names

class PhoneModel {
  int? phoneId;
  String? phone;
  int? client_Id_fk;

  PhoneModel({this.phoneId, this.phone});

  PhoneModel.fromJson(Map<String, dynamic> json) {
    phoneId = json['phoneId'];
    phone = json['phone'];
    client_Id_fk = json['client_Id_fk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['phoneId'] = phoneId;
    data['phone'] = phone;
    data['client_Id_fk'] = client_Id_fk;
    return data;
  }
}
