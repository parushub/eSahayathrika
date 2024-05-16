// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:saha_new/driverdetail.dart';
// import 'package:saha_new/driverdetail2.dart';
// import 'package:saha_new/uord.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:onesignal_flutter/onesignal_flutter.dart'; // Import OneSignal package
//
// class DriverLoginPage extends StatelessWidget {
//   final TextEditingController phoneNumberController = TextEditingController();
//
//   Future<Map<String, dynamic>?> getDriverDetails(String phoneNumber) async {
//     try {
//       QuerySnapshot<Map<String, dynamic>> querySnapshot =
//       await FirebaseFirestore.instance
//           .collection('Drivers')
//           .where('phone', isEqualTo: phoneNumber)
//           .get();
//
//       if (querySnapshot.docs.isNotEmpty) {
//         return querySnapshot.docs.first.data();
//       } else {
//         return null; // Driver document does not exist
//       }
//     } catch (error) {
//       print('Error retrieving driver details: $error');
//       return null;
//     }
//   }
//
//   void _handleLogin(BuildContext context) async {
//     String phoneNumber = phoneNumberController.text.trim();
//
//     // Perform validation on phone number
//     if (phoneNumber.isNotEmpty) {
//       try {
//         Map<String, dynamic>? driverDetails =
//         await getDriverDetails(phoneNumber) as Map<String, dynamic>;
//
//         if (driverDetails != null) {
//           // If driver exists, print their details
//           print('Driver details: $driverDetails');
//
//           // Retrieve OneSignal Player ID
//           OneSignal.shared.getDeviceState().then((deviceState) {
//             String? playerId = deviceState?.userId; // Retrieve Player ID
//             if (playerId != null) {
//               // Update Firestore document with OneSignal Player ID
//               FirebaseFirestore.instance
//                   .collection('Drivers')
//                   .doc(driverDetails['id']) // Assuming 'id' is the document ID of the driver
//                   .update({'OneSignalID': playerId});
//             }
//           });
//
//           // Navigate to the driver detail page and pass the details
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (context) => DriverPage(driverDetails: driverDetails),
//             ),
//           );
//         } else {
//           // If driver does not exist, show error message
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Driver does not exist')),
//           );
//         }
//       } catch (error) {
//         // Log any errors that occur during the process
//         print('Error occurred while checking for driver: $error');
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('An error occurred while checking for driver')),
//         );
//       }
//     } else {
//       // Show error message if phone number is empty
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please enter your phone number')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => UserTypeSelectionPage()),
//             );
//           },
//         ),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Logo
//               Container(
//                 width: 150.0,
//                 height: 150.0,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Color(0xff260e69),
//                 ),
//                 child: Icon(
//                   Icons.directions_car,
//                   size: 100.0,
//                   color: Colors.white,
//                 ),
//               ),
//               SizedBox(height: 30.0),
//               // Phone number field
//               TextField(
//                 controller: phoneNumberController,
//                 keyboardType: TextInputType.phone,
//                 decoration: InputDecoration(
//                   hintText: 'Phone Number',
//                   prefixIcon: Icon(Icons.phone),
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               // Login button
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     _handleLogin(context);
//                   },
//                   child: Text('Login'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }