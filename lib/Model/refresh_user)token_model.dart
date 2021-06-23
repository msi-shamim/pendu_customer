// To parse this JSON data, do
//
//     final getRefreshUserTokenModel = getRefreshUserTokenModelFromMap(jsonString);

import 'dart:convert';

class GetRefreshUserTokenModel {
  GetRefreshUserTokenModel({
    this.status,
    this.message,
    this.data,
  });

  final int status;
  final String message;
  final Data data;

  factory GetRefreshUserTokenModel.fromJson(String str) => GetRefreshUserTokenModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetRefreshUserTokenModel.fromMap(Map<String, dynamic> json) => GetRefreshUserTokenModel(
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
    this.id,
    this.name,
    this.balance,
    this.suburb,
    this.phone,
    this.profilePhoto,
    this.roleId,
    this.email,
    this.phoneVerifiedAt,
    this.emailVerifiedAt,
    this.referralId,
    this.createdAt,
    this.updatedAt,
    this.referralLink,
  });

  final int id;
  final String name;
  final String balance;
  final String suburb;
  final String phone;
  final String profilePhoto;
  final String roleId;
  final String email;
  final DateTime phoneVerifiedAt;
  final dynamic emailVerifiedAt;
  final dynamic referralId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String referralLink;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    balance: json["balance"] == null ? null : json["balance"],
    suburb: json["suburb"] == null ? null : json["suburb"],
    phone: json["phone"] == null ? null : json["phone"],
    profilePhoto: json["profile_photo"] == null ? null : json["profile_photo"],
    roleId: json["role_id"] == null ? null : json["role_id"],
    email: json["email"] == null ? null : json["email"],
    phoneVerifiedAt: json["phone_verified_at"] == null ? null : DateTime.parse(json["phone_verified_at"]),
    emailVerifiedAt: json["email_verified_at"],
    referralId: json["referral_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    referralLink: json["referral_link"] == null ? null : json["referral_link"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "balance": balance == null ? null : balance,
    "suburb": suburb == null ? null : suburb,
    "phone": phone == null ? null : phone,
    "profile_photo": profilePhoto == null ? null : profilePhoto,
    "role_id": roleId == null ? null : roleId,
    "email": email == null ? null : email,
    "phone_verified_at": phoneVerifiedAt == null ? null : phoneVerifiedAt.toIso8601String(),
    "email_verified_at": emailVerifiedAt,
    "referral_id": referralId,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "referral_link": referralLink == null ? null : referralLink,
  };
}
