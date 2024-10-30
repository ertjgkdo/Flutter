import 'package:newproject/utils/exporter.dart';

class CategoryController extends Notifier<String> {
  final List<String> categories = [
    "business",
    "crime",
    "domestic",
    "education",
    "entertainment",
    "environment",
    "food",
    "health",
    "lifestyle",
    "other",
    "politics",
    "science",
    "sports",
    "technology",
    "top",
    "tourism",
    "world"
  ];

  @override
  String build() {
    // TODO: implement build
    return categories.first;
  }

  selectCategory(String? category) {
    state = category!;
  }
}
