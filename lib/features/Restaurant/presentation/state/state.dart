import 'package:newproject/features/Restaurant/domain/restaurant_model.dart';
import 'package:newproject/features/Restaurant/presentation/controllers/rest_list_controller.dart';

import '../../../../utils/exporter.dart';

final restaurantListProvider =
    AsyncNotifierProvider.autoDispose<RestaurantController, RestaurantModel>(
        RestaurantController.new);