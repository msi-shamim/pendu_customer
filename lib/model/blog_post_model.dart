import 'dart:convert';

BlogPostModel blogPostModelFromJson(String str) =>
    BlogPostModel.fromJson(json.decode(str));

String blogPostModelToJson(BlogPostModel data) => json.encode(data.toJson());

class BlogPostModel {
  BlogPostModel({
    this.status,
    this.message,
    this.blogPostList,
  });

  int status;
  String message;
  List<BlogPostList> blogPostList;

  factory BlogPostModel.fromJson(Map<String, dynamic> json) => BlogPostModel(
        status: json["status"],
        message: json["message"],
        blogPostList: List<BlogPostList>.from(
            json["data"].map((x) => BlogPostList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(blogPostList.map((x) => x.toJson())),
      };
}

class BlogPostList {
  BlogPostList({
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

  int id;
  String title;
  String serviceCategoryId;
  String featuredImage;
  String body;
  dynamic like;
  dynamic dislike;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory BlogPostList.fromJson(Map<String, dynamic> json) => BlogPostList(
        id: json["id"],
        title: json["title"],
        serviceCategoryId: json["service_category_id"],
        featuredImage: json["featured_image"],
        body: json["body"],
        like: json["like"],
        dislike: json["dislike"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "service_category_id": serviceCategoryId,
        "featured_image": featuredImage,
        "body": body,
        "like": like,
        "dislike": dislike,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
