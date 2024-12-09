import 'dart:convert';

import 'package:http/http.dart';
import 'package:newproject/features/Recipe%20Screen/domain/custom_recipe_model.dart';
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

class CustomFoodRepository extends Repository<CustomFood> {
  CustomFoodRepository({super.localClient});

  @override
  // TODO: implement baseUrl
  String get baseUrl => 'https://67517f51d1983b9597b315cd.mockapi.io/api/food/';
  @override
  // TODO: implement endpoint
  String get endpoint => 'add';
  @override
  CustomFood fromRawJson(String json) => CustomFood.fromRawJson(json);

  @override
  CustomFood fromJson(Map<String, dynamic> map) => CustomFood.fromJson(map);

  Future<CustomFood> add({required CustomFood food}) async {
    return await create(
        // path:
        //     "/customFoods/add?username=evampiro&hash=f40d23ef3ae2a0b049ddbf55b844466bd251e673",
        body: food.toRawJson());
  }

  Future<List<CustomFood>> fetchAll() async {
    final response = await fetchList();
    return response;
  }

  @override
  List<CustomFood> listFromRawJson(String json) {
    return customFoodFromJson(json);
  }

  Future<CustomFood> delete({required String id}) async {
    final response = await deleteOne(id: id);
    return response;
  }
}
