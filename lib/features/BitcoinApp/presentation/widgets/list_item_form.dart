import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:newproject/features/BitcoinApp/presentation/state/state.dart';

class ListItemForm extends ConsumerWidget {
  ListItemForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listController = ref.read(listProvider.notifier);
    final inputController = listController.inputController;
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(labelText: "Enter item"),
          controller: inputController,
        ),
      ],
    );
  }
}
