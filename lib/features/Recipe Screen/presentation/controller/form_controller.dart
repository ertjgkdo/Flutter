import 'dart:math';

import 'package:newproject/features/Recipe%20Screen/data/custom_food_repo.dart';
import 'package:newproject/features/Recipe%20Screen/presentation/state/state.dart';
import 'package:uuid/v4.dart';
import '../../../../utils/exporter.dart';
import '../../domain/custom_recipe_model.dart';

class FoodFormController extends AutoDisposeNotifier<CustomFood?> {
  final GlobalKey<FormState> basicFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> nutritionFormKey = GlobalKey<FormState>();

  final TextEditingController titleController =
      TextEditingController(text: "Burger");
  final TextEditingController servingsController =
      TextEditingController(text: "1");
  final TextEditingController customFoodIdController =
      TextEditingController(text: UuidV4().generate());
  final TextEditingController instructionsController =
      TextEditingController(text: "Hello");
  final TextEditingController ratingController =
      TextEditingController(text: '2');
  final TextEditingController imageController = TextEditingController(
      text:
          'https://www.foodiesfeed.com/wp-content/uploads/2023/06/burger-with-melted-cheese.jpg');

  final TextEditingController caloriesController =
      TextEditingController(text: '3321');
  final TextEditingController saltController =
      TextEditingController(text: '31');
  final TextEditingController sugarController =
      TextEditingController(text: '21');
  final TextEditingController proteinController =
      TextEditingController(text: '43');

  @override
  CustomFood? build() {
    return CustomFood(
        customFoodBoxId: const UuidV4().generate(),
        meta: Meta(diets: [], intolerances: []),
        nutrition: Nutrition(
            calories: Calories(),
            protein: Calories(),
            salt: Calories(),
            sugar: Calories()));
  }

  addMeta({String? diet, String? intolerance}) {
    state = state?.copyWith(
        meta: state?.meta?.copyWith(
            diets: diet != null ? [...state!.meta!.diets, diet] : null,
            intolerances: intolerance != null
                ? [...state!.meta!.intolerances, intolerance]
                : null));
    // print(state?.meta?.diets);
  }

  removeMeta({String? diet, String? intolerance}) {
    state = state?.copyWith(
        meta: state?.meta?.copyWith(
            diets: [...state!.meta!.diets..remove(diet)],
            intolerances: [...state!.meta!.intolerances..remove(intolerance)]));
  }

  addBasicInfo(
      {String? title,
      int? servings,
      String? customFoodId,
      String? instructions,
      bool? available,
      double? rating,
      String? image}) {
    state = state?.copyWith(
        title: title,
        servings: servings,
        customFoodBoxId: customFoodId,
        instructions: instructions,
        available: available,
        rating: rating,
        imageUrl: image);
  }

  updateNutritionInfo(
      {int? calories, int? salt, int? sugar, int? protein, String? unit}) {
    // if (state?.nutrition==null){
    //   state=state?.copyWith(nutrition: Nutrition(calories: Calories()));
    // }
    state = state?.copyWith(
        nutrition: state?.nutrition?.copyWith(
            calories: state?.nutrition?.calories?.copyWith(
                amount: calories, unit: calories != null ? unit : null),
            protein: state?.nutrition?.protein?.copyWith(
                amount: protein, unit: protein != null ? unit : null),
            salt: state?.nutrition?.salt
                ?.copyWith(amount: salt, unit: salt != null ? unit : null),
            sugar: state?.nutrition?.sugar
                ?.copyWith(amount: sugar, unit: sugar != null ? unit : null)));
  }

  submit({required BuildContext context}) async {
    addBasicInfo(
        title: titleController.text,
        customFoodId: customFoodIdController.text,
        image: imageController.text,
        instructions: instructionsController.text,
        rating: double.tryParse(ratingController.text) ?? 0.0,
        servings: int.tryParse(servingsController.text) ?? 0);
    try {
      final food = await CustomFoodRepository(
              localClient: await ref.getDebouncedHttpClient())
          .add(food: state!);
      Navigator.pop(context);
      ref.invalidate(customListProvider);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Custom Food Added")));
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Custom Food Not added")));
    }
  }
}
