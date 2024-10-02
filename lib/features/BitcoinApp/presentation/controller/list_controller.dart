import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newproject/features/BitcoinApp/presentation/state/state.dart';

class ListController extends Notifier<List<String>> {
  // decide initial value/state
  final TextEditingController inputController = TextEditingController();

  @override
  List<String> build() {
    return ["Test", "item2"];
  }

  addItem(String item) {
    // using cascade and method of list
    if (!state.contains(item)) {
      state = [...state..add(item)];
    } else {
      ref.read(errorMessageProvider.notifier).state =
          "An item with the title already exists!";
    }
  }

  updateItem(int index, String newValue) {
// update
    if (!state.contains(newValue)) {
      state = [...state..[index] = newValue];
    } else {
      ref.read(errorMessageProvider.notifier).state =
          "An item with the title already exists!";
    }
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
