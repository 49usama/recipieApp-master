//
//
// import 'dart:js';
//
// import 'package:flutter/material.dart';
//
// Widget buildDismissibleItem(int index) {
//   final item = items[index];
//
//   return Dismissible(
//     key: Key(item), // Each Dismissible item must have a unique key
//     direction: DismissDirection.endToStart, // Swipe from right to left
//     onDismissed: (direction) {
//       // Remove the item from the data source when swiped
//       items.removeAt(index);
//
//       // Show a snackbar to notify the user that the item is deleted
//       ScaffoldMessenger.of(context as BuildContext).showSnackBar(
//         SnackBar(
//           content: Text('$item dismissed'),
//           action: SnackBarAction(
//             label: 'Undo',
//             onPressed: () {
//               // Restore the item when the "Undo" button is pressed
//               items.insert(index, item);
//             },
//           ),
//         ),
//       );
//     },
//     background: Container(
//       color: Colors.red,
//       alignment: Alignment.centerRight,
//       padding: EdgeInsets.only(right: 16.0),
//       child: Icon(Icons.delete, color: Colors.white),
//     ),
//     child: ListTile(title: Text(item)),
//   );
// }
// }