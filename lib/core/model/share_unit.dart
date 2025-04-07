class ShareUnit {
  int? unitId;
  String? shareLinks;

  ShareUnit({this.unitId, this.shareLinks});

  ShareUnit.fromJson(Map<String, dynamic> json) {
    unitId = json['unit_id'];
    shareLinks = json['share_links'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unit_id'] = this.unitId;
    data['share_links'] = this.shareLinks;
    return data;
  }
}