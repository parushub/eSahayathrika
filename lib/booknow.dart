//
// //import 'package:esahayathrika/confirmbook.dart';
// import 'package:flutter/material.dart';
// import 'package:saha_new/confirmbook.dart';
// //import 'package:esahayathrika/home.dart'; // Import your home page
//
// class BookNowPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // Back arrow leading to navigate back to the home page
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 20.0),
//             // Text: 'BOOK YOUR JOURNEY'
//             Text(
//               'BOOK YOUR JOURNEY',
//               style: TextStyle(
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10.0),
//             // Text: 'Where do you want to go?'
//             Text(
//               'Where do you want to go?',
//               style: TextStyle(
//                 fontSize: 18.0,
//               ),
//             ),
//             SizedBox(height: 20.0),
//             // Fields
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Pick-up',
//                 border: OutlineInputBorder(),
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.map),
//                   onPressed: () {
//                     // Handle map icon pressed for pick-up field
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(height: 10.0),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Drop-off',
//                 border: OutlineInputBorder(),
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.map),
//                   onPressed: () {
//                     // Handle map icon pressed for drop-off field
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(height: 10.0),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Emergency contact',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 20.0),
//             // Confirm button
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => ConfirmBookPage()),
//                   );
//                   // Handle confirm button pressed
//                 },
//                 child: Text('Confirm'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
