import 'package:newproject/features/Recipe%20Screen/data/custom_food_repo.dart';
import 'package:newproject/features/Recipe%20Screen/domain/filter_recipe.dart';
import 'package:newproject/features/Recipe%20Screen/domain/recipe_model.dart';
import 'package:newproject/features/Recipe%20Screen/presentation/controller/async_controller.dart';
import 'package:newproject/features/Recipe%20Screen/presentation/controller/custom_list_controller.dart';
import 'package:newproject/features/Recipe%20Screen/presentation/controller/form_controller.dart';
import 'package:newproject/features/Recipe%20Screen/presentation/controller/recipe_filter_controller.dart';
import 'package:newproject/features/Recipe%20Screen/presentation/controller/recipe_controller.dart';
import 'package:newproject/features/Recipe%20Screen/presentation/controller/recipe_step_controller.dart';
import 'package:newproject/utils/exporter.dart';

import '../../domain/custom_recipe_model.dart';
import '../../domain/recipe.dart';

final recipeListProvider =
    AsyncNotifierProvider.autoDispose<RecipeController, RecipeModel>(
        RecipeController.new);

final recipeDetailProvider =
    AsyncNotifierProvider.family<SingleRecipeController, Recipe, int>(
        SingleRecipeController.new);

final recipeFilterProvider =
    NotifierProvider.autoDispose<RecipeFilterController, RecipeFilterModel?>(
        RecipeFilterController.new);

final stepProvider =
    NotifierProvider<RecipeStepController, int>(RecipeStepController.new);

final foodformProvider =
    NotifierProvider.autoDispose<FoodFormController, CustomFood?>(
        FoodFormController.new);
final customListProvider =
    AsyncNotifierProvider<CustomListController, List<CustomFood>>(
        CustomListController.new);
