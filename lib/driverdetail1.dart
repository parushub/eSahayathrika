// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:sample/driverlast.dart';
// import 'package:sample/driverlogin.dart';
// import 'package:sample/popup.dart';
// import 'package:sample/uord.dart';
//
//
// /*class DriverPage extends StatefulWidget {
//   final Map<String, dynamic>? driverDetails;
//
//   DriverPage({Key? key, this.driverDetails}) : super(key: key);
//
//   @override
//   _DriverPageState createState() => _DriverPageState();
// }
//
// class _DriverPageState extends State
//
// {
//
//   @override
//   Widget build(BuildContext context) {
//     bool isAvailable = false; // Initially set to false
//     return Scaffold(
//       appBar: AppBar(
//           title: Text('Driver Page'),
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => UserTypeSelectionPage()), // Navigate to UserTypeSelectionPage
//               );
//             },
//           ),
//           actions: [
//             PopupMenuButton(
//               onSelected: (value) {
//                 if (value == 'logout') {
//                   // Handle logout option
//                   // Navigate to login page
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (context) => DriverLoginPage()),
//                   );
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
//                   value: isAvailable, // Set value based on availability
//                   onChanged: (bool value) {
//                     setState(() {
//                       isAvailable = value; // Update availability state
//                     });
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
//               child: Column(
//                 children: [
//                   // Profile Photo Widget
//                   CircleAvatar(
//                     radius: 50.0,
//                     backgroundImage: AssetImage('assets/driver_profile.jpg'), // Replace with actual image path
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
//                         'Phone No': $phoneNumber,
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
//             padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => PopupPage()), // Replace PopupPage with your actual popup page
//                     );
//                   },
//                   child: Text('Open Popup'),
//                 ),
//                 SizedBox(width: 10), // Add spacing between buttons
//                 ElevatedButton(
//                   onPressed: () {
//                     var userData;
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => DriverLast()), // Navigate to DriverLast page
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
// }*/
//
//
// class DriverPage extends StatefulWidget {
//   final Map<String, dynamic>? driverDetails;
//
//   DriverPage({Key? key, this.driverDetails}) : super(key: key);
//
//   @override
//   _DriverPageState createState() => _DriverPageState();
// }
//
// class _DriverPageState extends State<DriverPage> {
//   late bool isAvailable;
//   late CollectionReference driverCollection;
//   @override
//   void initState(){
//     super.initState();
//     isAvailable=false;
//     driverCollection=FirebaseFirestore.instance.collection('driver');
//   }
//   @override
//   Widget build(BuildContext context) {
//     //bool isAvailable = false; // Initially set to false
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Driver Page'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => UserTypeSelectionPage()), // Navigate to UserTypeSelectionPage
//             );
//           },
//         ),
//         actions: [
//           PopupMenuButton(
//             onSelected: (value) {
//               if (value == 'logout') {
//                 // Handle logout option
//                 // Navigate to login page
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => DriverLoginPage()),
//                 );
//               }
//             },
//             itemBuilder: (BuildContext context) {
//               return [
//                 PopupMenuItem(
//                   value: 'about',
//                   child: Text('About'),
//                 ),
//                 PopupMenuItem(
//                   value: 'logout',
//                   child: Text('Logout'),
//                 ),
//               ];
//             },
//           ),
//         ],
//       ),
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
//                 'Greetings, ${widget.driverDetails?['username'] ?? 'Driver'}',
//                 style: TextStyle(
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//
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
//               child: Column(
//                 children: [
//                   // Profile Photo Widget
//                   CircleAvatar(
//                     radius: 50.0,
//                     backgroundImage: AssetImage('assets/driver_profile.jpg'), // Replace with actual image path
//                   ),
//                   SizedBox(height: 16.0),
//                   // Driver ID Text Widget
//                   Text(
//                     'Driver\'s ID: ${widget.driverDetails?['id'] ?? 'N/A'}',
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
//                         'Username: ${widget.driverDetails?['username'] ?? 'N/A'}',
//                         style: TextStyle(fontSize: 14.0),
//                       ),
//                       SizedBox(height: 8.0),
//                       Text(
//                         'Phone No: ${widget.driverDetails?['phone'] ?? 'N/A'}',
//                         style: TextStyle(fontSize: 14.0),
//                       ),
//                       SizedBox(height: 8.0),
//                       Text(
//                         'Vehicle Model: ${widget.driverDetails?['vehicleModel'] ?? 'N/A'}',
//                         style: TextStyle(fontSize: 14.0),
//                       ),
//                       SizedBox(height: 8.0),
//                       Text(
//                         'License Plate No: ${widget.driverDetails?['licensePlate'] ?? 'N/A'}',
//                         style: TextStyle(fontSize: 14.0),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => PopupPage()), // Replace PopupPage with your actual popup page
//                     );
//                   },
//                   child: Text('Open Popup'),
//                 ),
//                 SizedBox(width: 10), // Add spacing between buttons
//                 ElevatedButton(
//                   onPressed: () {
//                     var userData;
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => DriverLast()), // Navigate to DriverLast page
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
//         await driverCollection.doc(userId).update({'availability': newValue});
//       } else {
//         print('No user signed in.');
//       }
//     } catch (error) {
//       print('Error updating availability: $error');
//       // Show error message or handle error as needed
//     }
//   }
// }