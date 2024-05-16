// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:saha_new/driverdetail2.dart';
//
// class OtpVerificationPage extends StatefulWidget {
//   final String verificationId;
//
//   OtpVerificationPage({required this.verificationId});
//
//   @override
//   _OtpVerificationPageState createState() => _OtpVerificationPageState();
// }
//
// class _OtpVerificationPageState extends State<OtpVerificationPage> {
//   final TextEditingController _otpController = TextEditingController();
//
//   void _verifyOtp() async {
//     String otp = _otpController.text.trim();
//     if (otp.isNotEmpty) {
//       try {
//         // Check if OTP is of correct length
//         if (otp.length == 6) {
//           // Create a PhoneAuthCredential with the verification ID and OTP
//           PhoneAuthCredential credential = PhoneAuthProvider.credential(
//             verificationId: widget.verificationId,
//             smsCode: otp,
//           );
//
//           // Sign in with the phone authentication credential
//           await FirebaseAuth.instance.signInWithCredential(credential);
//
//           // Navigate to the next screen after successful sign-in
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => DriverPage()),
//           );
//         } else {
//           // Handle invalid OTP length
//           print('Invalid OTP length');
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Invalid OTP. Please enter a 6-digit code.')),
//           );
//         }
//       } catch (e) {
//         print('Error occurred while verifying OTP: $e');
//         // Handle the error as needed
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Failed to sign in. Please try again.')),
//         );
//       }
//     } else {
//       // Handle empty OTP
//       print('OTP is empty');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please enter the OTP')),
//       );
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('OTP Verification'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _otpController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(labelText: 'Enter OTP'),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: _verifyOtp,
//               child: Text('Verify OTP'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
