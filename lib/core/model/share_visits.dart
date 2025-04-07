class ShareVisits {
  String? message;
  String? qrCodeUrl;
  String? shareLink;

  ShareVisits({this.message, this.qrCodeUrl, this.shareLink});

  ShareVisits.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    qrCodeUrl = json['qr_code_url'];
    shareLink = json['share_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['qr_code_url'] = this.qrCodeUrl;
    data['share_link'] = this.shareLink;
    return data;
  }
}