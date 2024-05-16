//
// import 'package:flutter/material.dart';
// import 'package:saha_new/Driverlast.dart';
// import 'package:saha_new/driverlogin.dart';
// import 'package:saha_new/driverlogin1.dart';
// import 'package:saha_new/driverlogin2.dart';
// import 'package:saha_new/popup.dart';
// import 'package:saha_new/uord.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// // class DriverPage extends StatefulWidget {
// //   final Map<String, dynamic>? driverDetails;
// //
// //   const DriverPage({Key? key, this.driverDetails}) : super(key: key);
// //
// //   @override
// //   _DriverPageState createState() => _DriverPageState();
// // }
// //
// // class _DriverPageState extends State<DriverPage> {
// //   late bool isAvailable; // Initially set to false
// //   late CollectionReference driversCollection;
// //   late String? phoneNumber;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     isAvailable = false;
// //     driversCollection = FirebaseFirestore.instance.collection('Drivers');
// //     fetchPhoneNumber();
// //   }
// //
// //   Future<void> fetchPhoneNumber() async {
// //     try {
// //       var user = FirebaseAuth.instance.currentUser;
// //       if (user != null) {
// //         // Get the user's UID
// //         String userId = user.uid;
// //
// //         // Retrieve user's phone number from Firestore
// //         DocumentSnapshot snapshot =
// //         await FirebaseFirestore.instance.collection('Drivers').doc(userId).get();
// //         setState(() {
// //           phoneNumber = snapshot.get('phone');
// //         });
// //       } else {
// //         print('No user signed in.');
// //       }
// //     } catch (error) {
// //       print('Error fetching phone number: $error');
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Driver Page'),
// //         automaticallyImplyLeading: false, // Remove the back arrow button
// //         actions: [
// //           PopupMenuButton(
// //             onSelected: (value) async {
// //               if (value == 'logout') {
// //                 // Handle logout option
// //                 try {
// //                   // Sign out the current user
// //                   await FirebaseAuth.instance.signOut();
// //                   // Navigate to the login page
// //                   Navigator.pushReplacement(
// //                     context,
// //                     MaterialPageRoute(builder: (context) => DriverLoginPage()),
// //                   );
// //                 } catch (error) {
// //                   print('Error signing out: $error');
// //                   // Show error message or handle error as needed
// //                 }
// //               }
// //             },
// //             itemBuilder: (BuildContext context) {
// //               return [
// //                 PopupMenuItem(
// //                   value: 'about',
// //                   child: Text('About'),
// //                 ),
// //                 PopupMenuItem(
// //                   value: 'logout',
// //                   child: Text('Logout'),
// //                 ),
// //               ];
// //             },
// //           ),
// //         ],
// //         // Remove the actions list to remove the right arrow button
// //       ),
// //       body: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           // Availability Toggle Switch
// //           Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 Text(
// //                   'Availability',
// //                   style: TextStyle(
// //                     fontSize: 16.0,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //                 SizedBox(width: 10.0),
// //                 Switch(
// //                   value: isAvailable,
// //                   onChanged: (bool newValue) {
// //                     setState(() {
// //                       isAvailable = newValue;
// //                     });
// //                     updateAvailability(newValue);
// //                   },
// //                 ),
// //               ],
// //             ),
// //           ),
// //           // Centered Greetings Text Widget
// //           Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: Center(
// //               child: Text(
// //                 'Greetings, Driver\'s Name',
// //                 style: TextStyle(
// //                   fontSize: 18.0,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //             ),
// //           ),
// //           // Profile Panel Widget
// //           Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: Container(
// //               width: double.infinity,
// //               padding: EdgeInsets.all(16.0),
// //               decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.circular(10.0),
// //                 color: Colors.grey[200],
// //               ),
// //               child: Column(
// //                 children: [
// //                   // Profile Photo Widget
// //                   CircleAvatar(
// //                     radius: 50.0,
// //                     backgroundImage: AssetImage('assets/avatar.png'),
// //                   ),
// //                   SizedBox(height: 16.0),
// //                   // Driver ID Text Widget
// //                   Text(
// //                     'Driver\'s ID: 123456',
// //                     style: TextStyle(
// //                       fontSize: 16.0,
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                   ),
// //                   SizedBox(height: 16.0),
// //                   // Phone Number Text Widget
// //                   Text(
// //                     'Phone No: $phoneNumber',
// //                     style: TextStyle(
// //                       fontSize: 14.0,
// //                     ),
// //                   ),
// //                   SizedBox(height: 16.0),
// //                   // Other Details Text Widget
// //                   Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text(
// //                         'Username: Driver Username',
// //                         style: TextStyle(fontSize: 14.0),
// //                       ),
// //                       SizedBox(height: 8.0),
// //                       Text(
// //                         'Vehicle Model: ABC123',
// //                         style: TextStyle(fontSize: 14.0),
// //                       ),
// //                       SizedBox(height: 8.0),
// //                       Text(
// //                         'License Plate No: XYZ123',
// //                         style: TextStyle(fontSize: 14.0),
// //                       ),
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(builder: (context) => PopupPage()),
// //                     );
// //                   },
// //                   child: Text('Open Popup'),
// //                 ),
// //                 SizedBox(width: 10), // Add spacing between buttons
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(builder: (context) => DriverLast()),
// //                     );
// //                   },
// //                   child: Text('Last'),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
//
// //
// class DriverPage extends StatefulWidget {
//   final Map<String, dynamic>? driverDetails;
//
//   const DriverPage({Key? key, this.driverDetails}) : super(key: key);
//
//   @override
//   _DriverPageState createState() => _DriverPageState();
// }
//
// class _DriverPageState extends State {
//   late bool isAvailable; // Initially set to false
//   late CollectionReference driversCollection;
//
//   @override
//   void initState() {
//     super.initState();
//     isAvailable = false;
//     driversCollection = FirebaseFirestore.instance.collection('Drivers');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     //ValueNotifier<bool> isAvailable = ValueNotifier<bool>(false); // Initially set to false
//     return Scaffold(
//       appBar: AppBar(
//           title: Text('Driver Page'),
//           automaticallyImplyLeading: false, // Remove the back arrow button
//           actions: [
//             PopupMenuButton(
//               onSelected: (value) async {
//                 if (value == 'logout') {
//                   // Handle logout option
//                   try {
//                     // Sign out the current user
//                     await FirebaseAuth.instance.signOut();
//                     // Navigate to the login page
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => DriverLoginPage()),
//                     );
//                   } catch (error) {
//                     print('Error signing out: $error');
//                     // Show error message or handle error as needed
//                   }
//                 }
//               },
//               itemBuilder: (BuildContext context) {
//                 return [
//                   PopupMenuItem(
//                     value: 'about',
//                     child: Text('About'),
//                   ),
//                   PopupMenuItem(
//                     value: 'logout',
//                     child: Text('Logout'),
//                   ),
//                 ];
//               },
//             ),
//           ]
//         // Remove the actions list to remove the right arrow button
//       ),
//
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Availability Toggle Switch
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Availability',
//                   style: TextStyle(
//                     fontSize: 16.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(width: 10.0),
//                 Switch(
//                   value: isAvailable,
//                   onChanged: (bool newValue) {
//                     setState(() {
//                       isAvailable = newValue;
//                     });
//                     updateAvailability(newValue);
//                   },
//                 ),
//               ],
//             ),
//           ),
//           // Centered Greetings Text Widget
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Center(
//               child: Text(
//                 'Greetings, Driver\'s Name',
//                 style: TextStyle(
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           // Profile Panel Widget
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               width: double.infinity,
//               padding: EdgeInsets.all(16.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10.0),
//                 color: Colors.grey[200],
//               ),
//               child: const Column(
//                 children: [
//                   // Profile Photo Widget
//                   CircleAvatar(
//                     radius: 50.0,
//                     backgroundImage: AssetImage('assets/avatar.png'),
//                   ),
//                   SizedBox(height: 16.0),
//                   // Driver ID Text Widget
//                   Text(
//                     'Driver\'s ID: 123456',
//                     style: TextStyle(
//                       fontSize: 16.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 16.0),
//                   // Details Text Widget
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Username: Driver Username',
//                         style: TextStyle(fontSize: 14.0),
//                       ),
//                       SizedBox(height: 8.0),
//                       Text(
//                         'Phone No:',
//                         style: TextStyle(fontSize: 14.0),
//                       ),
//                       SizedBox(height: 8.0),
//                       Text(
//                         'Vehicle Model: ABC123',
//                         style: TextStyle(fontSize: 14.0),
//                       ),
//                       SizedBox(height: 8.0),
//                       Text(
//                         'License Plate No: XYZ123',
//                         style: TextStyle(fontSize: 14.0),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//
//           Padding(
//             padding: const EdgeInsets.symmetric(
//                 vertical: 16.0, horizontal: 8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) =>
//                           PopupPage()), // Replace PopupPage with your actual popup page
//                     );
//                   },
//                   child: Text('Open Popup'),
//                 ),
//                 SizedBox(width: 10), // Add spacing between buttons
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) =>
//                           DriverLast()), // Navigate to DriverLast page
//                     );
//                   },
//                   child: Text('Last'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void updateAvailability(bool newValue) async {
//     try {
//       var user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         // Get the user's UID
//         String userId = user.uid;
//
//         // Update the 'availability' field in the database
//         await driversCollection.doc(userId).update({'availability': newValue});
//       } else {
//         print('No user signed in.');
//       }
//     } catch (error) {
//       print('Error updating availability: $error');
//       // Show error message or handle error as needed
//     }
//   }
// }
//
//
