import 'dart:async';

import 'package:newproject/features/Restaurant/data/restaurant_repository.dart';
import 'package:newproject/features/Restaurant/domain/restaurant_model.dart';
import 'package:newproject/utils/exporter.dart';

class RestaurantController extends AsyncNotifier<RestaurantModel> {
  @override
  FutureOr<RestaurantModel> build() {
    // TODO: implement build
    return loadData();
  }

  Future<RestaurantModel> loadData() async {
    return RestaurantRepository()
        .fetch(client: await ref.getDebouncedHttpClient());
  }

  Future<void> searchRestaurants(String keyword) async {
    state = const AsyncLoading();
    try {
      final result =
          await RestaurantRepository().fetchRestaurant(query: keyword);

      state = AsyncData(result);
    } catch (e) {
      rethrow;
    }
  }
}
