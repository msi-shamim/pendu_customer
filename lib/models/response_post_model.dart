
import 'dart:convert';

class ResponseBlogPostModel {
  ResponseBlogPostModel({
    this.status,
    this.message,
    this.data,
  });

  final int status;
  final String message;
  final List<Datum> data;

  factory ResponseBlogPostModel.fromJson(String str) => ResponseBlogPostModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseBlogPostModel.fromMap(Map<String, dynamic> json) => ResponseBlogPostModel(
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
    this.serviceCategoryId,
    this.featuredImage,
    this.body,
    this.like,
    this.dislike,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final String title;
  final String serviceCategoryId;
  final String featuredImage;
  final String body;
  final dynamic like;
  final dynamic dislike;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    serviceCategoryId: json["service_category_id"] == null ? null : json["service_category_id"],
    featuredImage: json["featured_image"] == null ? null : json["featured_image"],
    body: json["body"] == null ? null : json["body"],
    like: json["like"],
    dislike: json["dislike"],
    status: json["status"] == null ? null : json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "service_category_id": serviceCategoryId == null ? null : serviceCategoryId,
    "featured_image": featuredImage == null ? null : featuredImage,
    "body": body == null ? null : body,
    "like": like,
    "dislike": dislike,
    "status": status == null ? null : status,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
  };
}
