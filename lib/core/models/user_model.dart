class UserDetailsModel {
  String status;
  UserData data;

  UserDetailsModel({this.status, this.data});

  UserDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class UserData {
  String sId;
  String name;
  String countryCode;
  String phone;
  String email;
  String city;
  String referalCode;
  List<Null> documents;
  String createdAt;
  String updatedAt;

  UserData(
      {this.sId,
      this.name,
      this.countryCode,
      this.phone,
      this.email,
      this.city,
      this.referalCode,
      this.documents,
      this.createdAt,
      this.updatedAt});

  UserData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    countryCode = json['countryCode'];
    phone = json['phone'];
    email = json['email'];
    city = json['city'];
    referalCode = json['referalCode'];
    // if (json['documents'] != null) {
    //   documents = new List<Null>();
    //   json['documents'].forEach((v) {
    //     documents.add(new Null.fromJson(v));
    //   });
    // }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['countryCode'] = this.countryCode;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['city'] = this.city;
    data['referalCode'] = this.referalCode;
    // if (this.documents != null) {
    //   data['documents'] = this.documents.map((v) => v.toJson()).toList();
    // }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }

  @override
  String toString() {
    return 'UserData{sId: $sId, name: $name, countryCode: $countryCode, phone: $phone, email: $email, city: $city, referalCode: $referalCode, documents: $documents, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
