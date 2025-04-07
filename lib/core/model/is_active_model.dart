class IsActiveModel {
  String? message;
  bool? isActive;

  IsActiveModel({this.message, this.isActive});

  IsActiveModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['is_active'] = this.isActive;
    return data;
  }
}