import 'dart:async';

import 'package:newproject/features/Restaurant/domain/restaurant_model.dart';
import 'package:newproject/features/Restaurant/presentation/state/state.dart';
import 'package:newproject/utils/exporter.dart';

import '../../data/restaurant_repository.dart';

class RestaurantSearchController
    extends FamilyAsyncNotifier<RestaurantModel, String> {
  @override
  FutureOr<RestaurantModel> build(String arg) {
    return load();
  }

  Future<RestaurantModel> load() async {
    final client = await ref.getDebouncedHttpClient(Duration(seconds: 5));
    return RestaurantRepository().load(keyword: arg, client: client);
  }
}
