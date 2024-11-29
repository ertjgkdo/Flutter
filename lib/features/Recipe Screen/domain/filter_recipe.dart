class RecipeFilterModel {
  final String? cuisine;
  final String? sort;
  final String? intolerances;

  RecipeFilterModel({this.cuisine, this.intolerances, this.sort});
  String get cuisineQuery => cuisine == null ? "" : "&cuisine=$cuisine";
  String get sortQuery => sort == null ? "" : "&sort=$sort";
  String get intoleranceQuery =>
      intolerances == null ? "" : "&intolerance=$intolerances";

  String get query => cuisineQuery + sortQuery + intoleranceQuery;
}
