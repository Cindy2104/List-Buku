// To parse this JSON data, do
//
//     final modelList = modelListFromJson(jsonString);

import 'dart:convert';

ModelList modelListFromJson(String str) => ModelList.fromJson(json.decode(str));

String modelListToJson(ModelList data) => json.encode(data.toJson());

class ModelList {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<DataUser>? data;
  Support? support;

  ModelList({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });

  factory ModelList.fromJson(Map<String, dynamic> json) => ModelList(
    page: json["page"],
    perPage: json["per_page"],
    total: json["total"],
    totalPages: json["total_pages"],
    data: json["data"] == null ? [] : List<DataUser>.from(json["data"]!.map((x) => DataUser.fromJson(x))),
    support: json["support"] == null ? null : Support.fromJson(json["support"]),
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "per_page": perPage,
    "total": total,
    "total_pages": totalPages,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "support": support?.toJson(),
  };
}

class DataUser {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  DataUser({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
    id: json["id"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "avatar": avatar,
  };
}

class Support {
  String? url;
  String? text;

  Support({
    this.url,
    this.text,
  });

  factory Support.fromJson(Map<String, dynamic> json) => Support(
    url: json["url"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "text": text,
  };
}
