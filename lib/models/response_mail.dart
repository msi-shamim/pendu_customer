// To parse this JSON data, do
//
//     final responseMailModel = responseMailModelFromMap(jsonString);

import 'dart:convert';

class ResponseMailModel {
  ResponseMailModel({
    this.status,
    this.message,
    this.data,
  });

  final int status;
  final String message;
  final List<dynamic> data;

  factory ResponseMailModel.fromJson(String str) => ResponseMailModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseMailModel.fromMap(Map<String, dynamic> json) => ResponseMailModel(
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
