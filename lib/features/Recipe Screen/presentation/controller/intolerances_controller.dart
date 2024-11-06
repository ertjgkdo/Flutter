import 'package:newproject/utils/exporter.dart';

class IntolerancesController extends Notifier<String?> {
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

  @override
  String build() {
    // TODO: implement build
    return intolerances.first;
  }

  selectIntolerance(String? intolerance) {
    state = intolerance;
  }
}
