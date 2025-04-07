class SuggestionsAndComplainsModel {
  String? name;
  String? email;
  String? message;
  String? messageType;
  int? userId;

  SuggestionsAndComplainsModel({this.name, this.email, this.message, this.messageType, this.userId});

  SuggestionsAndComplainsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    message = json['message'];
    messageType = json['message_type'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['message'] = this.message;
    data['message_type'] = this.messageType;
    data['user_id'] = this.userId;
    return data;
  }
}