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
    this.password,
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
  String email;
  dynamic referrerId;
  String suburb;
  String phone;
  String password;
  dynamic profileImage;
  String roleId;
  dynamic emailVerifiedAt;
  dynamic createdAt;
  dynamic updatedAt;
  String referralLink;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        referrerId: json["referrer_id"],
        suburb: json["suburb"],
        phone: json["phone"],
        password: json["password"],
        profileImage: json["profile_image"],
        roleId: json["role_id"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        referralLink: json["referral_link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "referrer_id": referrerId,
        "suburb": suburb,
        "phone": phone,
        "password": password,
        "profile_image": profileImage,
        "role_id": roleId,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt(),
        "updated_at": updatedAt(),
        "referral_link": referralLink,
      };
}
