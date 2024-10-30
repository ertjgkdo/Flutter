import 'dart:async';

import 'package:http/http.dart';
import 'package:newproject/features/BitcoinApp/domain/movie_model.dart';
import 'package:newproject/utils/exporter.dart';
// https://my-json-server.typicode.com/horizon-code-academy/fake-movies-api/movies

class MovieListController extends AsyncNotifier<List<MovieModel>> {
  final client = Client();
  @override
  FutureOr<List<MovieModel>> build() async {
    return load();
  }

  Future<List<MovieModel>> load() async {
    // state = const AsyncLoading();
    // state = AsyncData([]);
    final response = await client.get(Uri.parse(
        "https://my-json-server.typicode.com/horizon-code-academy/fake-movies-api/movies"));

    try {
      if (response.statusCode == 200) {
        print(response.body);
        return movieModelFromJson(response.body);

        // Success status code for get request is 200
      } else {
        throw "${response.statusCode} ${response.reasonPhrase}";
      }
    } catch (e) {
      rethrow;
    }
  }

  refresh() async {
    state = await AsyncValue.guard(() => load());
  }
}
