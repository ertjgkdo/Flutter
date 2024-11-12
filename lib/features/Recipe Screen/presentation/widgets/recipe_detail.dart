import 'package:flutter/material.dart';
import 'package:newproject/features/Recipe%20Screen/presentation/state/state.dart';
import 'package:newproject/utils/exporter.dart';

class RecipeDetail extends ConsumerWidget {
  const RecipeDetail({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final singleRecipeProvider = ref.watch(recipeDetailProvider);
    final singleRecipeController = ref.read(recipeDetailProvider.notifier);
    return Scaffold(
        body: singleRecipeProvider.when(
            data: (details) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          width: double.infinity,
                          height: 350,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(details.image!))),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
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
                          margin: const EdgeInsets.only(
                              top: 300, left: 15, right: 15),
                          decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 1,
                                  offset: Offset(0, 1),
                                  color: Color.fromARGB(255, 130, 127, 127),
                                )
                              ],
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            children: [
                              Text(
                                "${details.title}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "${details.extendedIngredients?.length} ingredients",
                                style: const TextStyle(
                                    color: Color.fromARGB(202, 104, 102, 102)),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    recipeSpecs(
                                        icon: Icons.timer,
                                        specification:
                                            "${details.cookingMinutes ?? " "} min"),
                                    recipeSpecs(
                                        specification:
                                            "${details.healthScore} H.Score",
                                        icon: Icons
                                            .local_fire_department_outlined),
                                    recipeSpecs(
                                        specification:
                                            "${details.servings} servings",
                                        icon: Icons.adjust)
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: const Text(
                        "Ingredients",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 130,
                      child: ListView(
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
                                      image: details
                                          .extendedIngredients![i].image!,
                                      name:
                                          details.extendedIngredients![i].name!,
                                      quantity: details
                                          .extendedIngredients![i].amount!),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: const Text(
                        "Cooking instruction",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Color.fromRGBO(255, 246, 234, 1)),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (details.analyzedInstructions != null &&
                              details.analyzedInstructions!.isNotEmpty)
                            for (var instruction
                                in details.analyzedInstructions!)
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
                                      margin: EdgeInsets.symmetric(vertical: 8),
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
                ),
              );
            },
            error: (error, stackTrace) {
              print(stackTrace);
              return Container(
                child: Text(error.toString()),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator())));
  }

  Column eachIngredients(
      {required String image, required String name, required quantity}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.cover)),
          margin: const EdgeInsets.only(right: 15, bottom: 5),
          height: 70,
          width: 70,
        ),
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        Text(
          "${quantity.toString()} items",
          style: const TextStyle(color: Color.fromARGB(202, 104, 102, 102)),
        )
      ],
    );
  }

  Widget recipeSpecs({required String specification, required IconData icon}) {
    return Expanded(
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Icon(
                  icon,
                  color: const Color.fromRGBO(250, 169, 47, 1),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                specification,
                style:
                    const TextStyle(color: Color.fromARGB(202, 104, 102, 102)),
              ),
            )
          ])),
    );
  }
}
