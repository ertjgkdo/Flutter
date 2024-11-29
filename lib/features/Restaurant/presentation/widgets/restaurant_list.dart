import 'package:flutter/material.dart';
import 'package:newproject/features/Restaurant/domain/restaurant_model.dart';
import 'package:newproject/features/Restaurant/presentation/controllers/rest_list_controller.dart';
import 'package:newproject/features/Restaurant/presentation/controllers/search_delegate.dart';
import 'package:newproject/features/Restaurant/presentation/state/state.dart';
import 'package:newproject/features/Restaurant/presentation/widgets/components/restaurant_list_ui.dart';
import 'package:newproject/utils/exporter.dart';

class RestaurantList extends ConsumerWidget {
  const RestaurantList({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final restaurantProvider = ref.watch(restaurantListProvider);
    final restaurantController = ref.watch(restaurantListProvider.notifier);

    final TextEditingController searchController = TextEditingController();
    return Scaffold(
        appBar: AppBar(),
        body:
            //  restaurantProvider.when(
            //     data: (restaurantModel) {
            //       final restaurants = restaurantModel.restaurants;
            // return
            Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 30,
                height: 30,
                margin: const EdgeInsets.only(left: 5, top: 10),
                padding: const EdgeInsets.only(left: 8),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromARGB(255, 59, 66, 83)),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white70,
                  size: 18,
                ),
              ),
            ),
            Container(
              height: 40,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: GestureDetector(
                onTap: () async {
                  await showSearch(
                      context: context, delegate: CustomSearchDelegate());
                },
                child: TextField(
                  enabled: false,
                  controller: searchController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          restaurantController
                              .searchRestaurants(searchController.text.trim());
                        },
                        icon: const Icon(Icons.search)),
                    labelText: 'Search',
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            // Expanded(
            //   child: RestaurantListUI(restaurants: restaurants),
            //  ),
          ],
        )
        // ;
        // },
        // error: (error, stackTrace) {
        //   print(stackTrace);
        //   return Container(
        //     child: Text(error.toString()),
        //   );
        // },
        // loading: () =>
        //     Container(child: const CircularProgressIndicator()))
        );
  }
}
