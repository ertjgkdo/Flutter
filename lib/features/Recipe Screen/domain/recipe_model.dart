// To parse this JSON data, do
//
//     final recipeModel = recipeModelFromJson(jsonString);

import 'dart:convert';

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
        recipe: json["recipe"] == null
            ? []
            : List<Recipe>.from(json["recipe"]!.map((x) => Recipe.fromJson(x))),
        offset: json["offset"],
        number: json["number"],
        totalResults: json["totalResults"],
      );

  Map<String, dynamic> toJson() => {
        "recipe": recipe == null
            ? []
            : List<dynamic>.from(recipe!.map((x) => x.toJson())),
        "offset": offset,
        "number": number,
        "totalResults": totalResults,
      };
}

class Recipe {
  final int? id;
  final String? title;
  final String? image;
  final ImageType? imageType;

  Recipe({
    this.id,
    this.title,
    this.image,
    this.imageType,
  });

  Recipe copyWith({
    int? id,
    String? title,
    String? image,
    ImageType? imageType,
  }) =>
      Recipe(
        id: id ?? this.id,
        title: title ?? this.title,
        image: image ?? this.image,
        imageType: imageType ?? this.imageType,
      );

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        imageType: imageTypeValues.map[json["imageType"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "imageType": imageTypeValues.reverse[imageType],
      };
}

enum ImageType { JPG }

final imageTypeValues = EnumValues({"jpg": ImageType.JPG});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
