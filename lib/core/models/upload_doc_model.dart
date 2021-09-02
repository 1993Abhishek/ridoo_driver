// class UploadDocumentModel {
//   String status;
//   // Data data;
//
//   UploadDocumentModel({this.status, this.data});
//
//   UploadDocumentModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.data != null) {
//       data['data'] = this.data.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   List<Null> cars;
//   String sId;
//   String name;
//   String countryCode;
//   String phone;
//   String email;
//   String city;
//   String referalCode;
//   List<Documents> documents;
//   String createdAt;
//   String updatedAt;
//
//   Data(
//       {this.cars,
//       this.sId,
//       this.name,
//       this.countryCode,
//       this.phone,
//       this.email,
//       this.city,
//       this.referalCode,
//       this.documents,
//       this.createdAt,
//       this.updatedAt});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     if (json['cars'] != null) {
//       cars = new List<Null>();
//       json['cars'].forEach((v) {
//         cars.add(new Null.fromJson(v));
//       });
//     }
//     sId = json['_id'];
//     name = json['name'];
//     countryCode = json['countryCode'];
//     phone = json['phone'];
//     email = json['email'];
//     city = json['city'];
//     referalCode = json['referalCode'];
//     if (json['documents'] != null) {
//       documents = new List<Documents>();
//       json['documents'].forEach((v) {
//         documents.add(new Documents.fromJson(v));
//       });
//     }
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.cars != null) {
//       data['cars'] = this.cars.map((v) => v.toJson()).toList();
//     }
//     data['_id'] = this.sId;
//     data['name'] = this.name;
//     data['countryCode'] = this.countryCode;
//     data['phone'] = this.phone;
//     data['email'] = this.email;
//     data['city'] = this.city;
//     data['referalCode'] = this.referalCode;
//     if (this.documents != null) {
//       data['documents'] = this.documents.map((v) => v.toJson()).toList();
//     }
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     return data;
//   }
// }

class DocumentsData {
  String verifyStatus;
  String sId;
  String name;
  String filename;
  String createdAt;
  String updatedAt;

  DocumentsData(
      {this.verifyStatus,
      this.sId,
      this.name,
      this.filename,
      this.createdAt,
      this.updatedAt});

  DocumentsData.fromJson(Map<String, dynamic> json) {
    verifyStatus = json['verifyStatus'];
    sId = json['_id'];
    name = json['name'];
    filename = json['filename'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['verifyStatus'] = this.verifyStatus;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['filename'] = this.filename;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
