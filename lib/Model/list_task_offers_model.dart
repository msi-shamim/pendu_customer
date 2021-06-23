

import 'dart:convert';

class GetListTaskOffersModel {
  GetListTaskOffersModel({
    this.id,
    this.amount,
    this.taskId,
    this.dropperId,
    this.status,
    this.acceptedAt,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final String amount;
  final String taskId;
  final String dropperId;
  final String status;
  final dynamic acceptedAt;
  final dynamic createdAt;
  final dynamic updatedAt;

  factory GetListTaskOffersModel.fromJson(String str) => GetListTaskOffersModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetListTaskOffersModel.fromMap(Map<String, dynamic> json) => GetListTaskOffersModel(
    id: json["id"] == null ? null : json["id"],
    amount: json["amount"] == null ? null : json["amount"],
    taskId: json["task_id"] == null ? null : json["task_id"],
    dropperId: json["dropper_id"] == null ? null : json["dropper_id"],
    status: json["status"] == null ? null : json["status"],
    acceptedAt: json["accepted_at"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "amount": amount == null ? null : amount,
    "task_id": taskId == null ? null : taskId,
    "dropper_id": dropperId == null ? null : dropperId,
    "status": status == null ? null : status,
    "accepted_at": acceptedAt,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
