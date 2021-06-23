
import 'dart:convert';

class GetCouponDataModel {
  GetCouponDataModel({
    this.status,
    this.message,
    this.data,
  });

  final int status;
  final String message;
  final List<Datum> data;

  factory GetCouponDataModel.fromJson(String str) => GetCouponDataModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetCouponDataModel.fromMap(Map<String, dynamic> json) => GetCouponDataModel(
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

  final int id;
  final String title;
  final String promoCode;
  final String details;
  final String discountPercentage;
  final String status;
  final DateTime startedAt;
  final DateTime expiredAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String validRange;
  final String validRangeYear;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    promoCode: json["promo_code"] == null ? null : json["promo_code"],
    details: json["details"] == null ? null : json["details"],
    discountPercentage: json["discount_percentage"] == null ? null : json["discount_percentage"],
    status: json["status"] == null ? null : json["status"],
    startedAt: json["started_at"] == null ? null : DateTime.parse(json["started_at"]),
    expiredAt: json["expired_at"] == null ? null : DateTime.parse(json["expired_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    validRange: json["valid_range"] == null ? null : json["valid_range"],
    validRangeYear: json["valid_range_year"] == null ? null : json["valid_range_year"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "promo_code": promoCode == null ? null : promoCode,
    "details": details == null ? null : details,
    "discount_percentage": discountPercentage == null ? null : discountPercentage,
    "status": status == null ? null : status,
    "started_at": startedAt == null ? null : startedAt.toIso8601String(),
    "expired_at": expiredAt == null ? null : expiredAt.toIso8601String(),
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "valid_range": validRange == null ? null : validRange,
    "valid_range_year": validRangeYear == null ? null : validRangeYear,
  };
}
