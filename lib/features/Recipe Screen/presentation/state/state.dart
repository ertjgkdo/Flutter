import 'package:newproject/features/Recipe%20Screen/domain/recipe_model.dart';
import 'package:newproject/features/Recipe%20Screen/presentation/controller/async_controller.dart';
import 'package:newproject/features/Recipe%20Screen/presentation/controller/cuisine_controller.dart';
import 'package:newproject/features/Recipe%20Screen/presentation/controller/intolerances_controller.dart';
import 'package:newproject/features/Recipe%20Screen/presentation/controller/sort_controller.dart';
import 'package:newproject/utils/exporter.dart';

final recipeListProvider =
    AsyncNotifierProvider<RecipeController, RecipeModel>(RecipeController.new);

final cuisineProvider =
    NotifierProvider<CuisineController, String?>(CuisineController.new);

final intoleranceProvider = NotifierProvider<IntolerancesController, String?>(
    IntolerancesController.new);
final sortProvider =
    NotifierProvider<SortController, String?>(SortController.new);
