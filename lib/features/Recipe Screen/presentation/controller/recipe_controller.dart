import 'dart:async';

import 'package:http/http.dart';
import 'package:newproject/features/Recipe%20Screen/presentation/state/state.dart';
import 'package:newproject/utils/exporter.dart';

import '../../domain/recipe.dart';

class SingleRecipeController extends FamilyAsyncNotifier<Recipe, int> {
  final client = Client();
  @override
  FutureOr<Recipe> build(int arg) {
    return load(arg);
  }

  Future<Recipe> load(int id) async {
    // state = const AsyncLoading();
    // state = AsyncData([]);

    final response = await client.get(Uri.parse(
        "https://api.spoonacular.com/recipes/$id/information?apiKey=394725e0efc640c6ba76d5bc3ef5c36a&"));
    // print(response);
    try {
      if (response.statusCode == 200) {
        // print(response.body);
        return recipeFromJson(response.body);

        // Success status code for get request is 200
      } else {
        throw "${response.statusCode} ${response.reasonPhrase}";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> refresh(int id) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() => load(id));
    return;
  }
}
