class RegisterUser {
  String? status;
  String? token;
  UserRegister? user;

  RegisterUser({this.status, this.token, this.user});

  RegisterUser.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    user = json['user'] != null ? new UserRegister.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class UserRegister {
  int? id;
  String? name;
  String? email;
  String? userType;
  String? image;
  dynamic? location;
  String? latitude;
  String? longitude;
  String? qrCodePath;
  String? createdAt;
  String? updatedAt;

  UserRegister(
      {this.id,
        this.name,
        this.email,
        this.userType,
        this.image,
        this.location,
        this.latitude,
        this.longitude,
        this.qrCodePath,
        this.createdAt,
        this.updatedAt});

  UserRegister.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    userType = json['user_type'];
    image = json['image'];
    location = json['location'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    qrCodePath = json['qr_code_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['user_type'] = this.userType;
    data['image'] = this.image;
    data['location'] = this.location;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['qr_code_path'] = this.qrCodePath;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}


class RegisterUserError {
  String? error;
  MessagesUserError? messages;

  RegisterUserError({this.error, this.messages});

  RegisterUserError.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    messages = json['messages'] != null
        ? new MessagesUserError.fromJson(json['messages'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.messages != null) {
      data['messages'] = this.messages!.toJson();
    }
    return data;
  }
}

class MessagesUserError {
  List<String>? userType;

  MessagesUserError({this.userType});

  MessagesUserError.fromJson(Map<String, dynamic> json) {
    userType = json['user_type'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_type'] = this.userType;
    return data;
  }
}

class UserRegistrationResponse {
  final String status;
  final String token;
  final User user;

  UserRegistrationResponse({
    required this.status,
    required this.token,
    required this.user,
  });

  factory UserRegistrationResponse.fromJson(Map<String, dynamic> json) {
    return UserRegistrationResponse(
      status: json['status'],
      token: json['token'],
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'token': token,
      'user': user.toJson(),
    };
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final String userType;
  final String image;
  final String? location;
  final String? latitude;
  final String? longitude;
  final String? companyActivity;
  final String? commercialRecord;
  final String? taxCard;
  final String qrCodePath;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.userType,
    required this.image,
    this.location,
    this.latitude,
    this.longitude,
    this.companyActivity,
    this.commercialRecord,
    this.taxCard,
    required this.qrCodePath,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      userType: json['user_type'],
      image: json['image'],
      location: json['location'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      companyActivity: json['company_activity'],
      commercialRecord: json['commercial_record'],
      taxCard: json['tax_card'],
      qrCodePath: json['qr_code_path'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'user_type': userType,
      'image': image,
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
      'company_activity': companyActivity,
      'commercial_record': commercialRecord,
      'tax_card': taxCard,
      'qr_code_path': qrCodePath,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

class LoginUser {
  String? status;
  String? token;
  UserLogin? user;
  String? qrCodePath;

  LoginUser({this.status, this.token, this.user, this.qrCodePath});

  LoginUser.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    user = json['user'] != null ? new UserLogin.fromJson(json['user']) : null;
    qrCodePath = json['qr_code_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['qr_code_path'] = this.qrCodePath;
    return data;
  }
}

class UserLogin {
  String? name;
  String? image;
  String? email;
  String? userType;
  String? updatedAt;
  String? createdAt;
  int? id;

  UserLogin(
      {this.name,
        this.image,
        this.email,
        this.userType,
        this.updatedAt,
        this.createdAt,
        this.id});

  UserLogin.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    email = json['email'];
    userType = json['user_type'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['email'] = this.email;
    data['user_type'] = this.userType;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}