// To parse this JSON data, do
//
//     final recipeModel = recipeModelFromJson(jsonString);

import 'dart:convert';
import 'recipe.dart';

RecipeModel recipeModelFromJson(String str) =>
    RecipeModel.fromJson(json.decode(str));

String recipeModelToJson(RecipeModel data) => json.encode(data.toJson());

class RecipeModel {
  final List<Recipe>? recipe;
  final int? offset;
  final int? number;
  final int? totalResults;

  RecipeModel({
    this.recipe,
    this.offset,
    this.number,
    this.totalResults,
  });

  RecipeModel copyWith({
    List<Recipe>? recipe,
    int? offset,
    int? number,
    int? totalResults,
  }) =>
      RecipeModel(
        recipe: recipe ?? this.recipe,
        offset: offset ?? this.offset,
        number: number ?? this.number,
        totalResults: totalResults ?? this.totalResults,
      );

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        recipe: json["results"] == null
            ? []
            : List<Recipe>.from(
                json["results"]!.map((x) => Recipe.fromJson(x))),
        offset: json["offset"],
        number: json["number"],
        totalResults: json["totalResults"],
      );

  Map<String, dynamic> toJson() => {
        "results": recipe == null
            ? []
            : List<dynamic>.from(recipe!.map((x) => x.toJson())),
        "offset": offset,
        "number": number,
        "totalResults": totalResults,
      };
}
