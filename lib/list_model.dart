// To parse this JSON data, do
//
//     final listsModel = listsModelFromJson(jsonString);

import 'dart:convert';

ListsModel listsModelFromJson(String str) => ListsModel.fromJson(json.decode(str));

String listsModelToJson(ListsModel data) => json.encode(data.toJson());

class ListsModel {
  ListsModel({
    this.data,
  });

  List<Datum> data;

  factory ListsModel.fromJson(Map<String, dynamic> json) => ListsModel(
    data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.title,
    this.id,
  });

  String title;
  List<Id> id;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    title: json["Title"],
    id: List<Id>.from(json["Id"].map((x) => Id.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Title": title,
    "Id": List<dynamic>.from(id.map((x) => x.toJson())),
  };
}

class Id {
  Id({
    this.name,
    this.nameId,
  });

  String name;
  String nameId;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
    name: json["Name"],
    nameId: json["NameID"],
  );

  Map<String, dynamic> toJson() => {
    "Name": name,
    "NameID": nameId,
  };
}
