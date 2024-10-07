// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:newproject/features/BitcoinApp/presentation/state/state.dart';
// import 'package:newproject/features/BitcoinApp/presentation/widgets/list_item_form.dart';

// class ListTracker extends ConsumerWidget {
//   const ListTracker({super.key});

//   @override
//   Widget build(BuildContext context, ref) {
//     //final list = ref.watch(listProvider);
//     final logs = ref.watch(logListProvider);
//     final logController = ref.read(logListProvider.notifier);
//     // final errorMessage = ref.watch(errorMessageProvider);
//     // final listController = ref.read(listProvider.notifier);
//     // final showTextfield = ref.watch(showFieldProvider);
//     // final isEditing = ref.watch(editingProvider);
//     // final editingIndex = ref.watch(editingIndexProvider);
//     return Scaffold(
//       body: Column(
//         children: [
//           if (errorMessage != null)
//             Card(
//                 color: Colors.grey,
//                 child: ListTile(
//                     title: Text(
//                       errorMessage,
//                       style: const TextStyle(color: Colors.white),
//                     ),
//                     trailing: IconButton(
//                         icon: const Icon(Icons.close),
//                         onPressed: () {
//                           ref.read(errorMessageProvider.notifier).state = null;
//                         }))),
//           if (showTextfield)
//             ListItemForm(
//               isEditing: isEditing,
//               index: editingIndex,
//             ),
//           Expanded(
//             child: ListView.separated(
//               itemBuilder: (context, index) {
//                 if (index == list.length) {
//                   return Center(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         ref.read(showFieldProvider.notifier).state = true;
//                         ref.read(editingProvider.notifier).state = false;
//                       },
//                       child: Icon(Icons.add),
//                     ),
//                   );
//                 }
//                 return ListTile(
//                   trailing: SizedBox(
//                     width: 80,
//                     child: Wrap(
//                       children: [
//                         IconButton(
//                           icon: const Icon(Icons.edit),
//                           onPressed: () {
//                             ref.read(showFieldProvider.notifier).state = true;
//                             ref.read(editingProvider.notifier).state = true;
//                             ref.read(editingIndexProvider.notifier).state =
//                                 index;
//                             final item = list[index];
//                           },
//                         ),
//                         IconButton(
//                             onPressed: () {
//                               listController.deleteIndex(index);
//                             },
//                             icon: const Icon(
//                               Icons.delete,
//                               size: 20,
//                             )),
//                       ],
//                     ),
//                   ),
//                   title: Text(list[index]),
//                 );
//               },
//               separatorBuilder: (context, index) => const SizedBox(
//                 height: 10,
//               ),
//               itemCount: list.length + 1,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
