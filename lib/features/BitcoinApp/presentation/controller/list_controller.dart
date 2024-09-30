import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListController extends Notifier<List<String>> {
  // decide initial value/state
  final TextEditingController inputController = TextEditingController();
  @override
  List<String> build() {
    return ["Test", "item2"];
  }

  addItem(String item) {
    // using cascade and method of list
    state = [...state..add(item)];
  }

  updateItem(int index, String newValue) {
// update
    state = [...state..[index] = newValue];
  }

  deleteIndex(int index) {
    state = [...state..removeAt(index)];
  }

  delete(String item) {
// remove

    state = [...state..remove(item)];
  }

  clear() {
// clear

    state = [];
  }
}
