

import 'dart:convert';

class ResponseOffersFromDriver {
  ResponseOffersFromDriver({
    this.status,
    this.message,
    this.offersFromDriverList,
  });

  final int status;
  final String message;
  final List<OffersFromDriverList> offersFromDriverList;

  factory ResponseOffersFromDriver.fromJson(String str) => ResponseOffersFromDriver.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseOffersFromDriver.fromMap(Map<String, dynamic> json) => ResponseOffersFromDriver(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    offersFromDriverList: json["data"] == null ? null : List<OffersFromDriverList>.from(json["data"].map((x) => OffersFromDriverList.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": offersFromDriverList == null ? null : List<dynamic>.from(offersFromDriverList.map((x) => x.toMap())),
  };
}

class OffersFromDriverList {
  OffersFromDriverList({
    this.id,
    this.amount,
    this.taskId,
    this.dropperId,
    this.status,
    this.acceptedAt,
    this.createdAt,
    this.updatedAt,
    this.dropper,
  });

  final int id;
  final String amount;
  final String taskId;
  final String dropperId;
  final String status;
  final dynamic acceptedAt;
  final dynamic createdAt;
  final dynamic updatedAt;
  final Dropper dropper;

  factory OffersFromDriverList.fromJson(String str) => OffersFromDriverList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OffersFromDriverList.fromMap(Map<String, dynamic> json) => OffersFromDriverList(
    id: json["id"] == null ? null : json["id"],
    amount: json["amount"] == null ? null : json["amount"],
    taskId: json["task_id"] == null ? null : json["task_id"],
    dropperId: json["dropper_id"] == null ? null : json["dropper_id"],
    status: json["status"] == null ? null : json["status"],
    acceptedAt: json["accepted_at"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    dropper: json["dropper"] == null ? null : Dropper.fromMap(json["dropper"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "amount": amount == null ? null : amount,
    "task_id": taskId == null ? null : taskId,
    "dropper_id": dropperId == null ? null : dropperId,
    "status": status == null ? null : status,
    "accepted_at": acceptedAt,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "dropper": dropper == null ? null : dropper.toMap(),
  };
}

class Dropper {
  Dropper({
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
    this.vehicle,
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
  final Vehicle vehicle;

  factory Dropper.fromJson(String str) => Dropper.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Dropper.fromMap(Map<String, dynamic> json) => Dropper(
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
    vehicle: json["vehicle"] == null ? null : Vehicle.fromMap(json["vehicle"]),
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
    "vehicle": vehicle == null ? null : vehicle.toMap(),
  };
}

class Vehicle {
  Vehicle({
    this.id,
    this.title,
    this.icon,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final String title;
  final String icon;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Vehicle.fromJson(String str) => Vehicle.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Vehicle.fromMap(Map<String, dynamic> json) => Vehicle(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    icon: json["icon"] == null ? null : json["icon"],
    status: json["status"] == null ? null : json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "icon": icon == null ? null : icon,
    "status": status == null ? null : status,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
  };
}
