import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:newproject/features/News%20Screen/presentation/state/state.dart';
import 'package:newproject/utils/exporter.dart';

class NewsList extends ConsumerWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final newsProvider = ref.watch(newsListProvider);
    final newsController = ref.read(newsListProvider.notifier);
    return Scaffold(
        body: newsProvider.when(
      data: (news) {
        print(news.news!.length);
        return Column(
          children: [
            Row(
              children: [
                Consumer(builder: (context, ref, child) {
                  final category = ref.watch(categoryProvider);
                  final categoryController =
                      ref.read(categoryProvider.notifier);
                  final categories = categoryController.categories;
                  return DropdownMenu(
                      initialSelection: category,
                      onSelected: (value) =>
                          categoryController.selectCategory(value!),
                      dropdownMenuEntries: categories
                          .map((cat) =>
                              DropdownMenuEntry(value: cat, label: cat))
                          .toList());
                }),
                Consumer(builder: (context, ref, child) {
                  final country = ref.watch(countryProvider);
                  final countryController = ref.read(countryProvider.notifier);
                  final countries = countryController.countries;
                  return DropdownMenu(
                      initialSelection: country,
                      onSelected: (value) =>
                          countryController.selectCountry(value!),
                      dropdownMenuEntries: countries
                          .map((cat) =>
                              DropdownMenuEntry(value: cat, label: cat))
                          .toList());
                })
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final singleNews = news.news![index];
                  return ListTile(
                    title: Text("${singleNews.title}"),
                    leading: FlutterLogo(),
                  );
                },
                itemCount: news.news!.length,
              ),
            )
          ],
        );
      },
      error: (error, stackTrace) => Container(
        child: Text(error.toString()),
      ),
      loading: () => Center(child: CircularProgressIndicator()),
    ));
  }
}
