import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newproject/features/BitcoinApp/domain/log_model.dart';
import 'package:newproject/features/BitcoinApp/presentation/widgets/list_form.dart';
import 'package:newproject/utils/exporter.dart';
import 'package:uuid/uuid.dart';

class LogController extends Notifier<List<LogModel>> {
  // decide initial value/state

  @override
  List<LogModel> build() {
    load();
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

  final key = 'loglist';
  load() async {
    final data = await storage.read(key: key);
    if (data != null) {
      state = logModelFromJson(data);
    }
  }

  jsonConverter() {
    try {
      final jsondata = '[{"title": "Hello"}, {"title":"Hi"}]';
      // List<Map<String, dynamic>> data = json.decode(jsondata);

      final data = json.decode(jsondata);

      print(data);
      // print(data[0]["title"]);

      final value = List<LogModel>.from(
          data.map((item) => LogModel(title: item["title"])));
      print(value);

      print(json.encode(value[0].toJson()));
    } catch (e, s) {
      print("$e $s");
    }
  }

  store() async {
    await storage.write(key: key, value: logModelToJson(state));
  }

  addItem(BuildContext context, {required LogModel item}) async {
    // using cascade and method of list
    bool doesItemExist =
        state.any((existingItem) => existingItem.title == item.title);
    if (!doesItemExist) {
      state = [...state..add(item.copyWith(id: const Uuid().v6()))];

      await store();
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
      required LogModel newValue}) async {
// update

    state = [...state..[index] = newValue];
    await store();
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
      await store();
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
