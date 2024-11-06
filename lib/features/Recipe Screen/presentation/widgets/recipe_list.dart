import 'package:flutter/material.dart';
import 'package:newproject/features/Recipe%20Screen/presentation/state/state.dart';
import 'package:newproject/utils/exporter.dart';

class RecipeList extends ConsumerWidget {
  const RecipeList({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final recipeProvider = ref.watch(recipeListProvider);
    final recipeController = ref.read(recipeListProvider);
    return Scaffold(
      body: recipeProvider.when(
        data: (recipes) {
          return Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Expanded(
                  child: Consumer(builder: (context, ref, child) {
                    final cuisine = ref.watch(cuisineProvider);
                    final cuisineController =
                        ref.read(cuisineProvider.notifier);
                    final cuisines = cuisineController.cuisines;
                    return DropdownMenu(
                        menuHeight: 200,
                        label: Text("Cuisine"),
                        initialSelection: cuisine,
                        onSelected: (value) =>
                            cuisineController.selectCuisine(value!),
                        dropdownMenuEntries: cuisines
                            .map((items) =>
                                DropdownMenuEntry(value: items, label: items))
                            .toList());
                  }),
                ),
                Expanded(
                  child: Consumer(builder: (context, ref, child) {
                    final sort = ref.watch(sortProvider);
                    final sortController = ref.read(sortProvider.notifier);
                    final sortOptions = sortController.sort;
                    return DropdownMenu(
                        label: Text("Sort by"),
                        initialSelection: sort,
                        onSelected: (value) =>
                            sortController.selectSort(value!),
                        dropdownMenuEntries: sortOptions
                            .map((sort) =>
                                DropdownMenuEntry(value: sort, label: sort))
                            .toList());
                  }),
                ),
                Expanded(
                  child: Consumer(builder: (context, ref, child) {
                    final intolerance = ref.watch(intoleranceProvider);
                    final intoleranceController =
                        ref.read(intoleranceProvider.notifier);
                    final intolerances = intoleranceController.intolerances;
                    return DropdownMenu(
                        label: Text("Intolerances"),
                        initialSelection: intolerance,
                        onSelected: (value) =>
                            intoleranceController.selectIntolerance(value!),
                        dropdownMenuEntries: intolerances
                            .map((item) =>
                                DropdownMenuEntry(value: item, label: item))
                            .toList());
                  }),
                ),
              ]),
              Divider(),
            ],
          );
        },
        error: (error, stackTrace) => Container(
          child: Text(error.toString()),
        ),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
