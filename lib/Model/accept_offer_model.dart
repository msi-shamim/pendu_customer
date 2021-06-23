// To parse this JSON data, do
//
//     final getAcceptOfferModel = getAcceptOfferModelFromMap(jsonString);

import 'dart:convert';

class GetAcceptOfferModel {
  GetAcceptOfferModel({
    this.status,
    this.message,
    this.data,
  });

  final int status;
  final String message;
  final Data data;

  factory GetAcceptOfferModel.fromJson(String str) => GetAcceptOfferModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetAcceptOfferModel.fromMap(Map<String, dynamic> json) => GetAcceptOfferModel(
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
    this.id,
    this.taskId,
    this.title,
    this.image,
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
    this.quoteDropperId,
    this.offerId,
    this.taskType,
    this.requestStatus,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final String taskId;
  final String title;
  final dynamic image;
  final String from;
  final String fromLat;
  final String fromLng;
  final String to;
  final String toLat;
  final String toLng;
  final String notes;
  final String totalCost;
  final String userId;
  final String deliveryTimeId;
  final String serviceCategoryId;
  final dynamic vehicleId;
  final dynamic quoteDropperId;
  final dynamic offerId;
  final String taskType;
  final String requestStatus;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    id: json["id"] == null ? null : json["id"],
    taskId: json["task_id"] == null ? null : json["task_id"],
    title: json["title"] == null ? null : json["title"],
    image: json["image"],
    from: json["from"] == null ? null : json["from"],
    fromLat: json["from_lat"] == null ? null : json["from_lat"],
    fromLng: json["from_lng"] == null ? null : json["from_lng"],
    to: json["to"] == null ? null : json["to"],
    toLat: json["to_lat"] == null ? null : json["to_lat"],
    toLng: json["to_lng"] == null ? null : json["to_lng"],
    notes: json["notes"] == null ? null : json["notes"],
    totalCost: json["total_cost"] == null ? null : json["total_cost"],
    userId: json["user_id"] == null ? null : json["user_id"],
    deliveryTimeId: json["delivery_time_id"] == null ? null : json["delivery_time_id"],
    serviceCategoryId: json["service_category_id"] == null ? null : json["service_category_id"],
    vehicleId: json["vehicle_id"],
    quoteDropperId: json["quote_dropper_id"],
    offerId: json["offer_id"],
    taskType: json["task_type"] == null ? null : json["task_type"],
    requestStatus: json["request_status"] == null ? null : json["request_status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "task_id": taskId == null ? null : taskId,
    "title": title == null ? null : title,
    "image": image,
    "from": from == null ? null : from,
    "from_lat": fromLat == null ? null : fromLat,
    "from_lng": fromLng == null ? null : fromLng,
    "to": to == null ? null : to,
    "to_lat": toLat == null ? null : toLat,
    "to_lng": toLng == null ? null : toLng,
    "notes": notes == null ? null : notes,
    "total_cost": totalCost == null ? null : totalCost,
    "user_id": userId == null ? null : userId,
    "delivery_time_id": deliveryTimeId == null ? null : deliveryTimeId,
    "service_category_id": serviceCategoryId == null ? null : serviceCategoryId,
    "vehicle_id": vehicleId,
    "quote_dropper_id": quoteDropperId,
    "offer_id": offerId,
    "task_type": taskType == null ? null : taskType,
    "request_status": requestStatus == null ? null : requestStatus,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
  };
}
