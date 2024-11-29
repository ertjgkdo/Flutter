import 'package:newproject/features/Recipe%20Screen/domain/filter_recipe.dart';
import 'package:newproject/utils/exporter.dart';

class RecipeFilterController extends AutoDisposeNotifier<RecipeFilterModel?> {
  final List<String> cuisines = [
    'African',
    'Asian',
    'American',
    'British',
    'Cajun',
    'Caribbean',
    'Chinese',
    'Eastern European',
    'European',
    'French',
    'German',
    'Greek',
    'Indian',
    'Irish',
    'Italian',
    'Japanese',
    'Jewish',
    'Korean',
    'Latin American',
    'Mediterranean',
    'Mexican',
    'Middle Eastern',
    'Nordic',
    'Southern',
    'Spanish',
    'Thai',
    'Vietnamese',
  ];
  final List<String> intolerances = [
    'Dairy',
    'Egg',
    'Gluten',
    'Grain',
    'Peanut',
    'Seafood',
    'Sesame',
    'Shellfish',
    'Soy',
    'Sulfite',
    'Tree Nut',
    'Wheat',
  ];
  final List<String> sort = [
    'meta-score',
    'popularity',
    'healthiness',
    'price',
    'time',
    'random',
    'max-used-ingredients',
    'min-missing-ingredients',
    'alcohol',
    'caffeine',
    'copper',
    'energy',
    'calories',
    'calcium',
    'carbohydrates',
    'carbs',
    'choline',
    'cholesterol',
    'total-fat',
    'fluoride',
    'trans-fat',
    'saturated-fat',
    'mono-unsaturated-fat',
    'poly-unsaturated-fat',
    'fiber',
    'folate',
    'folic-acid',
    'iodine',
    'iron',
    'magnesium',
    'manganese',
    'vitamin-b3',
    'niacin',
    'vitamin-b5',
    'pantothenic-acid',
    'phosphorus',
    'potassium',
    'protein',
    'vitamin-b2',
    'riboflavin',
    'selenium',
    'sodium',
    'vitamin-b1',
    'thiamin',
    'vitamin-a',
    'vitamin-b6',
    'vitamin-b12',
    'vitamin-c',
    'vitamin-d',
    'vitamin-e',
    'vitamin-k',
    'sugar',
    'zinc',
  ];

  @override
  RecipeFilterModel build() {
    // TODO: implement build
    return RecipeFilterModel(
        cuisine: cuisines.first,
        sort: sort.first,
        intolerances: intolerances.first);
  }

  // updateFilter(RecipeFilterModel? filter) {
  //   state = RecipeFilterModel(
  //       cuisine: filter?.cuisine ?? state?.cuisine,
  //       sort: filter?.sort ?? state?.sort,
  //       intolerances: filter?.intolerances ?? state?.intolerances);
  // }

  selectCuisine(String? cuisine) {
    state = RecipeFilterModel(
        cuisine: cuisine, intolerances: state?.intolerances, sort: state?.sort);
  }

  selectIntolerances(String? intolerance) {
    state = RecipeFilterModel(
        cuisine: state?.cuisine, intolerances: intolerance, sort: state?.sort);
  }

  selectSort(String? sort) {
    state = RecipeFilterModel(
        cuisine: state?.cuisine, intolerances: state?.intolerances, sort: sort);
  }

  clear() {
    state = RecipeFilterModel();
  }
}
