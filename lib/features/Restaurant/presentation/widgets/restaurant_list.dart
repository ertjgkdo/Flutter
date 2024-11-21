import 'package:flutter/material.dart';
import 'package:newproject/features/Restaurant/presentation/state/state.dart';
import 'package:newproject/utils/exporter.dart';

class RestaurantList extends ConsumerWidget {
  const RestaurantList({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final restaurantProvider = ref.watch(restaurantListProvider);
    final restaurantController = ref.watch(restaurantListProvider.notifier);

    final TextEditingController searchController = TextEditingController();
    return Scaffold(
        body: restaurantProvider.when(
            data: (restaurantModel) {
              final restaurants = restaurantModel.restaurants;
              return Column(
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
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {}, icon: Icon(Icons.search)),
                        labelText: 'Search',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: restaurants.length,
                      itemBuilder: (context, index) {
                        final restaurant =
                            restaurants.isNotEmpty ? restaurants[index] : null;
                        return ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          tileColor:
                              Colors.white, // Background color for the tile
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          title: Text(
                            restaurant?.name ?? '',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 59, 66, 83),
                            ),
                          ),
                          subtitle: Text(
                            restaurant?.type ?? 'Cuisine type here',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          trailing: Text(
                              restaurant?.isOpen == true
                                  ? "Open"
                                  : restaurant?.isOpen == false
                                      ? "Closed"
                                      : "Unknown",
                              style: TextStyle(
                                  color: restaurant?.isOpen == true
                                      ? Colors.green
                                      : restaurant?.isOpen == false
                                          ? Colors.red
                                          : Colors.grey)),
                          onTap: () {},
                        );
                      },
                    ),
                  ),
                ],
              );
            },
            error: (error, stackTrace) {
              print(stackTrace);
              return Container(
                child: Text(error.toString()),
              );
            },
            loading: () => Container(child: CircularProgressIndicator())));
  }
}
