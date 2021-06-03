import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.user,
  });

  String accessToken;
  String tokenType;
  int expiresIn;
  User user;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
        "user": user.toJson(),
      };
}

class User {
  User({
    this.id,
    this.name,
    this.referrerId,
    this.suburb,
    this.phone,
    this.profileImage,
    this.roleId,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.referralLink,
  });

  int id;
  String name;
  dynamic referrerId;
  String suburb;
  String phone;
  dynamic profileImage;
  String roleId;
  String email;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String referralLink;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        referrerId: json["referrer_id"],
        suburb: json["suburb"],
        phone: json["phone"],
        profileImage: json["profile_image"],
        roleId: json["role_id"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        referralLink: json["referral_link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "referrer_id": referrerId,
        "suburb": suburb,
        "phone": phone,
        "profile_image": profileImage,
        "role_id": roleId,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "referral_link": referralLink,
      };
}
