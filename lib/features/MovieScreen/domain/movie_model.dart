// To parse this JSON data, do
//
//     final movieModel = movieModelFromJson(jsonString);

import 'dart:convert';

List<MovieModel> movieModelFromJson(String str) =>
    List<MovieModel>.from(json.decode(str).map((x) => MovieModel.fromJson(x)));

String movieModelToJson(List<MovieModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MovieModel {
  final String? title;
  final String? year;
  final String? runtime;
  final String? poster;

  MovieModel({
    this.title,
    this.year,
    this.runtime,
    this.poster,
  });

  MovieModel copyWith({
    String? title,
    String? year,
    String? runtime,
    String? poster,
  }) =>
      MovieModel(
        title: title ?? this.title,
        year: year ?? this.year,
        runtime: runtime ?? this.runtime,
        poster: poster ?? this.poster,
      );

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        title: json["Title"],
        year: json["Year"],
        runtime: json["Runtime"],
        poster: json["Poster"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Year": year,
        "Runtime": runtime,
        "Poster": poster,
      };
}
