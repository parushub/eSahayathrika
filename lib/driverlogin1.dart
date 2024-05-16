// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:saha_new/driverdetail.dart';
// //import 'package:saha_new/driverhome.dart'; // Import your driver home page
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class DriverLoginPage extends StatefulWidget {
//   @override
//   _DriverLoginPageState createState() => _DriverLoginPageState();
// }
//
// class _DriverLoginPageState extends State<DriverLoginPage> {
//   final TextEditingController phoneNumberController = TextEditingController();
//
//   Future<void> _handleLogin(BuildContext context) async {
//     try {
//       String phoneNumber = phoneNumberController.text.trim();
//
//       // Check if phone number is not empty
//       if (phoneNumber.isNotEmpty) {
//         // Query Firestore to check if the driver with the given phone number exists
//         QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
//             .collection('Drivers')
//             .where('phone', isEqualTo: phoneNumber)
//             .get();
//
//         // Check if any documents match the phone number
//         if (querySnapshot.docs.isNotEmpty) {
//           // If driver exists, navigate to driver home page
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => DriverPage()),
//           );
//         } else {
//           // If driver does not exist, show error message
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Driver does not exist')),
//           );
//         }
//       } else {
//         // Show error message if phone number is empty
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Please enter your phone number')),
//         );
//       }
//     } catch (e) {
//       // Show snackbar with error message if login fails
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString())),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false, // Disable back arrow
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 width: 150.0,
//                 height: 150.0,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Color(0xff260e69),
//                 ),
//                 child: Icon(
//                   Icons.account_circle,
//                   size: 100.0,
//                   color: Colors.white,
//                 ),
//               ),
//               SizedBox(height: 30.0),
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
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     _handleLogin(context); // Handle login
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
