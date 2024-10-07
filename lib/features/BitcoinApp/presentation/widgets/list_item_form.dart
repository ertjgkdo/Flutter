import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:newproject/features/BitcoinApp/presentation/state/state.dart';

class ListItemForm extends ConsumerWidget {
  ListItemForm({super.key, required this.isEditing, this.index});
  final bool isEditing;

  int? index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listController = ref.read(listProvider.notifier);
    final inputController = listController.inputController;
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: "Enter item",
            suffixIcon: IconButton(
                onPressed: () {
                  if (inputController.text.isNotEmpty) {
                    if (isEditing) {
                      listController.updateByIndex(
                          index!, inputController.text);
                    } else {
                      listController.addItem(inputController.text);
                    }
                    inputController.clear();
                    ref.read(showFieldProvider.notifier).state = false;
                    ref.read(editingIndexProvider.notifier).state = null;
                  }
                },
                icon: Icon(Icons.save)),
          ),
          controller: inputController,
        ),
      ],
    );
  }
}
