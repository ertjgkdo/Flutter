import 'dart:convert';

List<CustomFood> customFoodFromJson(String str) =>
    List<CustomFood>.from(json.decode(str).map((x) => CustomFood.fromJson(x)));

String customFoodToJson(List<CustomFood> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CustomFood {
  final String? id;
  final String? title;
  final int? servings;
  final String? customFoodBoxId;
  final Nutrition? nutrition;
  final Meta? meta;
  final String? imageUrl;
  final String? instructions;
  final bool? available;
  final double? rating;

  CustomFood({
    this.id,
    this.title,
    this.servings,
    this.customFoodBoxId,
    this.nutrition,
    this.meta,
    this.imageUrl,
    this.instructions,
    this.available,
    this.rating,
  });

  CustomFood copyWith({
    String? id,
    String? title,
    int? servings,
    String? customFoodBoxId,
    Nutrition? nutrition,
    Meta? meta,
    String? imageUrl,
    String? instructions,
    bool? available,
    double? rating,
  }) =>
      CustomFood(
        id: id ?? this.id,
        title: title ?? this.title,
        servings: servings ?? this.servings,
        customFoodBoxId: customFoodBoxId ?? this.customFoodBoxId,
        nutrition: nutrition ?? this.nutrition,
        meta: meta ?? this.meta,
        imageUrl: imageUrl ?? this.imageUrl,
        instructions: instructions ?? this.instructions,
        available: available ?? this.available,
        rating: rating ?? this.rating,
      );

  factory CustomFood.fromRawJson(String str) =>
      CustomFood.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CustomFood.fromJson(Map<String, dynamic> json) => CustomFood(
        id: json["id"],
        title: json["title"],
        servings: json["servings"],
        customFoodBoxId: json["customFoodBoxId"],
        nutrition: json["nutrition"] == null
            ? null
            : Nutrition.fromJson(json["nutrition"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        imageUrl: json["imageUrl"],
        instructions: json["instructions"],
        available: json["available"],
        rating: json["rating"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "servings": servings,
        "customFoodBoxId": 'test',
        "nutrition": nutrition?.toJson(),
        "meta": meta?.toJson(),
        "imageUrl": imageUrl,
        "instructions": instructions,
        "available": available,
        "rating": rating,
      };
}

class Meta {
  final List<String> diets;
  final List<String> intolerances;

  Meta({
    this.diets = const [],
    this.intolerances = const [],
  });

  Meta copyWith({
    List<String>? diets,
    List<String>? intolerances,
  }) =>
      Meta(
        diets: diets ?? this.diets,
        intolerances: intolerances ?? this.intolerances,
      );

  factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        diets: json["diets"] == null
            ? []
            : List<String>.from(json["diets"]!.map((x) => x)),
        intolerances: json["intolerances"] == null
            ? []
            : List<String>.from(json["intolerances"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "diets": diets == null ? [] : List<dynamic>.from(diets.map((x) => x)),
        // ignore: unnecessary_null_comparison
        "intolerances": intolerances == null
            ? []
            : List<dynamic>.from(intolerances.map((x) => x)),
      };
}

class Nutrition {
  final Calories? calories;
  final Calories? salt;
  final Calories? sugar;
  final Calories? protein;

  Nutrition({
    this.calories,
    this.salt,
    this.sugar,
    this.protein,
  });

  Nutrition copyWith({
    Calories? calories,
    Calories? salt,
    Calories? sugar,
    Calories? protein,
  }) =>
      Nutrition(
        calories: calories ?? this.calories,
        salt: salt ?? this.salt,
        sugar: sugar ?? this.sugar,
        protein: protein ?? this.protein,
      );

  factory Nutrition.fromRawJson(String str) =>
      Nutrition.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Nutrition.fromJson(Map<String, dynamic> json) => Nutrition(
        calories: json["calories"] == null
            ? null
            : Calories.fromJson(json["calories"]),
        salt: json["salt"] == null ? null : Calories.fromJson(json["salt"]),
        sugar: json["sugar"] == null ? null : Calories.fromJson(json["sugar"]),
        protein:
            json["protein"] == null ? null : Calories.fromJson(json["protein"]),
      );

  Map<String, dynamic> toJson() => {
        "calories": calories?.toJson(),
        "salt": salt?.toJson(),
        "sugar": sugar?.toJson(),
        "protein": protein?.toJson(),
      };
}

class Calories {
  final int? amount;
  final String? unit;

  Calories({
    this.amount,
    this.unit,
  });

  Calories copyWith({
    int? amount,
    String? unit,
  }) =>
      Calories(
        amount: amount ?? this.amount,
        unit: unit ?? this.unit,
      );

  factory Calories.fromRawJson(String str) =>
      Calories.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Calories.fromJson(Map<String, dynamic> json) => Calories(
        amount: json["amount"],
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "unit": unit,
      };
}
