// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    this.confirmed,
    this.recovered,
    this.critical,
    this.deaths,
    this.lastChange,
    this.lastUpdate,
  });

  int confirmed;
  int recovered;
  int critical;
  int deaths;
  DateTime lastChange;
  DateTime lastUpdate;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    confirmed: json["confirmed"],
    recovered: json["recovered"],
    critical: json["critical"],
    deaths: json["deaths"],
    lastChange: DateTime.parse(json["lastChange"]),
    lastUpdate: DateTime.parse(json["lastUpdate"]),
  );

  Map<String, dynamic> toJson() => {
    "confirmed": confirmed,
    "recovered": recovered,
    "critical": critical,
    "deaths": deaths,
    "lastChange": lastChange.toIso8601String(),
    "lastUpdate": lastUpdate.toIso8601String(),
  };
}
