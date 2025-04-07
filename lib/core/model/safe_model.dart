class SafeModel {
  String? message;
  int? totalIncoming;
  String? totalOutgoing;
  SafeModelData? data;

  SafeModel({this.message, this.totalIncoming, this.totalOutgoing, this.data});

  SafeModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    totalIncoming = json['totalIncoming'] is int
        ? json['totalIncoming']
        : int.tryParse(json['totalIncoming'].toString()) ?? 0;
    totalOutgoing = json['totalOutgoing'] is int
        ? json['totalOutgoing'].toString()
        : json['totalOutgoing'].toString();
    data = json['data'] != null ? new SafeModelData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['totalIncoming'] = this.totalIncoming;
    data['totalOutgoing'] = this.totalOutgoing;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class SafeModelData {
  int? currentPage;
  List<SafeData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  dynamic? nextPageUrl;
  String? path;
  int? perPage;
  dynamic? prevPageUrl;
  int? to;
  int? total;

  SafeModelData(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  SafeModelData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <SafeData>[];
      json['data'].forEach((v) {
        data!.add(new SafeData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class SafeData {
  String? expenseName;
  String? expenseType;
  String? amount;
  String? paymentDate;
  int? unitId;
  String? paymentMethodName;

  SafeData(
      {this.expenseName,
        this.expenseType,
        this.amount,
        this.paymentDate,
        this.unitId,
        this.paymentMethodName});

  SafeData.fromJson(Map<String, dynamic> json) {
    expenseName = json['expense_name'];
    expenseType = json['expense_type'];
    amount = json['amount'];
    paymentDate = json['payment_date'];
    unitId = json['unit_id'];
    paymentMethodName = json['payment_method_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['expense_name'] = this.expenseName;
    data['expense_type'] = this.expenseType;
    data['amount'] = this.amount;
    data['payment_date'] = this.paymentDate;
    data['unit_id'] = this.unitId;
    data['payment_method_name'] = this.paymentMethodName;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}