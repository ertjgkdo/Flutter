import 'dart:async';

import 'package:http/http.dart';
import 'package:newproject/features/Restaurant/domain/restaurant_model.dart';
import 'package:newproject/utils/exporter.dart';

class RestaurantController extends AutoDisposeAsyncNotifier<RestaurantModel>{
  final client = Client();

  @override
  FutureOr<RestaurantModel> build() {
    // TODO: implement build
    return load();
  }
Future<RestaurantModel> load ()async{
final response = await client.get(Uri.parse(
        "https://api.spoonacular.com/food/restaurants/search?apiKey=394725e0efc640c6ba76d5bc3ef5c36a&query=beachcafe&cuisine=italian&lat=37.78129959&lng=-122.38869477"));
    try   {
      if (response.statusCode == 200) {
        print(response.body);
        return RestaurantModel.fromRawJson(response.body);

        // Success status code for get request is 200
      } else {
        throw "${response.statusCode} ${response.reasonPhrase}";
      }
    } catch (e) {
      rethrow;
    }
}
}