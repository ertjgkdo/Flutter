import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newproject/features/BitcoinApp/presentation/state/state.dart';
import 'package:newproject/features/BitcoinApp/presentation/widgets/list_item_form.dart';

class ListTracker extends ConsumerWidget {
  const ListTracker({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final list = ref.watch(listProvider);
    final listController = ref.read(listProvider.notifier);
    final inputcontroller = listController.inputController;
    return Scaffold(
      body: Column(
        children: [
          ListItemForm(),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => ListTile(
                trailing: IconButton(
                    onPressed: () {
                      listController.deleteIndex(index);
                    },
                    icon: const Icon(Icons.delete)),
                title: Text(list[index]),
                leading: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    listController.updateItem(index, inputcontroller.text);
                  },
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: list.length,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          if (inputcontroller.text.isNotEmpty) {
            listController.addItem(inputcontroller.text);
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
