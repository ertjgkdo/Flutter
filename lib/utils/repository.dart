import 'package:http/http.dart';
import 'package:newproject/features/Restaurant/domain/restaurant_model.dart';

abstract class Repository<T> {
  final Client? localClient;
  final baseUrl = "https://api.spoonacular.com/";
  final endpoint = "food";
  final apiKey = "ae7d8ce821f544e7b377a56a8420623f";
  Repository({this.localClient});

  T fromRawJson(String json);

  T fromJson(Map<String, dynamic> map);

  Future<T> fetch({Client? client, String? path, String? queries}) async {
    final response = await ((client ?? localClient) ?? Client()).get(
        Uri.parse(
            '$baseUrl$endpoint${path == null ? "" : "/$path"}${queries == null ? "" : "?$queries"}'),
        headers: {'x-api-key': apiKey, 'Content-Type': 'application/json'});
    try {
      if (response.statusCode == 200) {
        // print(response.body);
        return fromRawJson(response.body);

        // Success status code for get request is 200
      } else {
        throw "${response.statusCode} ${response.reasonPhrase}";
      }
    } catch (e) {
      rethrow;
    }
  }
}
