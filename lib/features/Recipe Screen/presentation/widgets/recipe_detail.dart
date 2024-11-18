import 'package:newproject/features/Recipe%20Screen/domain/recipe.dart';
import 'package:newproject/features/Recipe%20Screen/presentation/state/state.dart';
import 'package:newproject/utils/exporter.dart';
import 'package:shimmer/shimmer.dart';

class RecipeDetail extends ConsumerWidget {
  const RecipeDetail({super.key, required this.recipe, });
  final Recipe recipe;
  
  @override
  Widget build(BuildContext context, ref) {
    final recipeProvider = recipeDetailProvider(recipe.id!);
    final singleRecipeProvider = ref.watch(recipeProvider);
    final singleRecipeController = ref.read(recipeProvider.notifier);
    return Scaffold(
        body: singleRecipeProvider.when(
            data: (details) {
              return RefreshIndicator(
                onRefresh: () {
                  // ref.invalidate(recipeProvider);
                  // return Future.value();
                  return singleRecipeController.refresh(recipe.id!);
                },
                child: listViewUI(details, context, loading: false),
              );
            },
            error: (error, stackTrace) {
              print(stackTrace);
              return Container(
                child: Text(error.toString()),
              );
            },
            loading: () => AbsorbPointer(
                child: listViewUI(Recipe(), context, loading: true))));
  }

  ListView listViewUI(Recipe details, BuildContext context,
      {bool loading = true}) {
    return ListView(
      children: [
        Stack(
          children: [
            loading
                ? ShimmerBox(height: 350
                )
                : Container(
                    alignment: Alignment.topLeft,
                    width: double.infinity,
                    height: 350,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(details.image ?? ""))),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        margin: const EdgeInsets.only(left: 10, top: 20),
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
                  ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 280, left: 15, right: 15),
              decoration: loading?null: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1,
                      offset: Offset(0, 1),
                      color: Color.fromARGB(255, 130, 127, 127),
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                children: [
                  loading
                ? ShimmerBox(height: 20)
                :Text(
                    "${details.title}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  loading
                ? ShimmerBox(height: 15)
                :Text(
                    "${details.extendedIngredients?.length} ingredients",
                    style: const TextStyle(
                        color: Color.fromARGB(202, 104, 102, 102)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        recipeSpecs(loading: loading,
                            icon: Icons.timer,
                            specification:
                                "${details.cookingMinutes ?? " "} min"),
                        recipeSpecs(loading: loading,
                            specification: "${details.healthScore} H.Score",
                            icon: Icons.local_fire_department_outlined),
                        recipeSpecs(loading: loading,
                            specification: "${details.servings} servings",
                            icon: Icons.adjust)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Text(DateTime.now().format()),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: loading
                ? ShimmerBox(height: 15)
                : const Text(
            "Ingredients",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        SizedBox(
          height: 130,
          child: loading
                ? ShimmerBox()
                :ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20),
            children: [
              Row(
                children: [
                  if (details.extendedIngredients!.length > 0)
                    for (int i = 0;
                        i < details.extendedIngredients!.length;
                        i++)
                      eachIngredients(
                          image: details.extendedIngredients![i].image ?? "",
                          name: details.extendedIngredients![i].name!,
                          quantity: details.extendedIngredients![i].amount!),
                ],
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 15,top: 15),
          child: loading
                ? ShimmerBox(height: 15
                )
                : const Text(
            "Cooking instruction",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Color.fromRGBO(255, 246, 234, 1)),
          padding: const EdgeInsets.all(20),
          child:loading
                ? ShimmerBox(height: 200)
                : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (details.analyzedInstructions != null &&
                  details.analyzedInstructions!.isNotEmpty)
                for (var instruction in details.analyzedInstructions!)
                  for (var step in instruction["steps"]!)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Step ${step["number"]}",
                          style: const TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                              fontSize: 15),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            "${step["step"]}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1,
                                fontSize: 14),
                          ),
                        )
                      ],
                    ),
            ],
          ),
        )
      ],
    );
  }

  Column eachIngredients(
      {required String image, required String name, required quantity}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              // image: DecorationImage(onError: (exception, stackTrace) {

              // },
              //     image: NetworkImage(image), fit: BoxFit.cover)
            ),
            margin: const EdgeInsets.only(right: 15, bottom: 5),
            height: 70,
            width: 70,
            child: Image.network(
              image,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.set_meal_outlined);
              },
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: SizedBox(
            width: 90,
            child: Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(
            "${quantity.toString()} items",
            style: const TextStyle(color: Color.fromARGB(202, 104, 102, 102)),
          ),
        )
      ],
    );
  }

  

  Widget recipeSpecs({required String specification, required IconData icon, bool loading=false}) {
    return Expanded(
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(children: [
            Expanded(
              flex: 1,
              child: loading
                ? ShimmerBox(height: 20,width: 8)
                :Container(
                child: Icon(
                  icon,
                  color: const Color.fromRGBO(250, 169, 47, 1),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: loading
                ? ShimmerBox(width: 20,height: 20)
                :Text(
                specification,
                style:
                    const TextStyle(color: Color.fromARGB(202, 104, 102, 102)),
              ),
            )
          ])),
    );
  }
}
Shimmer ShimmerBox(
      {double? height, double? width, BoxShape shape = BoxShape.rectangle}) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 97, 97, 97),
      highlightColor: Colors.grey,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: shape,
          color: Colors.grey,
        ),
      ),
    );
  }