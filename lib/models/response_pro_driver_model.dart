// To parse this JSON data, do
//
//     final responseProDriverModel = responseProDriverModelFromMap(jsonString);

import 'dart:convert';

class ResponseProDriverModel {
  ResponseProDriverModel({
    this.status,
    this.message,
    this.proDriverList,
  });

  final int status;
  final String message;
  final List<ProDriverList> proDriverList;

  factory ResponseProDriverModel.fromJson(String str) => ResponseProDriverModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseProDriverModel.fromMap(Map<String, dynamic> json) => ResponseProDriverModel(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    proDriverList: json["data"] == null ? null : List<ProDriverList>.from(json["data"].map((x) => ProDriverList.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": proDriverList == null ? null : List<dynamic>.from(proDriverList.map((x) => x.toMap())),
  };
}

class ProDriverList {
  ProDriverList({
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
    this.services,
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
  final List<Service> services;

  factory ProDriverList.fromJson(String str) => ProDriverList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProDriverList.fromMap(Map<String, dynamic> json) => ProDriverList(
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
    services: json["services"] == null ? null : List<Service>.from(json["services"].map((x) => Service.fromMap(x))),
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
    "services": services == null ? null : List<dynamic>.from(services.map((x) => x.toMap())),
  };
}

class Service {
  Service({
    this.id,
    this.title,
    this.slug,
    this.serviceIcon,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  final int id;
  final Title title;
  final Slug slug;
  final Icon serviceIcon;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Pivot pivot;

  factory Service.fromJson(String str) => Service.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Service.fromMap(Map<String, dynamic> json) => Service(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : titleValues.map[json["title"]],
    slug: json["slug"] == null ? null : slugValues.map[json["slug"]],
    serviceIcon: json["icon"] == null ? null : iconValues.map[json["icon"]],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    pivot: json["pivot"] == null ? null : Pivot.fromMap(json["pivot"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "title": title == null ? null : titleValues.reverse[title],
    "slug": slug == null ? null : slugValues.reverse[slug],
    "icon": serviceIcon == null ? null : iconValues.reverse[serviceIcon],
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "pivot": pivot == null ? null : pivot.toMap(),
  };
}

enum Icon { PUBLIC_FRONTEND_IMAGES_SERVICE_COLLECT_PNG, PUBLIC_FRONTEND_IMAGES_SERVICE_MOVER_PNG, PUBLIC_FRONTEND_IMAGES_SERVICE_SHOP_PNG }

final iconValues = EnumValues({
  "/public/frontend/images/service/collect.png": Icon.PUBLIC_FRONTEND_IMAGES_SERVICE_COLLECT_PNG,
  "/public/frontend/images/service/mover.png": Icon.PUBLIC_FRONTEND_IMAGES_SERVICE_MOVER_PNG,
  "/public/frontend/images/service/shop.png": Icon.PUBLIC_FRONTEND_IMAGES_SERVICE_SHOP_PNG
});

class Pivot {
  Pivot({
    this.dropperId,
    this.serviceCategoryId,
  });

  final String dropperId;
  final String serviceCategoryId;

  factory Pivot.fromJson(String str) => Pivot.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pivot.fromMap(Map<String, dynamic> json) => Pivot(
    dropperId: json["dropper_id"] == null ? null : json["dropper_id"],
    serviceCategoryId: json["service_category_id"] == null ? null : json["service_category_id"],
  );

  Map<String, dynamic> toMap() => {
    "dropper_id": dropperId == null ? null : dropperId,
    "service_category_id": serviceCategoryId == null ? null : serviceCategoryId,
  };
}

enum Slug { COLLECT_AND_DROP, MOVER, SHOP_AND_DROP }

final slugValues = EnumValues({
  "collect-and-drop": Slug.COLLECT_AND_DROP,
  "mover": Slug.MOVER,
  "shop-and-drop": Slug.SHOP_AND_DROP
});

enum Title { COLLECT_AND_DROP, MOVER, SHOP_AND_DROP }

final titleValues = EnumValues({
  "Collect and drop": Title.COLLECT_AND_DROP,
  "Mover": Title.MOVER,
  "Shop and drop": Title.SHOP_AND_DROP
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
