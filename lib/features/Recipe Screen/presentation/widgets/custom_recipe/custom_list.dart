import 'package:flutter/material.dart';
import 'package:newproject/features/Recipe%20Screen/presentation/state/state.dart';
import 'package:newproject/features/Recipe%20Screen/presentation/widgets/custom_recipe/custom_recipe_form.dart';
import 'package:newproject/utils/exporter.dart';

class CustomList extends ConsumerWidget {
  const CustomList({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final customProvider = ref.watch(customListProvider);
    final customController = ref.read(customListProvider.notifier);
    return Scaffold(
      body: customProvider.when(
        data: (data) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(data[index].title ?? ''),
                trailing: IconButton(
                    onPressed: () {
                      customController.deleteItem(
                          context: context, item: data[index]);
                    },
                    icon: Icon(Icons.delete)),
              );
            },
            itemCount: data.length,
          );
        },
        loading: () => CircularProgressIndicator(),
        error: (error, stackTrace) => Text(stackTrace.toString()),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => CustomRecipeForm()))),
    );
  }
}
