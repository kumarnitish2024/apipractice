// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

import 'dart:convert';

UserDataModel userDataModelFromJson(String str) => UserDataModel.fromJson(json.decode(str));

String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
  String? id;
  String? name;
  String? address;
  String? emailId;
  String? phoneNo;
  String? image;

  UserDataModel({
    this.id,
    this.name,
    this.address,
    this.emailId,
    this.phoneNo,
    this.image,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
    id: json["Id"],
    name: json["Name"],
    address: json["Address"],
    emailId: json["Email Id"],
    phoneNo: json["PhoneNo"],
    image: json["Image"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "Address": address,
    "Email Id": emailId,
    "PhoneNo": phoneNo,
    "Image": image,
  };
}
