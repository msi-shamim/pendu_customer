// To parse this JSON data, do
//
//     final responseDriverProfile = responseDriverProfileFromMap(jsonString);

import 'dart:convert';

class ResponseDriverProfile {
  ResponseDriverProfile({
    this.status,
    this.message,
    this.data,
  });

  final int status;
  final String message;
  final Data data;

  factory ResponseDriverProfile.fromJson(String str) => ResponseDriverProfile.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseDriverProfile.fromMap(Map<String, dynamic> json) => ResponseDriverProfile(
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
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.abn,
    this.balance,
    this.vehicleId,
    this.dropperGroupId,
    this.licenseFront,
    this.licenseBack,
    this.profileImage,
    this.rating,
    this.averageAccuracy,
    this.successRate,
    this.createdAt,
    this.updatedAt,
    this.fullName,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String abn;
  final String balance;
  final String vehicleId;
  final String dropperGroupId;
  final dynamic licenseFront;
  final dynamic licenseBack;
  final String profileImage;
  final String rating;
  final String averageAccuracy;
  final String successRate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String fullName;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    id: json["id"] == null ? null : json["id"],
    firstName: json["first_name"] == null ? null : json["first_name"],
    lastName: json["last_name"] == null ? null : json["last_name"],
    email: json["email"] == null ? null : json["email"],
    phone: json["phone"] == null ? null : json["phone"],
    abn: json["abn"] == null ? null : json["abn"],
    balance: json["balance"] == null ? null : json["balance"],
    vehicleId: json["vehicle_id"] == null ? null : json["vehicle_id"],
    dropperGroupId: json["dropper_group_id"] == null ? null : json["dropper_group_id"],
    licenseFront: json["license_front"],
    licenseBack: json["license_back"],
    profileImage: json["profile_image"] == null ? null : json["profile_image"],
    rating: json["rating"] == null ? null : json["rating"],
    averageAccuracy: json["average_accuracy"] == null ? null : json["average_accuracy"],
    successRate: json["success_rate"] == null ? null : json["success_rate"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    fullName: json["full_name"] == null ? null : json["full_name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "first_name": firstName == null ? null : firstName,
    "last_name": lastName == null ? null : lastName,
    "email": email == null ? null : email,
    "phone": phone == null ? null : phone,
    "abn": abn == null ? null : abn,
    "balance": balance == null ? null : balance,
    "vehicle_id": vehicleId == null ? null : vehicleId,
    "dropper_group_id": dropperGroupId == null ? null : dropperGroupId,
    "license_front": licenseFront,
    "license_back": licenseBack,
    "profile_image": profileImage == null ? null : profileImage,
    "rating": rating == null ? null : rating,
    "average_accuracy": averageAccuracy == null ? null : averageAccuracy,
    "success_rate": successRate == null ? null : successRate,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "full_name": fullName == null ? null : fullName,
  };
}
