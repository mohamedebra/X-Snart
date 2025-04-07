
class NotificationsModel {
  String? id;
  String? type;
  String? notifiableType;
  int? notifiableId;
  NotificationsData? data;
  dynamic? readAt;
  String? createdAt;
  String? updatedAt;

  NotificationsModel(
      {this.id,
        this.type,
        this.notifiableType,
        this.notifiableId,
        this.data,
        this.readAt,
        this.createdAt,
        this.updatedAt});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    notifiableType = json['notifiable_type'];
    notifiableId = json['notifiable_id'];
    data = json['data'] != null ? new NotificationsData.fromJson(json['data']) : null;
    readAt = json['read_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['notifiable_type'] = this.notifiableType;
    data['notifiable_id'] = this.notifiableId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['read_at'] = this.readAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class NotificationsData {
  String? title;
  String? titleAr;
  String? body;
  String? bodyAr;
  int? instanceId;
  int? senderId;
  String? senderName;
  String? senderImage;

  NotificationsData(
      {this.title,
        this.titleAr,
        this.body,
        this.bodyAr,
        this.instanceId,
        this.senderId,
        this.senderName,
        this.senderImage});

  NotificationsData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    titleAr = json['title_ar'];
    body = json['body'];
    bodyAr = json['body_ar'];
    instanceId = json['instance_id'];
    senderId = json['sender_id'];
    senderName = json['sender_name'];
    senderImage = json['sender_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['title_ar'] = this.titleAr;
    data['body'] = this.body;
    data['body_ar'] = this.bodyAr;
    data['instance_id'] = this.instanceId;
    data['sender_id'] = this.senderId;
    data['sender_name'] = this.senderName;
    data['sender_image'] = this.senderImage;
    return data;
  }
}