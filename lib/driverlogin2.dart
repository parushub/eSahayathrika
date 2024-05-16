// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:saha_new/otp.dart';
// import 'dart:developer';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:saha_new/Driverlast.dart';
// import 'package:saha_new/driverlogin2.dart';
// import 'package:saha_new/popup.dart';
// import 'package:saha_new/uord.dart';
//
// class DriverLoginPage extends StatelessWidget {
//   final TextEditingController _phoneNumberController = TextEditingController();
//
//   Future<void> _verifyPhoneNumber(BuildContext context) async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     String phoneNumber = _phoneNumberController.text.trim();
//     try {
//       await auth.verifyPhoneNumber(
//         phoneNumber: phoneNumber,
//         verificationCompleted: (PhoneAuthCredential credential) {
//           // Auto-retrieval or instant verification completed
//           // Sign in with the phone authentication credential
//           auth.signInWithCredential(credential);
//         },
//         verificationFailed: (FirebaseAuthException e) {
//           // Verification failed
//           print('Verification failed: ${e.message}');
//         },
//         codeSent: (String verificationId, int? resendToken) {
//           // Code sent to the phone number
//           // Navigate to the OTP verification page
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => OtpVerificationPage(verificationId: verificationId),
//             ),
//           );
//         },
//         codeAutoRetrievalTimeout: (String verificationId) {
//           // Auto-retrieval timeout
//         },
//       );
//     } catch (e) {
//       print('Error occurred while initiating phone verification: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Phone Authentication'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _phoneNumberController,
//               keyboardType: TextInputType.phone,
//               decoration: InputDecoration(labelText: 'Phone Number'),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () => _verifyPhoneNumber(context),
//               child: Text('Verify Phone Number'),
//             ),
//             // ElevatedButton(
//             //     onPressed: () async{
//             //       await FirebaseAuth.instance.verifyPhoneNumber(verificationCompleted: (PhoneAuthCredential credential){}, verificationFailed: verificationFailed, codeSent: codeSent, codeAutoRetrievalTimeout: codeAutoRetrievalTimeout)
//             //     }),
//           ],
//         ),
//       ),
//     );
//   }
// }
