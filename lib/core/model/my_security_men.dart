class MySecurityMen {
  int? id;
  int? securityManId;
  String? name;
  String? email;

  MySecurityMen({this.id, this.securityManId, this.name, this.email});

  MySecurityMen.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    securityManId = json['security_man_id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['security_man_id'] = this.securityManId;
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}