import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newproject/features/BitcoinApp/presentation/state/state.dart';

class ListTracker extends ConsumerWidget {
  const ListTracker({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final list = ref.watch(listProvider);
    final listController = ref.read(listProvider.notifier);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => ListTile(
                trailing: IconButton(
                    onPressed: () {
                      listController.deleteIndex(index);
                    },
                    icon: Icon(Icons.delete)),
                title: Text(list[index]),
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
        child: Icon(Icons.add),
        onPressed: () {
          listController.addItem('hello');
        },
      ),
    );
  }
}
