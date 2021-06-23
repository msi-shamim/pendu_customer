// To parse this JSON data, do
//
//     final postTaskCollectModel = postTaskCollectModelFromMap(jsonString);

import 'dart:convert';

class PostTaskCollectModel {
  PostTaskCollectModel({
    this.status,
    this.message,
    this.data,
  });

  final int status;
  final String message;
  final Data data;

  factory PostTaskCollectModel.fromJson(String str) => PostTaskCollectModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostTaskCollectModel.fromMap(Map<String, dynamic> json) => PostTaskCollectModel(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": data == null ? null : data.toMap(),
  };
}

class Data {
  Data({
    this.taskId,
    this.title,
    this.from,
    this.fromLat,
    this.fromLng,
    this.to,
    this.toLat,
    this.toLng,
    this.notes,
    this.totalCost,
    this.userId,
    this.deliveryTimeId,
    this.serviceCategoryId,
    this.vehicleId,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.products,
    this.productCategories,
    this.deliveryTime,
    this.vehicle,
  });

  final int taskId;
  final String title;
  final String from;
  final double fromLat;
  final double fromLng;
  final String to;
  final double toLat;
  final double toLng;
  final String notes;
  final dynamic totalCost;
  final int userId;
  final int deliveryTimeId;
  final int serviceCategoryId;
  final int vehicleId;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;
  final List<Product> products;
  final List<ProductCategory> productCategories;
  final DeliveryTime deliveryTime;
  final Vehicle vehicle;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    taskId: json["task_id"] == null ? null : json["task_id"],
    title: json["title"] == null ? null : json["title"],
    from: json["from"] == null ? null : json["from"],
    fromLat: json["from_lat"] == null ? null : json["from_lat"].toDouble(),
    fromLng: json["from_lng"] == null ? null : json["from_lng"].toDouble(),
    to: json["to"] == null ? null : json["to"],
    toLat: json["to_lat"] == null ? null : json["to_lat"].toDouble(),
    toLng: json["to_lng"] == null ? null : json["to_lng"].toDouble(),
    notes: json["notes"] == null ? null : json["notes"],
    totalCost: json["total_cost"],
    userId: json["user_id"] == null ? null : json["user_id"],
    deliveryTimeId: json["delivery_time_id"] == null ? null : json["delivery_time_id"],
    serviceCategoryId: json["service_category_id"] == null ? null : json["service_category_id"],
    vehicleId: json["vehicle_id"] == null ? null : json["vehicle_id"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    id: json["id"] == null ? null : json["id"],
    products: json["products"] == null ? null : List<Product>.from(json["products"].map((x) => Product.fromMap(x))),
    productCategories: json["product_categories"] == null ? null : List<ProductCategory>.from(json["product_categories"].map((x) => ProductCategory.fromMap(x))),
    deliveryTime: json["delivery_time"] == null ? null : DeliveryTime.fromMap(json["delivery_time"]),
    vehicle: json["vehicle"] == null ? null : Vehicle.fromMap(json["vehicle"]),
  );

  Map<String, dynamic> toMap() => {
    "task_id": taskId == null ? null : taskId,
    "title": title == null ? null : title,
    "from": from == null ? null : from,
    "from_lat": fromLat == null ? null : fromLat,
    "from_lng": fromLng == null ? null : fromLng,
    "to": to == null ? null : to,
    "to_lat": toLat == null ? null : toLat,
    "to_lng": toLng == null ? null : toLng,
    "notes": notes == null ? null : notes,
    "total_cost": totalCost,
    "user_id": userId == null ? null : userId,
    "delivery_time_id": deliveryTimeId == null ? null : deliveryTimeId,
    "service_category_id": serviceCategoryId == null ? null : serviceCategoryId,
    "vehicle_id": vehicleId == null ? null : vehicleId,
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "id": id == null ? null : id,
    "products": products == null ? null : List<dynamic>.from(products.map((x) => x.toMap())),
    "product_categories": productCategories == null ? null : List<dynamic>.from(productCategories.map((x) => x.toMap())),
    "delivery_time": deliveryTime == null ? null : deliveryTime.toMap(),
    "vehicle": vehicle == null ? null : vehicle.toMap(),
  };
}

class DeliveryTime {
  DeliveryTime({
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

  factory DeliveryTime.fromJson(String str) => DeliveryTime.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DeliveryTime.fromMap(Map<String, dynamic> json) => DeliveryTime(
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

class ProductCategory {
  ProductCategory({
    this.id,
    this.title,
    this.slug,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  final int id;
  final String title;
  final String slug;
  final String status;
  final dynamic createdAt;
  final dynamic updatedAt;
  final Pivot pivot;

  factory ProductCategory.fromJson(String str) => ProductCategory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductCategory.fromMap(Map<String, dynamic> json) => ProductCategory(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    slug: json["slug"] == null ? null : json["slug"],
    status: json["status"] == null ? null : json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    pivot: json["pivot"] == null ? null : Pivot.fromMap(json["pivot"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "slug": slug == null ? null : slug,
    "status": status == null ? null : status,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "pivot": pivot == null ? null : pivot.toMap(),
  };
}

class Pivot {
  Pivot({
    this.taskId,
    this.productCategoryId,
  });

  final String taskId;
  final String productCategoryId;

  factory Pivot.fromJson(String str) => Pivot.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pivot.fromMap(Map<String, dynamic> json) => Pivot(
    taskId: json["task_id"] == null ? null : json["task_id"],
    productCategoryId: json["product_category_id"] == null ? null : json["product_category_id"],
  );

  Map<String, dynamic> toMap() => {
    "task_id": taskId == null ? null : taskId,
    "product_category_id": productCategoryId == null ? null : productCategoryId,
  };
}

class Product {
  Product({
    this.id,
    this.name,
    this.price,
    this.qty,
    this.taskId,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final String name;
  final String price;
  final String qty;
  final String taskId;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    price: json["price"] == null ? null : json["price"],
    qty: json["qty"] == null ? null : json["qty"],
    taskId: json["task_id"] == null ? null : json["task_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "price": price == null ? null : price,
    "qty": qty == null ? null : qty,
    "task_id": taskId == null ? null : taskId,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
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
