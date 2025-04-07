// ignore_for_file: non_constant_identifier_names

class MenuQrModel {
  String? message;
  String? qr_code_url;

  MenuQrModel({this.message, this.qr_code_url});

  MenuQrModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    qr_code_url = json['qr_code_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['qr_code_url'] = this.qr_code_url;
    return data;
  }
}
