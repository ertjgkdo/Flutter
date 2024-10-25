import 'package:newproject/features/BitcoinApp/presentation/state/state.dart';
import 'package:newproject/utils/exporter.dart';

class ListTracker extends ConsumerWidget {
  const ListTracker({super.key});

  @override
  Widget build(BuildContext context, ref) {
    //final list = ref.watch(listProvider);
    storage;
    final listLength = ref.watch(logListProvider.select(
      (value) => value.length,
    ));
    final listController = ref.read(logListProvider.notifier);
    // listController.jsonConverter();
    // print("UI updated");
    // final errorMessage = ref.watch(errorMessageProvider);
    // final listController = ref.read(listProvider.notifier);
    // final showTextfield = ref.watch(showFieldProvider);
    // final isEditing = ref.watch(editingProvider);
    // final editingIndex = ref.watch(editingIndexProvider);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 15),
              itemBuilder: (context, index) {
                return Consumer(builder: (context, ref, child) {
                  print(index);

                  final item = ref.watch(logListProvider.select(
                      (value) => value.length > index ? value[index] : null));

                  return ListTile(
                    onTap: () {
                      listController.showForm(context, item: item);
                    },
                    trailing: SizedBox(
                      child: IconButton(
                          onPressed: () {
                            listController.deleteIndex(context, index: index);
                          },
                          icon: const Icon(
                            Icons.delete,
                            size: 20,
                          )),
                    ),
                    title: Text("${item?.title}"),
                    subtitle: Text("${item?.description}"),
                    leading: Text("${item?.date?.hour}: ${item?.date?.minute}"),
                  );
                });
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: listLength,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            listController.showForm(
              context,
            );
          },
          child: const Icon(Icons.add)),
    );
  }
}
