import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newproject/features/BitcoinApp/domain/log_model.dart';
import 'package:newproject/features/BitcoinApp/presentation/state/state.dart';

class ListItemFormNew extends StatefulWidget {
  const ListItemFormNew({super.key, this.item});
  final LogModel? item;

  @override
  State<ListItemFormNew> createState() => _ListItemFormNewState();
}

class _ListItemFormNewState extends State<ListItemFormNew> {
  late final TextEditingController titleController =
      TextEditingController(text: widget.item?.title);
  late final TextEditingController descController =
      TextEditingController(text: widget.item?.description);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final isEditing = widget.item != null;

  late LogModel currentItem = widget.item ?? const LogModel();
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final listController = ref.read(logListProvider.notifier);
      return Scaffold(
        appBar: AppBar(),
        body: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  currentItem = currentItem.copyWith(title: value);
                },
                decoration: const InputDecoration(
                  labelText: "Title",
                  // suffixIcon: IconButton(
                  //     onPressed: () {}, icon: const Icon(Icons.save)),
                ),
                controller: titleController,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Title is required";
                  }

                  if (value!.length < 3) {
                    return "Title should be atleast 3 characters";
                  }
                  return null;
                },
              ),
              TextFormField(
                onChanged: (value) {
                  currentItem = currentItem.copyWith(description: value);
                },
                decoration: InputDecoration(
                  labelText: "Description",
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.save)),
                ),
                controller: descController,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Description is required";
                  }

                  if (value!.length < 3) {
                    return "Description should be atleast 3 characters";
                  }
                  return null;
                },
              ),
              // TextFormField(
              //   decoration: InputDecoration(
              //     labelText: "Date",
              //     suffixIcon:
              //         IconButton(onPressed: () {}, icon: const Icon(Icons.save)),
              //   ),
              //   controller: listController.dateController,
              //   validator: (value) {
              //     if (value != null && value.isEmpty) return "Date is required";

              //     if (value!.length < 3) {
              //       return "Date should be atleast 3 characters";
              //     }
              //     return null;
              //   },
              // ),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pop(context);
                      if (isEditing) {
                        // editing existing entry
                        listController.update(
                          context: context,
                          item: currentItem.copyWith(dateTime: DateTime.now()),
                        );
                      } else {
                        // creating new entry
                        listController.addItem(context,
                            item:
                                currentItem.copyWith(dateTime: DateTime.now()));
                      }
                    } else {
                      //
                    }
                  },
                  child: Text(isEditing ? "Save" : "Add"))
            ]
                .map((e) => Container(
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      child: e,
                    ))
                .toList(),
          ),
        ),
      );
    });
  }
}
