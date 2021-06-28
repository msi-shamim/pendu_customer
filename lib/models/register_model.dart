

import 'dart:convert';

class PostRegisterUserModel {
  PostRegisterUserModel({
    this.status,
    this.message,
    this.data,
  });

  final int status;
  final String message;
  final Data data;

  factory PostRegisterUserModel.fromJson(String str) => PostRegisterUserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostRegisterUserModel.fromMap(Map<String, dynamic> json) => PostRegisterUserModel(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": data == null ? null : data.toMap(),
  };
}

class Data {
  Data({
    this.name,
    this.email,
    this.phone,
    this.suburb,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.referralLink,
  });

  final String name;
  final String email;
  final String phone;
  final String suburb;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;
  final String referralLink;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    phone: json["phone"] == null ? null : json["phone"],
    suburb: json["suburb"] == null ? null : json["suburb"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    id: json["id"] == null ? null : json["id"],
    referralLink: json["referral_link"] == null ? null : json["referral_link"],
  );

  Map<String, dynamic> toMap() => {
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "phone": phone == null ? null : phone,
    "suburb": suburb == null ? null : suburb,
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "id": id == null ? null : id,
    "referral_link": referralLink == null ? null : referralLink,
  };
}
