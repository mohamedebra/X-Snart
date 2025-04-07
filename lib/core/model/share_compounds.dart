class ShareCompounds {
  int? compoundId;
  String? compoundName;
  String? shareLinks;

  ShareCompounds({this.compoundId, this.compoundName, this.shareLinks});

  ShareCompounds.fromJson(Map<String, dynamic> json) {
    compoundId = json['compound_id'];
    compoundName = json['compound_name'];
    shareLinks = json['share_links'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['compound_id'] = this.compoundId;
    data['compound_name'] = this.compoundName;
    data['share_links'] = this.shareLinks;
    return data;
  }
}