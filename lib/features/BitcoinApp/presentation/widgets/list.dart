import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newproject/features/BitcoinApp/presentation/state/state.dart';

class ListTracker extends ConsumerWidget {
  const ListTracker({super.key});

  @override
  Widget build(BuildContext context, ref) {
    //final list = ref.watch(listProvider);
    final list = ref.watch(logListProvider);
    final listController = ref.read(logListProvider.notifier);
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
                final item = list[index];
                return ListTile(
                  onTap: () {
                    listController.showForm(context, item: item);
                  },
                  trailing: SizedBox(
                    child: IconButton(
                        onPressed: () {
                          listController.deleteIndex(index);
                        },
                        icon: const Icon(
                          Icons.delete,
                          size: 20,
                        )),
                  ),
                  title: Text("${item.title}"),
                  subtitle: Text("${item.description}"),
                  leading: Text("${item.date?.year}"),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: list.length,
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
