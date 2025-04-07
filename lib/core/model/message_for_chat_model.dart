
class MessageForChat {
  int id;
  int chatId;
  int senderId;
  int receiverId;
  String message;
  bool isRead;
  bool isSent;
  String createdAt;
  String updatedAt;
  String senderName;
  String senderImage;

  MessageForChat({
    required this.id,
    required this.chatId,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.isRead,
    required this.isSent,
    required this.createdAt,
    required this.updatedAt,
    required this.senderName,
    required this.senderImage,
  });

  factory MessageForChat.fromJson(Map<String, dynamic> json) {
    return MessageForChat(
      id: json['id'],
      chatId: json['chat_id'],
      senderId: json['sender_id'],
      receiverId: json['receiver_id'],
      message: json['message'],
      isRead: json['is_read'],
      isSent: json['is_sent'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      senderName: json['sender_name'],
      senderImage: json['sender_image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'chat_id': chatId,
      'sender_id': senderId,
      'receiver_id': receiverId,
      'message': message,
      'is_read': isRead,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'sender_name': senderName,
      'sender_image': senderImage,
    };
  }
}
