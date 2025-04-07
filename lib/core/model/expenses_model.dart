class ExpensesModel {
  String? catName;
  int? id;
  int? expenseCatId;
  int? userId;
  String? name;
  String? desc;
  String? amount;
  String? fromDate;
  String? toDate;
  dynamic? createdAt;
  dynamic? updatedAt;
  List<ExpenseClaimants>? expenseClaimants;

  ExpensesModel(
      {this.catName,
        this.id,
        this.expenseCatId,
        this.userId,
        this.name,
        this.desc,
        this.amount,
        this.fromDate,
        this.toDate,
        this.createdAt,
        this.updatedAt,
        this.expenseClaimants});

  ExpensesModel.fromJson(Map<String, dynamic> json) {
    catName = json['cat_name'];
    id = json['id'];
    expenseCatId = json['expense_cat_id'];
    userId = json['user_id'];
    name = json['name'];
    desc = json['desc'];
    amount = json['amount'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['expenseClaimants'] != null) {
      expenseClaimants = <ExpenseClaimants>[];
      json['expenseClaimants'].forEach((v) {
        expenseClaimants!.add(new ExpenseClaimants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cat_name'] = this.catName;
    data['id'] = this.id;
    data['expense_cat_id'] = this.expenseCatId;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['amount'] = this.amount;
    data['from_date'] = this.fromDate;
    data['to_date'] = this.toDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.expenseClaimants != null) {
      data['expenseClaimants'] =
          this.expenseClaimants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExpenseClaimants {
  int? expenseClaimantId;
  String? status;
  int? unitId;
  int? ownerId;
  String? ownerName;
  List<RentDetails>? rentDetails;
  List<PaymentTenantDetails>? paymentOwnerDetails;

  ExpenseClaimants(
      {this.expenseClaimantId,
        this.status,
        this.unitId,
        this.ownerId,
        this.ownerName,
        this.rentDetails,
        this.paymentOwnerDetails});

  ExpenseClaimants.fromJson(Map<String, dynamic> json) {
    expenseClaimantId = json['expense_claimant_id'];
    status = json['status'];
    unitId = json['unit_id'];
    ownerId = json['owner_id'];
    ownerName = json['owner_name'];
    if (json['rentDetails'] != null) {
      rentDetails = <RentDetails>[];
      json['rentDetails'].forEach((v) {
        rentDetails!.add(new RentDetails.fromJson(v));
      });
    }
    if (json['paymentOwnerDetails'] != null) {
      paymentOwnerDetails = <PaymentTenantDetails>[];
      json['paymentOwnerDetails'].forEach((v) {
        paymentOwnerDetails!.add(new PaymentTenantDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['expense_claimant_id'] = this.expenseClaimantId;
    data['status'] = this.status;
    data['unit_id'] = this.unitId;
    data['owner_id'] = this.ownerId;
    data['owner_name'] = this.ownerName;
    if (this.rentDetails != null) {
      data['rentDetails'] = this.rentDetails!.map((v) => v.toJson()).toList();
    }
    if (this.paymentOwnerDetails != null) {
      data['paymentOwnerDetails'] =
          this.paymentOwnerDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RentDetails {
  int? tenantId;
  String? tenantName;
  String? fromDate;
  String? toDate;
  List<PaymentTenantDetails>? paymentTenantDetails;

  RentDetails(
      {this.tenantId,
        this.tenantName,
        this.fromDate,
        this.toDate,
        this.paymentTenantDetails});

  RentDetails.fromJson(Map<String, dynamic> json) {
    tenantId = json['tenant_id'];
    tenantName = json['tenant_name'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    if (json['paymentTenantDetails'] != null) {
      paymentTenantDetails = <PaymentTenantDetails>[];
      json['paymentTenantDetails'].forEach((v) {
        paymentTenantDetails!.add(new PaymentTenantDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tenant_id'] = this.tenantId;
    data['tenant_name'] = this.tenantName;
    data['from_date'] = this.fromDate;
    data['to_date'] = this.toDate;
    if (this.paymentTenantDetails != null) {
      data['paymentTenantDetails'] =
          this.paymentTenantDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaymentTenantDetails {
  int? id;
  int? expenseClaimantId;
  int? paidId;
  int? paymentMethodId;
  String? amount;
  String? status;
  dynamic? createdAt;
  dynamic? updatedAt;
  String? paymentMethodName;
  String? paymentMethodNameAr;

  PaymentTenantDetails(
      {this.id,
        this.expenseClaimantId,
        this.paidId,
        this.paymentMethodId,
        this.amount,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.paymentMethodName,
        this.paymentMethodNameAr});

  PaymentTenantDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    expenseClaimantId = json['expense_claimant_id'];
    paidId = json['paid_id'];
    paymentMethodId = json['payment_method_id'];
    amount = json['amount'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    paymentMethodName = json['payment_method_name'];
    paymentMethodNameAr = json['payment_method_name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['expense_claimant_id'] = this.expenseClaimantId;
    data['paid_id'] = this.paidId;
    data['payment_method_id'] = this.paymentMethodId;
    data['amount'] = this.amount;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['payment_method_name'] = this.paymentMethodName;
    data['payment_method_name_ar'] = this.paymentMethodNameAr;
    return data;
  }
}

class PaymentOwnerDetails {
  int? id;
  int? expenseClaimantId;
  int? paidId;
  int? paymentMethodId;
  String? amount;
  String? status;
  dynamic? createdAt;
  dynamic? updatedAt;
  String? paymentMethodName;
  String? paymentMethodNameAr;

  PaymentOwnerDetails(
      {this.id,
        this.expenseClaimantId,
        this.paidId,
        this.paymentMethodId,
        this.amount,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.paymentMethodName,
        this.paymentMethodNameAr});

  PaymentOwnerDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    expenseClaimantId = json['expense_claimant_id'];
    paidId = json['paid_id'];
    paymentMethodId = json['payment_method_id'];
    amount = json['amount'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    paymentMethodName = json['payment_method_name'];
    paymentMethodNameAr = json['payment_method_name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['expense_claimant_id'] = this.expenseClaimantId;
    data['paid_id'] = this.paidId;
    data['payment_method_id'] = this.paymentMethodId;
    data['amount'] = this.amount;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['payment_method_name'] = this.paymentMethodName;
    data['payment_method_name_ar'] = this.paymentMethodNameAr;
    return data;
  }
}