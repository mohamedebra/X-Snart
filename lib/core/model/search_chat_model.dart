// Model for the Participants Data
class ParticipantsData {
  String status;
  List<User> users;

  ParticipantsData({
    required this.status,
    required this.users,
  });

  factory ParticipantsData.fromJson(Map<String, dynamic> json) {
    return ParticipantsData(
      status: json['status'],
      users:
          (json['users'] as List).map((user) => User.fromJson(user)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'users': users.map((user) => user.toJson()).toList(),
    };
  }
}

// Model for User
class User {
  int id;
  String? name;
  String? email;
  String? image;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'image': image,
    };
  }
}

class ChatUser {
  int id;
  int? companyId;
  int participantOneId;
  int participantTwoId;
  DateTime createdAt;
  DateTime updatedAt;

  ChatUser({
    required this.id,
    this.companyId,
    required this.participantOneId,
    required this.participantTwoId,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory method to create Chat from JSON
  factory ChatUser.fromJson(Map<String, dynamic> json) {
    return ChatUser(
      id: json['id'],
      companyId: json['company_id'],
      participantOneId: json['participant_one_id'],
      participantTwoId: json['participant_two_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  // Method to convert Chat to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'company_id': companyId,
      'participant_one_id': participantOneId,
      'participant_two_id': participantTwoId,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
