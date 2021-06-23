
import 'dart:convert';

class GetProductCategoryModel {
  GetProductCategoryModel({
    this.status,
    this.message,
    this.data,
  });

  final int status;
  final String message;
  final List<Datum> data;

  factory GetProductCategoryModel.fromJson(String str) => GetProductCategoryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetProductCategoryModel.fromMap(Map<String, dynamic> json) => GetProductCategoryModel(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toMap())),
  };
}

class Datum {
  Datum({
    this.id,
    this.title,
    this.slug,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final String title;
  final String slug;
  final String status;
  final dynamic createdAt;
  final dynamic updatedAt;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    slug: json["slug"] == null ? null : json["slug"],
    status: json["status"] == null ? null : json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "slug": slug == null ? null : slug,
    "status": status == null ? null : status,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
