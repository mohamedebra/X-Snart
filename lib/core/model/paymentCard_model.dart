// ignore_for_file: file_names, non_constant_identifier_names

class PaymentcardModel {
  int? id;
  int? user_id;
  String? name;
  String? card_number;
  String? card_name;
  String? expiry_date;
  String? security_code;
  String? postal_code;

  PaymentcardModel({
    this.id,
    this.user_id,
    this.name,
    this.card_number,
    this.card_name,
    this.expiry_date,
    this.security_code,
    this.postal_code,
  });

  PaymentcardModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_id = json['user_id'];
    name = json['name'];
    card_name = json['card_name'];
    card_number = json['card_number'];
    expiry_date = json['expiry_date'];
    security_code = json['security_code'];
    postal_code = json['postal_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.user_id;
    data['name'] = this.name;
    data['card_name'] = this.card_name;
    data['card_number'] = this.card_number;
    data['expiry_date'] = this.expiry_date;
    data['security_code'] = this.security_code;
    data['postal_code'] = this.postal_code;
    return data;
  }
}
