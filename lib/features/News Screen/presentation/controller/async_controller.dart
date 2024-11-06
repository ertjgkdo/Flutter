import 'dart:async';

import 'package:http/http.dart';
import 'package:newproject/features/News%20Screen/domain/news_model.dart';
import 'package:newproject/features/News%20Screen/presentation/state/state.dart';
import 'package:newproject/utils/exporter.dart';

class NewsListController extends AsyncNotifier<NewsModel> {
  final client = Client();
  @override
  FutureOr<NewsModel> build() async {
    return load();
  }

  Future<NewsModel> load() async {
    // state = const AsyncLoading();
    // state = AsyncData([]);

    final category = ref.watch(categoryProvider);
    final country = ref.watch(countryProvider);
    final response = await client.get(Uri.parse(
        "https://newsdata.io/api/1/latest?apikey=pub_57713b6a12a2be1e75a1616dc05716d015233&category=$category&country=$country"));
    // print(response);
    try {
      if (response.statusCode == 200) {
        // print(response.body);
        return newsModelFromJson(response.body);

        // Success status code for get request is 200
      } else {
        throw "${response.statusCode} ${response.reasonPhrase}";
      }
    } catch (e) {
      rethrow;
    }
  }

  refresh() async {
    // state = const AsyncLoading();
    state = await AsyncValue.guard(() => load());
  }
}
