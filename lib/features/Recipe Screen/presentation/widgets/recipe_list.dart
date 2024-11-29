import 'package:newproject/features/Recipe%20Screen/domain/recipe_model.dart';
import 'package:newproject/features/Recipe%20Screen/presentation/controller/recipe_filter_controller.dart';
import 'package:newproject/features/Recipe%20Screen/presentation/state/state.dart';
import 'package:newproject/utils/exporter.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'recipe_detail.dart';

class RecipeList extends ConsumerWidget {
  const RecipeList({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final recipeProvider = ref.watch(recipeListProvider);
    final recipeController = ref.read(recipeListProvider.notifier);
    final filterController = ref.read(recipeFilterProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipes"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15, top: 10),
                child: const Text(
                  "Filters",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 5, top: 10),
                  child: const Icon(Icons.filter_alt)),
              IconButton(
                  onPressed: () {
                    filterController.clear();
                  },
                  icon: Icon(Icons.clear))
            ],
          ),
          Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Consumer(builder: (context, ref, child) {
                        final cuisine = ref.watch(recipeFilterProvider
                            .select((filter) => filter?.cuisine));

                        final cuisines = filterController.cuisines;
                        return DropdownMenu(
                            menuHeight: 200,
                            label: const Text(
                              "Select Cuisine",
                              style: TextStyle(fontSize: 18),
                            ),
                            initialSelection: cuisine,
                            onSelected: (value) =>
                                filterController.selectCuisine(value),
                            dropdownMenuEntries: cuisines
                                .map((items) => DropdownMenuEntry(
                                    value: items, label: items))
                                .toList());
                      }),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Consumer(builder: (context, ref, child) {
                        final sort = ref.watch(recipeFilterProvider
                            .select((filter) => filter?.sort));

                        final sortOptions = filterController.sort;
                        return DropdownMenu(
                            menuHeight: 200,
                            label: const Text(
                              "Sort by",
                              style: TextStyle(fontSize: 18),
                            ),
                            initialSelection: sort,
                            onSelected: (value) =>
                                filterController.selectSort(value),
                            dropdownMenuEntries: sortOptions
                                .map((sort) =>
                                    DropdownMenuEntry(value: sort, label: sort))
                                .toList());
                      }),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Consumer(builder: (context, ref, child) {
                        final intolerance = ref.watch(recipeFilterProvider
                            .select((filter) => filter?.intolerances));

                        final intolerances = filterController.intolerances;
                        return DropdownMenu(
                            menuHeight: 200,
                            label: const Text(
                              "Intolerances",
                              style: TextStyle(fontSize: 18),
                            ),
                            initialSelection: intolerance,
                            onSelected: (value) =>
                                filterController.selectIntolerances(value),
                            dropdownMenuEntries: intolerances
                                .map((item) =>
                                    DropdownMenuEntry(value: item, label: item))
                                .toList());
                      }),
                    ),
                    const Divider(
                      thickness: 1,
                      color: Color.fromARGB(255, 113, 110, 110),
                    ),
                  ])),
          recipeProvider.when(
              data: (recipes) {
                return mainBody(recipes, filterController, loading: false);
              },
              error: (error, stackTrace) => Container(
                    child: Text(error.toString()),
                  ),
              loading: () => AbsorbPointer(
                  child: mainBody(RecipeModel(), filterController,
                      loading: true))),
        ],
      ),
    );
  }

  Column mainBody(RecipeModel recipes, RecipeFilterController controller,
      {bool loading = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        loading
            ? ShimmerBox(height: 15)
            : Text("${recipes.totalResults} results"),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: loading
              ? ShimmerBox(height: 25)
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Three items per row
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1, // Square shape
                  ),
                  itemBuilder: (context, index) {
                    final singleRecipe = recipes.recipe![index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecipeDetail(
                              recipe: singleRecipe,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 5,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        child: Column(children: [
                          Expanded(
                            flex: 3,
                            child: loading
                                ? ShimmerBox(height: 25)
                                : Container(
                                    height: 100,
                                    margin: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              singleRecipe.image!,
                                            ),
                                            fit: BoxFit.cover))),
                          ),
                          Expanded(
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "${singleRecipe.title}",
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          )
                        ]),
                      ),
                    );
                  },
                  itemCount: recipes.recipe!.length,
                ),
        )
      ],
    );
  }
}
