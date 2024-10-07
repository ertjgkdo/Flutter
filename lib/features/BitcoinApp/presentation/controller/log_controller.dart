import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newproject/features/BitcoinApp/domain/log_model.dart';
import 'package:newproject/features/BitcoinApp/presentation/widgets/list_form.dart';

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
    // if (!state

    //     ) {
    state = [...state..add(item)];

    // show success snack bar here using context
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.green,
        content: Text("Item Added!"),
      ),
    );

    // } else {
    //   ref.read(errorMessageProvider.notifier).state =
    //       "An item with the title already exists!";
    // }
  }

  update(LogModel item) {
    final index = state.indexWhere((value) => value.id == item.id);
    if (index != -1) updateByIndex(index, item);
  }

  updateByIndex(int index, LogModel newValue) {
// update
    // if (!state
    //     .map((existingItem) => existingItem.toLowerCase())
    //     .contains(newValue.toLowerCase())) {
    state = [...state..[index] = newValue];
    // } else {
    //   ref.read(errorMessageProvider.notifier).state =
    //       "An item with the title already exists!";
    // }
  }

  deleteIndex(int index) {
    state = [...state..removeAt(index)];
  }

  delete(LogModel item) {
// remove

    state = [...state..remove(item)];
  }

  clear() {
// clear

    state = [];
  }
}
