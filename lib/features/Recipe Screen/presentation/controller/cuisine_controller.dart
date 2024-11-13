import 'package:newproject/utils/exporter.dart';

class CuisineController extends AutoDisposeNotifier<String?> {
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

  @override
  String build() {
    // TODO: implement build
    return cuisines.first;
  }

  selectCuisine(String? cuisine) {
    state = cuisine;
  }
}
