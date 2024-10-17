import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newproject/features/BitcoinApp/domain/log_model.dart';
import 'package:newproject/features/BitcoinApp/presentation/widgets/list_form.dart';
import 'package:uuid/uuid.dart';

class LogController extends Notifier<List<LogModel>> {
  // decide initial value/state

  @override
  List<LogModel> build() {
    return [];
  }

  showForm(BuildContext context, {LogModel? item}) {
    // use dialog for same page form

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ListItemFormNew(
        item: item,
      ),
    ));
  }

  addItem(BuildContext context, {required LogModel item}) {
    // using cascade and method of list
    bool doesItemExist =
        state.any((existingItem) => existingItem.title == item.title);
    if (!doesItemExist) {
      state = [...state..add(item.copyWith(id: const Uuid().v6()))];

      // show success snack bar here using context
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text("Item Added!"),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Item already exists!"),
        ),
      );
    }

    // } else {
    //   ref.read(errorMessageProvider.notifier).state =
    //       "An item with the title already exists!";
    // }
  }

  update({required BuildContext context, required LogModel item}) {
    final index = state.indexWhere((value) => value.id == item.id);

    if (index != -1) {
      if (item == state[index]) print("NO changes made");
      updateByIndex(context: context, index: index, newValue: item);
    }
  }

  updateByIndex(
      {required BuildContext context,
      required int index,
      required LogModel newValue}) {
// update

    state = [...state..[index] = newValue];
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.green,
        content: Text("Item Updated!"),
      ),
    );
  }

  Future<void> deleteIndex(BuildContext context, {required int index}) async {
    bool? confirm = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Delete'),
            ),
          ],
        );
      },
    );

    if (confirm == true) {
      state = [...state..removeAt(index)];
    }
  }

  delete(LogModel item) {
// remove

    state = [...state..remove(item)];
  }

  compare() {
    LogModel a = LogModel(title: "title1");
    LogModel b = LogModel(title: "title2");
    print(a == b);
  }

  clear() {
// clear

    state = [];
  }
}
