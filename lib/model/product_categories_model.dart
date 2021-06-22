import 'dart:convert';

ProductCategoriesModel productCategoriesModelFromJson(String str) =>
    ProductCategoriesModel.fromJson(json.decode(str));

String productCategoriesModelToJson(ProductCategoriesModel data) =>
    json.encode(data.toJson());

class ProductCategoriesModel {
  ProductCategoriesModel({
    this.status,
    this.message,
    this.productCategoriesList,
  });

  int status;
  String message;
  List<ProductCategoriesList> productCategoriesList;

  factory ProductCategoriesModel.fromJson(Map<String, dynamic> json) =>
      ProductCategoriesModel(
        status: json["status"],
        message: json["message"],
        productCategoriesList: List<ProductCategoriesList>.from(
            json["data"].map((x) => ProductCategoriesList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data":
            List<dynamic>.from(productCategoriesList.map((x) => x.toJson())),
      };
}

class ProductCategoriesList {
  ProductCategoriesList({
    this.id,
    this.title,
    this.slug,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String title;
  String slug;
  int status;
  dynamic createdAt;
  dynamic updatedAt;

  factory ProductCategoriesList.fromJson(Map<String, dynamic> json) =>
      ProductCategoriesList(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
