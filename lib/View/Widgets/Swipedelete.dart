// //
// //
// // import 'dart:js';
// //
// // import 'package:flutter/material.dart';
// //
// // Widget buildDismissibleItem(int index) {
// //   final item = items[index];
// //
// //   return Dismissible(
// //     key: Key(item), // Each Dismissible item must have a unique key
// //     direction: DismissDirection.endToStart, // Swipe from right to left
// //     onDismissed: (direction) {
// //       // Remove the item from the data source when swiped
// //       items.removeAt(index);
// //
// //       // Show a snackbar to notify the user that the item is deleted
// //       ScaffoldMessenger.of(context as BuildContext).showSnackBar(
// //         SnackBar(
// //           content: Text('$item dismissed'),
// //           action: SnackBarAction(
// //             label: 'Undo',
// //             onPressed: () {
// //               // Restore the item when the "Undo" button is pressed
// //               items.insert(index, item);
// //             },
// //           ),
// //         ),
// //       );
// //     },
// //     background: Container(
// //       color: Colors.red,
// //       alignment: Alignment.centerRight,
// //       padding: EdgeInsets.only(right: 16.0),
// //       child: Icon(Icons.delete, color: Colors.white),
// //     ),
// //     child: ListTile(title: Text(item)),
// //   );
// // }
// // }
//
// import 'package:flutter/material.dart';
//
// import '../../Responsive/Responsiveclass.dart';
// import 'package:flutter/material.dart';
//
// class SwipeToDeleteWidget extends StatefulWidget {
//   final Widget child;
//   final Function() onDismissed;
//
//   const SwipeToDeleteWidget({
//     Key? key,
//     required this.child,
//     required this.onDismissed,
//   }) : super(key: key);
//
//   @override
//   _SwipeToDeleteWidgetState createState() => _SwipeToDeleteWidgetState();
// }
//
// class _SwipeToDeleteWidgetState extends State<SwipeToDeleteWidget> {
//   bool _dismissed = false;
//   double _dragExtent = 0;
//
//   void _handleDismiss() {
//     setState(() {
//       _dismissed = true;
//     });
//     widget.onDismissed();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _dismissed
//         ? Container() // or any placeholder widget when dismissed
//         : GestureDetector(
//       onHorizontalDragUpdate: (details) {
//         _dragExtent += details.delta.dx;
//       },
//       onHorizontalDragEnd: (_) {
//         if (_dragExtent < -50) {
//           _handleDismiss();
//         } else {
//           setState(() {
//             _dragExtent = 0;
//           });
//         }
//       },
//       child: Stack(
//         children: [
//           widget.child,
//           Positioned(
//             top: 0,
//             bottom: 0,
//             right: 0,
//             child: Container(
//               color: Colors.red,
//               alignment: Alignment.centerRight,
//               padding: EdgeInsets.only(right: 16.0),
//               child: Icon(Icons.delete, color: Colors.white),
//               width: _dragExtent < 0 ? -_dragExtent : 0,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
