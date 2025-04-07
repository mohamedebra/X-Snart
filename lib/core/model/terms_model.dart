class TermsModel {
  String? body;

  TermsModel({this.body});

  TermsModel.fromJson(Map<String, dynamic> json) {
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['body'] = body;
    return data;
  }
}
