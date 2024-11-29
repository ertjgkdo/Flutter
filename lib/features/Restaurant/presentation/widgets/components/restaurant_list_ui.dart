import 'package:newproject/features/Restaurant/domain/restaurant_model.dart';

import '../../../../../utils/exporter.dart';

class RestaurantListUI extends StatelessWidget {
  const RestaurantListUI({
    super.key,
    required this.restaurants,
  });

  final List<Restaurant> restaurants;

  @override
  Widget build(BuildContext context) {
    if (restaurants.isEmpty) {
      return const Center(
        child: Text("We could not find any restaurant."),
      );
    }
    return ListView.builder(
      itemCount: restaurants.length,
      itemBuilder: (context, index) {
        final restaurant = restaurants[index];
        return ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          tileColor: Colors.white, // Background color for the tile
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(
            restaurant.name ?? '',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 59, 66, 83),
            ),
          ),
          subtitle: Text(
            restaurant.type ?? 'Cuisine type here',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          trailing: Text(
              restaurant.isOpen == true
                  ? "Open"
                  : restaurant.isOpen == false
                      ? "Closed"
                      : "Unknown",
              style: TextStyle(
                  color: restaurant.isOpen == true
                      ? Colors.green
                      : restaurant.isOpen == false
                          ? Colors.red
                          : Colors.grey)),
          onTap: () {},
        );
      },
    );
  }
}
