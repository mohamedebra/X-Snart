class PlaceModel {
  int? id;
  String? city;

  PlaceModel({this.id, this.city});

  PlaceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['city'] = city;
    return data;
  }
}
