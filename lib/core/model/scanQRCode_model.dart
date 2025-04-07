class ScanQRCodeModel {
  String? message;
  DataScanQRCodeModel? data;
  List<int>? unitIds;

  ScanQRCodeModel({this.message, this.data, this.unitIds});

  ScanQRCodeModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new DataScanQRCodeModel.fromJson(json['data']) : null;
    unitIds = json['unitIds'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['unitIds'] = this.unitIds;
    return data;
  }
}

class DataScanQRCodeModel {
  int? userId;
  String? name;
  String? purpose;
  int? compoundUserId;

  DataScanQRCodeModel({this.userId, this.name, this.purpose, this.compoundUserId});

  DataScanQRCodeModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    purpose = json['purpose'];
    compoundUserId = json['compound_user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['purpose'] = this.purpose;
    data['compound_user_id'] = this.compoundUserId;
    return data;
  }
}