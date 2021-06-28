// To parse this JSON data, do
//
//     final getServiceCategoryModel = getServiceCategoryModelFromMap(jsonString);

import 'dart:convert';

class ResponseServiceCategoryModel {
  ResponseServiceCategoryModel({
    this.status,
    this.message,
    this.serviceCategoryList,
  });

  final int status;
  final String message;
  final List<ServiceCategoryList> serviceCategoryList;

  factory ResponseServiceCategoryModel.fromJson(String str) => ResponseServiceCategoryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseServiceCategoryModel.fromMap(Map<String, dynamic> json) => ResponseServiceCategoryModel(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    serviceCategoryList: json["data"] == null ? null : List<ServiceCategoryList>.from(json["data"].map((x) => ServiceCategoryList.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": serviceCategoryList == null ? null : List<dynamic>.from(serviceCategoryList.map((x) => x.toMap())),
  };
}

class ServiceCategoryList {
  ServiceCategoryList({
    this.id,
    this.title,
    this.slug,
    this.icon,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final String title;
  final String slug;
  final String icon;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory ServiceCategoryList.fromJson(String str) => ServiceCategoryList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ServiceCategoryList.fromMap(Map<String, dynamic> json) => ServiceCategoryList(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    slug: json["slug"] == null ? null : json["slug"],
    icon: json["icon"] == null ? null : json["icon"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "slug": slug == null ? null : slug,
    "icon": icon == null ? null : icon,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
  };
}
