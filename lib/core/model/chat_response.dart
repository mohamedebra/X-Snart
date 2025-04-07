
class ChatResponse {
  String status;
  List<Chat> chats;

  ChatResponse({
    required this.status,
    required this.chats,
  });

  // Factory method to create a ChatResponse from JSON
  factory ChatResponse.fromJson(Map<String, dynamic> json) {
    return ChatResponse(
      status: json['status'],
      chats: List<Chat>.from(json['chats'].map((chat) => Chat.fromJson(chat))),
    );
  }

  // Method to convert ChatResponse to JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'chats': chats.map((chat) => chat.toJson()).toList(),
    };
  }
}

class Chat {
  int chatId;
  Receiver receiver;
  int unreadMessagesCount;
  LastMessage? lastMessage;
  DateTime createdAt;
  DateTime updatedAt;

  Chat({
    required this.chatId,
    required this.receiver,
    required this.unreadMessagesCount,
    this.lastMessage,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory method to create a Chat from JSON
  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      chatId: json['chat_id'],
      receiver: Receiver.fromJson(json['receiver']),
      unreadMessagesCount: json['unread_messages_count'],
      lastMessage: json['last_message'] != null
          ? LastMessage.fromJson(json['last_message'])
          : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  // Method to convert Chat to JSON
  Map<String, dynamic> toJson() {
    return {
      'chat_id': chatId,
      'receiver': receiver.toJson(),
      'unread_messages_count': unreadMessagesCount,
      'last_message': lastMessage?.toJson(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

class Receiver {
  int id;
  String name;
  String image;

  Receiver({
    required this.id,
    required this.name,
    required this.image,
  });

  // Factory method to create a Receiver from JSON
  factory Receiver.fromJson(Map<String, dynamic> json) {
    return Receiver(
      id: json['id'],
      name: json['name'] ?? '',
      image: json['image'] ?? '',
    );
  }

  // Method to convert Receiver to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }
}

class LastMessage {
  int id;
  String message;
  int senderId;
  bool isRead;
  String createdAt;

  LastMessage({
    required this.id,
    required this.message,
    required this.senderId,
    required this.isRead,
    required this.createdAt,
  });

  // Factory method to create LastMessage from JSON
  factory LastMessage.fromJson(Map<String, dynamic> json) {
    return LastMessage(
      id: json['id'],
      message: json['message'],
      senderId: json['sender_id'],
      isRead: json['is_read'],
      createdAt: json['created_at'],
    );
  }

  // Method to convert LastMessage to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'message': message,
      'sender_id': senderId,
      'is_read': isRead,
      'created_at': createdAt,
    };
  }
}
