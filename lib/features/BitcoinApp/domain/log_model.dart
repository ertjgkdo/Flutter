// To parse this JSON data, do
//
//     final logModel = logModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

List<LogModel> logModelFromJson(String str) =>
    List<LogModel>.from(json.decode(str).map((x) => LogModel.fromJson(x)));

String logModelToJson(List<LogModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LogModel extends Equatable {
  final String? title;
  final String? description;
  final String? id;
  final DateTime? date;

  const LogModel({
    this.title,
    this.description,
    this.id,
    this.date,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [title, description, date];

  LogModel copyWith({
    String? title,
    String? description,
    String? id,
    DateTime? date,
  }) =>
      LogModel(
        title: title ?? this.title,
        description: description ?? this.description,
        id: id ?? this.id,
        date: date ?? this.date,
      );

  factory LogModel.fromJson(Map<String, dynamic> json) => LogModel(
        title: json["title"],
        description: json["description"],
        id: json["id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "id": id,
        "date": date?.toIso8601String(),
      };
}
