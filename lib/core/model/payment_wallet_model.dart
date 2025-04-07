// ignore_for_file: file_names, non_constant_identifier_names

class PaymentWalletModel {
  int? id;
  int? user_id;
  String? phone;
  String? password;

  PaymentWalletModel({
    this.id,
    this.user_id,
    this.phone,
    this.password,
  });

  PaymentWalletModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_id = json['user_id'];
    phone = json['phone'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.user_id;
    data['phone'] = this.phone;
    data['password'] = this.password;

    return data;
  }
}
