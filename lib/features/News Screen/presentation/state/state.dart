import 'package:newproject/features/News%20Screen/domain/news_model.dart';
import 'package:newproject/features/News%20Screen/presentation/controller/async_controller.dart';
import 'package:newproject/features/News%20Screen/presentation/controller/category_controller.dart';
import 'package:newproject/features/News%20Screen/presentation/controller/country_controller.dart';
import 'package:newproject/utils/exporter.dart';

final newsListProvider = AsyncNotifierProvider<NewsListController, NewsModel>(
    NewsListController.new);

final categoryProvider =
    NotifierProvider<CategoryController, String>(CategoryController.new);
final countryProvider =
    NotifierProvider<CountryController, String>(CountryController.new);
