
import 'dart:convert';

class ResponseProductCategoryModel {
  ResponseProductCategoryModel({
    this.status,
    this.message,
    this.productCategoryList,
  });

  final int status;
  final String message;
  final List<ProductCategoryList> productCategoryList;

  factory ResponseProductCategoryModel.fromJson(String str) => ResponseProductCategoryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseProductCategoryModel.fromMap(Map<String, dynamic> json) => ResponseProductCategoryModel(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    productCategoryList: json["data"] == null ? null : List<ProductCategoryList>.from(json["data"].map((x) => ProductCategoryList.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": productCategoryList == null ? null : List<dynamic>.from(productCategoryList.map((x) => x.toMap())),
  };
}

class ProductCategoryList {
  ProductCategoryList({
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

  factory ProductCategoryList.fromJson(String str) => ProductCategoryList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductCategoryList.fromMap(Map<String, dynamic> json) => ProductCategoryList(
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
