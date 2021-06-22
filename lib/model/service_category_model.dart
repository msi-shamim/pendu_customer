// To parse this JSON data, do
//
//     final serviceCategory = serviceCategoryFromJson(jsonString);

import 'dart:convert';

ServiceCategory serviceCategoryFromJson(String str) =>
    ServiceCategory.fromJson(json.decode(str));

String serviceCategoryToJson(ServiceCategory data) =>
    json.encode(data.toJson());

class ServiceCategory {
  ServiceCategory({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  List<Datum> data;

  factory ServiceCategory.fromJson(Map<String, dynamic> json) =>
      ServiceCategory(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.title,
    this.slug,
    this.icon,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String title;
  String slug;
  String icon;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        icon: json["icon"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "icon": icon,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
