class RegisterInfoModel {
    String? branch;
    String? password;
  RegisterInfoModel({this.branch, this.password});

  RegisterInfoModel.fromJson(Map<String, dynamic> data, [String? id]) {
      branch = data['branch'];
      password = data['password'];
      
    
  }

  Map<String, dynamic> toJson() {
    return {'branch': branch, 'password': password};
  }
}