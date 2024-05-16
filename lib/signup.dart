// import 'package:flutter/material.dart';
// import 'package:saha_new/home.dart';
// //import 'package:esahayathrika/login.dart';
// import 'package:saha_new/login.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:http/http.dart' as http;
//
//
// // Declare text editing controllers
// final TextEditingController nameController = TextEditingController();
// final TextEditingController emailController = TextEditingController();
// final TextEditingController passwordController = TextEditingController();
//
// class SignUpPage extends StatefulWidget {
//   @override
//   _SignUpPageState createState() => _SignUpPageState();
// }
//
// class _SignUpPageState extends State<SignUpPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
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
//                   color: Color(0xff260e69), // Change color as needed
//                 ),
//                 child: Icon(
//                   Icons.account_circle,
//                   size: 100.0,
//                   color: Colors.white,
//                 ),
//               ),
//               SizedBox(height: 30.0),
//               // Name field
//               TextField(
//                 keyboardType: TextInputType.text,
//                 decoration: InputDecoration(
//                   hintText: 'Name',
//                   prefixIcon: Icon(Icons.person),
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               // Email field
//               TextField(
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                   hintText: 'Email',
//                   prefixIcon: Icon(Icons.email),
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               // Password field
//               TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   hintText: 'Password',
//                   prefixIcon: Icon(Icons.lock),
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               // Confirm Password field
//               TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   hintText: 'Confirm Password',
//                   prefixIcon: Icon(Icons.lock),
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               // Sign up button
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     _handleSignUp(context);
//                     // Handle sign up functionality
//                   },
//                   child: Text('Sign Up'),
//                 ),
//               ),
//               SizedBox(height: 10.0),
//               // Already have an account? Login button
//               TextButton(
//                 onPressed: () {
//                   // Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(builder: (context) => LoginPage()),
//                   // ); // Navigate to login page
//                 },
//                 child: Text('Already have an account? Login'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Function to handle sign up
//
//
//   // Function to handle sign up
//   void _handleSignUp(BuildContext context) async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//
//     try {
//       // Extract email and password from text editing controllers
//       String email = emailController.text;
//       String password = passwordController.text;
//       String name = nameController.text; // Added for name extraction
//
//       // Create user with email and password
//       UserCredential userCredential = await auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//
//       // Get the user ID
//       String userId = userCredential.user!.uid;
//
//       // Store additional details in Firestore
//       await firestore.collection('users').doc(userId).set({
//         'name': name,
//         'email': email,
//         // Add more fields if needed
//       });
//
//       // Send HTTP POST request to your Node.js backend API endpoint
//       final response = await http.post(
//         Uri.parse('http://localhost:3000/signup'),
//         body: {
//           'name': name,
//           'email': email,
//           'password': password,
//         },
//       );
//
//       if (response.statusCode == 200) {
//         // Signup successful, handle response
//         print('Signup successful');
//       } else {
//         // Signup failed, handle error
//         print('Signup failed: ${response.body}');
//         // You can show an error message to the user if sign up fails
//       }
//
//       // Navigate to the home page with user instance
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => HomePage(user: userCredential.user),
//         ),
//       );
//     } catch (e) {
//       // Handle sign up errors
//       print('Error: $e');
//       // You can show an error message to the user if sign up fails
//     }
//   }
//
// }
