import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:saha_new/home.dart';
import 'package:saha_new/login.dart';
import 'package:saha_new/login1.dart';
// import 'package:sample/home.dart';
// import 'package:sample/uihelper.dart';
// import 'package:sample/login.dart';
// Make sure to import the LoginPage if it's used

// Declare text editing controllers
final TextEditingController nameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State
{
  get http => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up Page"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo
          Container(
            width: 150.0,
            height: 150.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff260e69), // Change color as needed
            ),
            child: Icon(
              Icons.account_circle,
              size: 100.0,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 30.0),
          // Name field
          TextField(
            controller: nameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Name',
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20.0),
          // Email field
          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Email',
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20.0),
          // Password field
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20.0),
          // Confirm Password field
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Confirm Password',
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20.0),
          // Sign up button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                bool signupSuccess = false;
                try {
                  _handleSignUp(context);
                  signupSuccess = true; // Set flag to true on success
                } catch (e) {
                  // Handle sign up errors
                  print('Error: $e');
                }

                if (signupSuccess) {
                  // Show success message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Sign Up Successful!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                  // Navigate to login page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                }
              },
              child: Text('Sign Up'),
            ),
          ),

          SizedBox(height: 10.0),
          // Already have an account? Login button
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              ); // Navigate to login page
            },
            child: Text('Already have an account? Login'),
          ),
        ],
      ),
    );
  }

  // Function to handle sign up

  // Function to handle sign up
  void _handleSignUp(BuildContext context) async {

    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    try {
      // Extract email and password from text editing controllers
      String email = emailController.text;
      String password = passwordController.text;
      String name = nameController.text; // Added for name extraction

      // Create user with email and password
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the user ID
      String userId = userCredential.user!.uid;

      // Store additional details in Firestore
      await _firestore.collection('users').doc(userId).set({
        'name': name,
        'email': email,
        // Add more fields if needed
      });

      // Send HTTP POST request to your Node.js backend API endpoint
      final response = await http.post(
        Uri.parse('http://localhost:3000/signup'),
        body: {
          'name': name,
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // Signup successful, handle response
        print('Signup successful');
      } else {
        // Signup failed, handle error
        print('Signup failed: ${response.body}');
        // You can show an error message to the user if sign up fails
      }

      // Navigate to the home page with user instance
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => HomePage(),
      //   ),
      // );
    } catch (e) {
      // Handle sign up errors
      print('Error: $e');
      // You can show an error message to the user if sign up fails
    }
  }
}