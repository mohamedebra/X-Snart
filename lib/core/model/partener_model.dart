class PartenerModel {
  int? id;
  String? companyName;
  String? email;
  String? phone;
  String? address;
  String? website;
  String? image;

  PartenerModel(
      {this.id,
        this.companyName,
        this.email,
        this.phone,
        this.address,
        this.website,
        this.image});

  PartenerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['company_name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    website = json['website'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_name'] = this.companyName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['website'] = this.website;
    data['image'] = this.image;
    return data;
  }
}