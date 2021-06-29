// To parse this JSON data, do
//
//     final commonResponse = commonResponseFromMap(jsonString);

import 'dart:convert';

class CommonResponse {
  CommonResponse({
    this.status,
    this.message,
    this.data,
  });

  final int status;
  final String message;
  final List<dynamic> data;

  factory CommonResponse.fromJson(String str) => CommonResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommonResponse.fromMap(Map<String, dynamic> json) => CommonResponse(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : List<dynamic>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x)),
  };
}
