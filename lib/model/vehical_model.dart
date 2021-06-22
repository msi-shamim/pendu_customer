import 'dart:convert';

VehicalModel vehicalModelFromJson(String str) =>
    VehicalModel.fromJson(json.decode(str));

String vehicalModelToJson(VehicalModel data) => json.encode(data.toJson());

class VehicalModel {
  VehicalModel({
    this.status,
    this.message,
    this.vehicalModelList,
  });

  int status;
  String message;
  List<VehicalModelList> vehicalModelList;

  factory VehicalModel.fromJson(Map<String, dynamic> json) => VehicalModel(
        status: json["status"],
        message: json["message"],
        vehicalModelList: List<VehicalModelList>.from(
            json["data"].map((x) => VehicalModelList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(vehicalModelList.map((x) => x.toJson())),
      };
}

class VehicalModelList {
  VehicalModelList({
    this.id,
    this.title,
    this.icon,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String title;
  String icon;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory VehicalModelList.fromJson(Map<String, dynamic> json) =>
      VehicalModelList(
        id: json["id"],
        title: json["title"],
        icon: json["icon"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "icon": icon,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
