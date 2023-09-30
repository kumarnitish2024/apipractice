// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

import 'dart:convert';

List<UserDataModel> userDataModelFromJson(String str) =>
    List<UserDataModel>.from(
        json.decode(str).map((x) => UserDataModel.fromJson(x)));

Map<String, dynamic> userDataModelToJson(UserDataModel data) => data.toJson();

class UserDataModel {
  int? id;
  String? name;
  String? email;
  String? gender;
  String? status;

  UserDataModel({
    this.id,
    this.name,
    this.email,
    this.gender,
    this.status,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        gender: json["gender"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "gender": gender,
        "status": status,
      };
}
