// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:saha_new/home.dart';
// import 'package:saha_new/signup.dart';
// import 'package:saha_new/signup1.dart';
// import 'package:http/http.dart' as http;
//
//
// class LoginPage extends StatefulWidget {
//
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final Map<String, dynamic> userData; // Define userData as a parameter
//
//   LoginPage({required this.userData});
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context); // Go back to previous screen
//           },
//         ),
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
//                 controller: emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                   hintText: 'Email',
//                   prefixIcon: Icon(Icons.email),
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               TextField(
//                 controller: passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   hintText: 'Password',
//                   prefixIcon: Icon(Icons.lock),
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     //_handleLogin(context);
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => HomePage(userData: userData)),
//                     );
//                   },
//                   child: Text('Login'),
//                 ),
//               ),
//               SizedBox(height: 10.0),
//               TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => SignUpPage()),
//                   );
//                 },
//                 child: Text('New User? Create an account!'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
// //   void _handleLogin(BuildContext context) async {
// //     String email = emailController.text.trim();
// //     String password = passwordController.text.trim();
// //
// //     // Check if email and password are not empty
// //     if (email.isNotEmpty && password.isNotEmpty) {
// //       // Query Firestore for user with the entered email
// //       QuerySnapshot querySnapshot = await FirebaseFirestore.instance
// //           .collection('users')
// //           .where('email', isEqualTo: email)
// //           .get();
// //
// //       // Check if user with the entered email exists
// //       if (querySnapshot.docs.isNotEmpty) {
// //         // Get the first document (assuming there's only one user with the same email)
// //         var userData = querySnapshot.docs.first.data();
// //
// //         // Check if the entered password matches the password stored in Firestore
// //         if ((userData as Map<String, dynamic>)?['password'] == password) {
// //           // Navigate to the home page
// //           Navigator.pushReplacement(
// //             context,
// //             MaterialPageRoute(builder: (context) =>
// //                 HomePage(userData: userData as Map<String, dynamic>)),
// //           );
// //
// //           // Here userData is the user instance that you can use throughout the app
// //
// //           // Now, send the HTTP request to your backend
// //           http.Response response = await http.post(
// //             Uri.parse('http://127.0.0.1:3000/esahaserver'),
// //             body: {
// //               'email': email,
// //               'password': password,
// //             },
// //           );
// //
// //           // Handle response according to your application's logic
// //           if (response.statusCode == 200) {
// //             // Successful request
// //             print('Login request successful');
// //           } else {
// //             // Request failed
// //             print('Login request failed with status code: ${response
// //                 .statusCode}');
// //           }
// //         } else {
// //           // Password does not match
// //           ScaffoldMessenger.of(context).showSnackBar(
// //             SnackBar(content: Text('Incorrect password')),
// //           );
// //         }
// //       } else {
// //         // User with the entered email does not exist
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           SnackBar(content: Text('User does not exist')),
// //         );
// //       }
// //     } else {
// //       // Email or password is empty
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('Please enter email and password')),
// //       );
// //     }
// //   }
// // }
//
// }
