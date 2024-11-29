import 'dart:async';

import 'package:http/http.dart';
import 'package:newproject/features/Recipe%20Screen/presentation/state/state.dart';
import 'package:newproject/utils/exporter.dart';

import '../../domain/recipe_model.dart';

class RecipeController extends AutoDisposeAsyncNotifier<RecipeModel> {
  final client = Client();
  @override
  FutureOr<RecipeModel> build() {
    return load();
  }

  Future<RecipeModel> load() async {
    // state = const AsyncLoading();
    // state = AsyncData([]);
    final filter = ref.watch(recipeFilterProvider);

    final response = await client.get(Uri.parse(
        "https://api.spoonacular.com/recipes/complexSearch?apiKey=394725e0efc640c6ba76d5bc3ef5c36a&query=pasta${filter?.query}"));
    // print(response);
    try {
      if (response.statusCode == 200) {
        // print(response.body);
        return recipeModelFromJson(response.body);

        // Success status code for get request is 200
      } else {
        throw "${response.statusCode} ${response.reasonPhrase}";
      }
    } catch (e) {
      rethrow;
    }
  }
}
