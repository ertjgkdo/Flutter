import 'package:newproject/utils/exporter.dart';

class SortController extends Notifier<String?> {
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
  String build() {
    // TODO: implement build
    return sort.first;
  }

  selectSort(String? sort) {
    state = sort;
  }
}
