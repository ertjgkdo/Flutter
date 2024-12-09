import 'package:http/http.dart';
import 'package:newproject/features/Restaurant/domain/restaurant_model.dart';
import 'package:newproject/utils/repository.dart';

// class RestaurantRepository {
//   final oldClient = Client();
//   Future<RestaurantModel> load({String keyword = '', Client? client}) async {
//     final baseUrl =
//         "https://api.spoonacular.com/food/restaurants/search?apiKey=ae7d8ce821f544e7b377a56a8420623f&";
//     final url = keyword.trim().isEmpty ? baseUrl : "$baseUrl&query=$keyword";
//     final response = await (client ?? oldClient).get(Uri.parse(url));
//     try {
//       if (response.statusCode == 200) {
//         // print(response.body);
//         return RestaurantModel.fromRawJson(response.body);

//         // Success status code for get request is 200
//       } else {
//         throw "${response.statusCode} ${response.reasonPhrase}";
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }
// }

class RestaurantRepository extends Repository<RestaurantModel> {
  RestaurantRepository({super.localClient});
  @override
  // TODO: implement endpoint
  // String get endpoint => '';
  @override
  RestaurantModel fromRawJson(String json) => RestaurantModel.fromRawJson(json);

  @override
  RestaurantModel fromJson(Map<String, dynamic> map) =>
      RestaurantModel.fromJson(map);

  Future<RestaurantModel> fetchRestaurant({String? query}) async {
    return await fetch(
        path: "restaurants/search",
        queries: "query=$query&lat=37.78129959&lng=-122.38869477");
  }

  @override
  List<RestaurantModel> listFromRawJson(String json) {
    // TODO: implement listFromRawJson
    throw UnimplementedError();
  }
}
