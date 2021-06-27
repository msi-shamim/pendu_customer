// To parse this JSON data, do
//
//     final responseDeliveryTime = responseDeliveryTimeFromMap(jsonString);

import 'dart:convert';

class ResponseDeliveryTime {
  ResponseDeliveryTime({
    this.status,
    this.message,
    this.deliveryTimeList,
  });

  final int status;
  final String message;
  final List<DeliveryTimeList> deliveryTimeList;

  factory ResponseDeliveryTime.fromJson(String str) => ResponseDeliveryTime.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseDeliveryTime.fromMap(Map<String, dynamic> json) => ResponseDeliveryTime(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    deliveryTimeList: json["data"] == null ? null : List<DeliveryTimeList>.from(json["data"].map((x) => DeliveryTimeList.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": deliveryTimeList == null ? null : List<dynamic>.from(deliveryTimeList.map((x) => x.toMap())),
  };
}

class DeliveryTimeList {
  DeliveryTimeList({
    this.id,
    this.title,
    this.slug,
    this.icon,
    this.time,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final String title;
  final String slug;
  final String icon;
  final DateTime time;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory DeliveryTimeList.fromJson(String str) => DeliveryTimeList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DeliveryTimeList.fromMap(Map<String, dynamic> json) => DeliveryTimeList(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    slug: json["slug"] == null ? null : json["slug"],
    icon: json["icon"] == null ? null : json["icon"],
    time: json["time"] == null ? null : DateTime.parse(json["time"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "slug": slug == null ? null : slug,
    "icon": icon == null ? null : icon,
    "time": time == null ? null : time.toIso8601String(),
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
  };
}
