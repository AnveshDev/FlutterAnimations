// To parse this JSON data, do
//
//     final searchProfilesModel = searchProfilesModelFromJson(jsonString);

import 'dart:convert';

List<SearchProfilesModel> searchProfilesModelFromJson(String str) => List<SearchProfilesModel>.from(json.decode(str).map((x) => SearchProfilesModel.fromJson(x)));

String searchProfilesModelToJson(List<SearchProfilesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchProfilesModel {
  SearchProfilesModel({
    this.userId,
    this.age,
    this.height,
    this.profilePic,
    this.qualiName,
  });

  int userId;
  int age;
  double height;
  String profilePic;
  String qualiName;

  factory SearchProfilesModel.fromJson(Map<String, dynamic> json) => SearchProfilesModel(
    userId: json["user_id"],
    age: json["age"],
    height: json["height"].toDouble(),
    profilePic: json["profile_pic"],
    qualiName: json["quali_name"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "age": age,
    "height": height,
    "profile_pic": profilePic,
    "quali_name": qualiName,
  };
}
