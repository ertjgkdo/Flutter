import 'package:newproject/features/Restaurant/domain/restaurant_model.dart';
import 'package:newproject/features/Restaurant/presentation/controllers/rest_list_controller.dart';

import '../../../../utils/exporter.dart';

final restaurantListProvider =
    AsyncNotifierProvider<RestaurantController, RestaurantModel>(
        RestaurantController.new);

// final restaurantSearchProvider = AsyncNotifierProvider<
//     RestaurantSearchController,
//     RestaurantModel,
//     String>(RestaurantSearchController.new);
