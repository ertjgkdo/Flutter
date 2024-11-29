import 'package:newproject/features/Restaurant/data/restaurant_repository.dart';
import 'package:newproject/features/Restaurant/presentation/widgets/components/restaurant_list_ui.dart';
import 'package:newproject/utils/exporter.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  late final restaurantSearchProvider = FutureProvider((ref) async {
    final client = await ref.getDebouncedHttpClient();
    return RestaurantRepository(localClient: client)
        .fetchRestaurant(query: query);
  });
  List<String> suggestions = [
    'a',
    'birdbox',
    'south beach cafe',
    'asd',
    'adfdf'
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    //search clear
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // suggestions
    //     .where((item) => item.toLowerCase().contains(query.toLowerCase()))
    //     .toList();
    return Consumer(builder: (context, ref, child) {
      final searchProvider = ref.watch(restaurantSearchProvider);
      return searchProvider.when(
          data: (data) {
            return RestaurantListUI(restaurants: data.restaurants);
          },
          error: (error, stacktrace) {
            return Text(error.toString());
          },
          loading: () => Center(child: CircularProgressIndicator()));
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Center(
        child: Text("Search restaurants"),
      );
    }
    return Consumer(builder: (context, ref, child) {
      final searchProvider = ref.watch(restaurantSearchProvider);
      return searchProvider.when(
          data: (data) {
            return RestaurantListUI(restaurants: data.restaurants);
          },
          error: (error, stacktrace) {
            return Text(error.toString());
          },
          loading: () => Center(child: CircularProgressIndicator()));
    });
  }
}
