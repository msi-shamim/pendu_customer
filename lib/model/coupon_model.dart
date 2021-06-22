// To parse this JSON data, do
//
//     final couponModel = couponModelFromJson(jsonString);

import 'dart:convert';

CouponModel couponModelFromJson(String str) =>
    CouponModel.fromJson(json.decode(str));

String couponModelToJson(CouponModel data) => json.encode(data.toJson());

class CouponModel {
  CouponModel({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  List<Datum> data;

  factory CouponModel.fromJson(Map<String, dynamic> json) => CouponModel(
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
    this.promoCode,
    this.details,
    this.discountPercentage,
    this.status,
    this.startedAt,
    this.expiredAt,
    this.createdAt,
    this.updatedAt,
    this.validRange,
    this.validRangeYear,
  });

  int id;
  String title;
  String promoCode;
  String details;
  String discountPercentage;
  String status;
  DateTime startedAt;
  DateTime expiredAt;
  DateTime createdAt;
  DateTime updatedAt;
  String validRange;
  String validRangeYear;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        promoCode: json["promo_code"],
        details: json["details"],
        discountPercentage: json["discount_percentage"],
        status: json["status"],
        startedAt: DateTime.parse(json["started_at"]),
        expiredAt: DateTime.parse(json["expired_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        validRange: json["valid_range"],
        validRangeYear: json["valid_range_year"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "promo_code": promoCode,
        "details": details,
        "discount_percentage": discountPercentage,
        "status": status,
        "started_at": startedAt.toIso8601String(),
        "expired_at": expiredAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "valid_range": validRange,
        "valid_range_year": validRangeYear,
      };
}
