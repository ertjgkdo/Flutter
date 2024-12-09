import 'package:newproject/features/Recipe%20Screen/data/custom_food_repo.dart';
import 'package:newproject/features/Recipe%20Screen/domain/custom_recipe_model.dart';
import 'package:newproject/utils/exporter.dart';

class CustomListController extends AsyncNotifier<List<CustomFood>> {
  @override
  Future<List<CustomFood>> build() {
    return fetchCustomList();
  }

  Future<List<CustomFood>> fetchCustomList() async {
    final repository = CustomFoodRepository();
    return await repository.fetchAll();
  }

  Future deleteItem(
      {required BuildContext context, required CustomFood item}) async {
    try {
      final repository = CustomFoodRepository();
      await repository.delete(id: item.id!);
      state = await AsyncValue.guard(() => fetchCustomList());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Deleted!!")));
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Not deleted")));
    }
  }
}
