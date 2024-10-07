import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newproject/features/BitcoinApp/presentation/state/state.dart';

class ListController extends Notifier<List<String>> {
  // decide initial value/state
  final TextEditingController inputController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  List<String> build() {
    return ["Test", "item2"];
  }

  addItem(String item) {
    // using cascade and method of list
    if (!state
        .map((existingItem) => existingItem.toLowerCase())
        .contains(item.toLowerCase())) {
      state = [...state..add(item)];
    } else {
      ref.read(errorMessageProvider.notifier).state =
          "An item with the title already exists!";
    }
  }

  update(String item) {
    final index =
        state.indexWhere((value) => value.toLowerCase() == item.toLowerCase());
    if (index != -1) updateByIndex(index, item);
  }

  updateByIndex(int index, String newValue) {
// update
    if (!state
        .map((existingItem) => existingItem.toLowerCase())
        .contains(newValue.toLowerCase())) {
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
