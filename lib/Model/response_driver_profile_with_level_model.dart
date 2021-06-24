// To parse this JSON data, do
//
//     final responseDriverProfileLevel = responseDriverProfileLevelFromMap(jsonString);

import 'dart:convert';

class ResponseDriverProfileLevel {
  ResponseDriverProfileLevel({
    this.status,
    this.message,
    this.data,
  });

  final int status;
  final String message;
  final Data data;

  factory ResponseDriverProfileLevel.fromJson(String str) => ResponseDriverProfileLevel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseDriverProfileLevel.fromMap(Map<String, dynamic> json) => ResponseDriverProfileLevel(
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
    this.level,
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
  final Level level;

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
    level: json["level"] == null ? null : Level.fromMap(json["level"]),
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
    "level": level == null ? null : level.toMap(),
  };
}

class Level {
  Level({
    this.id,
    this.title,
    this.commissionRate,
    this.createdAt,
    this.updatedAt,
    this.perkStatus,
    this.rules,
  });

  final int id;
  final String title;
  final String commissionRate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<dynamic> perkStatus;
  final List<Rule> rules;

  factory Level.fromJson(String str) => Level.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Level.fromMap(Map<String, dynamic> json) => Level(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    commissionRate: json["commission_rate"] == null ? null : json["commission_rate"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    perkStatus: json["perk_status"] == null ? null : List<dynamic>.from(json["perk_status"].map((x) => x)),
    rules: json["rules"] == null ? null : List<Rule>.from(json["rules"].map((x) => Rule.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "commission_rate": commissionRate == null ? null : commissionRate,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "perk_status": perkStatus == null ? null : List<dynamic>.from(perkStatus.map((x) => x)),
    "rules": rules == null ? null : List<dynamic>.from(rules.map((x) => x.toMap())),
  };
}

class Rule {
  Rule({
    this.id,
    this.title,
    this.dropperGroupId,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final String title;
  final String dropperGroupId;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Rule.fromJson(String str) => Rule.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Rule.fromMap(Map<String, dynamic> json) => Rule(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    dropperGroupId: json["dropper_group_id"] == null ? null : json["dropper_group_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "dropper_group_id": dropperGroupId == null ? null : dropperGroupId,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
  };
}
